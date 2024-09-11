#include <iostream>
#include <queue>
#include <cmath>
#include <array>
#include <filesystem>
#include <fstream>
#include <cctype>
#include <algorithm>
#include <stdexcept>
#include <vector>
#include <ranges>
#include <cassert>
#include <string.h>


auto distance_scores = std::array<int, 256>();
auto unigram_scores = std::array<int, 256>();
auto bigram_scores = std::array<std::array<int, 256>, 256>();


/**
*/
auto init_score_matrix() -> void {
    auto s = std::string("` \n\t\r~!@#$%^&*()_+-=[]{};':\",.<>/?\\|\0");
    for (int j = 0; j < 256; ++j) {
        for (int k = 0; k < 256; ++k) {
            bigram_scores[j][k] = 0;
        }
    }
    for (const auto c : s) {
        for (int k = 0; k < 256; ++k) {
            bigram_scores[c][k] = 1;
        }
    }
    for (const auto c : s) {
        for (int k = 0; k < 256; ++k) {
            bigram_scores[k][c] = 1;
        }
    }

    auto u = std::string("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
    for (int j = 0; j < 256; ++j) {
        unigram_scores[j] = 0;
    }
    for (const auto c : s) {
        unigram_scores[c] = 1;
    }

    for (int j = 0; j < 256; ++j) {
        distance_scores[j] = 10 * std::exp(-(std::pow((j - 1.0), 2)) / 9.0);
    }
    distance_scores[0] = distance_scores[1];
}


/**
*/
auto append_occurences(std::vector<int>& g, const std::string& x, size_t x_offset, size_t end, char c) -> void {
    for (size_t k = x_offset; k < end; ++k) {
        if ((k = x.find(c, k)) == std::string::npos) {
            break;
        }
        g.push_back(k);
    }
}


/**
*/
auto reconstruct_path(
        std::vector<int>& path,
        const std::vector<std::vector<int>>& graph,
        std::vector<std::vector<std::array<int, 2>>>& scores,
        const std::vector<int>& lengths
        ) -> int {
    if (scores.empty()) {
        return -1;
    }
    if (lengths.size() != graph.size()) {
        throw std::invalid_argument("Lengths and graph must have the same number of rows.");
    }
    int max_idx = 0;
    for (int j = 0, n = lengths[lengths.size() - 1]; j < n; ++j) {
        if (scores.back()[j][0] > scores.back()[max_idx][0]) {
            max_idx = j;
        }
    }
    int last_idx = max_idx;
    for (int j = scores.size() - 1; j > -1; --j) {
        path[j] = graph[j][max_idx];
        max_idx = scores[j][max_idx][1];
    }
    return scores.back()[last_idx][0];
}


/**
*/
inline auto score_single_node(int j, const std::string& x) -> int {
    // Formula:
    //   is_prefix + is_suffix + is_upper
    if (x.empty()) {
        return 0;
    }
    if ((0 < j) and (j < (x.size() - 1))) {
        //return 0 + (std::isupper(x[j]) ? 1 : 0);
        return unigram_scores[x[j]] + bigram_scores[x[j]][x[j + 1]] + bigram_scores[x[j - 1]][x[j]];
    }
    if ((j < 0) or (j >= x.size())) {
        return 0;
    }
    if (x.size() == 1) {
        // 2 for prefix and suffix.
        return unigram_scores[x[j]] + 2;
    }
    if (j == 0) {
        //return 1 + (std::isupper(x[j]) ? 1 : 0);
        return unigram_scores[x[j]] + bigram_scores[x[j]][x[j + 1]];
    }
    if (j == (x.size() - 1)) {
        //return 1 + (std::isupper(x[j]) ? 1 : 0);
        return unigram_scores[x[j]] + bigram_scores[x[j - 1]][x[j]];
    }
    return unigram_scores[x[j]];
}




/**
*/
auto score_layer_zero(
        std::vector<std::vector<std::array<int, 2>>>& scores,
        const std::vector<std::vector<int>>& graph,
        const std::vector<int>& lengths,
        const std::string& x
        ) -> void {
    for (int j = 0, n = lengths[0]; j < n; ++j) {
        scores[0][j][0] = score_single_node(graph[0][j], x);
        scores[0][j][1] = 0;
    }
}


/**
*/
inline auto score_joint_nodes(int j, int k, const std::string& x) -> int {
    int d = j - k;
    if ((d < 0) or (d > 255)) {
        return 0;
    }
    return distance_scores[d];
}



/**
*/
auto score_nodes(
        std::vector<std::vector<std::array<int, 2>>>& scores,
        const std::vector<std::vector<int>>& graph,
        int j,
        int m,
        const std::string& x,
        const std::vector<int>& lengths
        ) -> void {
    for (int r = 0, n1 = lengths[j], n2 = lengths[j - 1]; r < n1; ++r) {
        auto& ss = graph[j][r];
        auto& sss = scores[j][r];
        for (; m < n2; ++m) {
            if (graph[j - 1][m] >= ss) {
                break;
            }
            int s = score_joint_nodes(ss, graph[j - 1][m], x);
            if (sss[0] < s) {
                sss[0] = s;
                sss[1] = m;
            }
        }
    }
}



/**
*/
auto score_layer(
        const std::vector<std::vector<int>>& graph,
        std::vector<std::vector<std::array<int, 2>>>& scores,
        int j,
        const std::vector<int>& lengths,
        const std::string& x
        ) -> void {
    if (graph.empty()) {
        return;
    }
    if (scores.empty()) {
        return;
    }
    if ((j < 0) or (j >= graph.size())) {
        return;
    }
    if (lengths.size() != graph.size()) {
        throw std::invalid_argument("Lengths and graph must have the same number of rows.");
    }
    if (j == 0) {
        return score_layer_zero(scores, graph, lengths, x);
    }
    auto& S = scores[j];
    score_nodes(scores, graph, j, 0, x, lengths);
    for (int k = 1, n = lengths[j]; k < n; ++k) {
        int s = score_joint_nodes(graph[j][k], graph[j - 1][S[k - 1][1]], x);
        S[k][0] = S[k][0] > s ? S[k][0] : s;
        S[k][1] = S[k][0] > s ? S[k][1] : S[k - 1][1];
    }
    for (int k = 0, n = lengths[j]; k < n; ++k) {
        S[k][0] += scores[j - 1][S[k][1]][0];
    }
    for (int k = 0, n = lengths[j]; k < n; ++k) {
        S[k][0] += score_single_node(graph[j][k], x);
    }
}


/**
*/
auto score_graph(
        std::vector<int>& path,
        std::vector<std::vector<std::array<int, 2>>>& scores,
        const std::vector<std::vector<int>>& graph,
        const std::vector<int>& lengths,
        const std::string& x
        ) -> int {
    for (int j = 0, n = graph.size(); j < n; ++j) {
        score_layer(graph, scores, j, lengths, x);
    }
    return reconstruct_path(path, graph, scores, lengths);
}


/**
*/
auto prune(
        const std::vector<std::vector<int>>& graph,
        std::vector<int>& lengths
        ) -> void {
    if (graph.empty()) {
        return;
    }
    if (lengths.empty()) {
        return;
    }
    if (lengths.size() != graph.size()) {
        throw std::invalid_argument("Lengths and graph must have the same number of rows.");
    }
    lengths[lengths.size() - 1] = graph[graph.size() - 1].size();
    for (int j = graph.size() - 2; j > -1; --j) {
        auto g = graph[j + 1][lengths[j + 1] - 1];
        for (int k = graph[j].size() - 1; k > -1; --k) {
            if (graph[j][k] < g) {
                lengths[j] = k + 1;
                break;
            }
        }
    }
}


template<class T>
auto reset_matrix(std::vector<T>& x, const std::vector<int>& lengths) -> void {
    for (size_t j = 0, n = x.size(); j < n; ++j) {
        x[j].clear();
        x[j].reserve(lengths[j]);
    }
}


/**
*/
auto find_start(const std::string& x, const std::string& q) -> size_t {
    size_t  notfound_idx = std::string::npos;
    if (x.empty()) {
        return notfound_idx;
    }
    if (q.empty()) {
        return notfound_idx;
    }
    if (x.size() <= q.size()) {
        return notfound_idx;
    }
    size_t k = -1;
    size_t beg = notfound_idx;
    for (size_t j = 0, n = q.size(); j < n; ++j) {
        if ((k = x.find(q[j], k + 1)) == std::string::npos) {
            return notfound_idx;
        }
        if (j == 0) {
            beg = k;
        }
    }
    return beg;
}


/**
*/
auto graph_subseqs(
        std::vector<std::vector<int>>& graph,
        const std::vector<int>& lengths,
        const std::string& x,
        const std::string& q,
        size_t x_offset
        ) -> void
{
    if (x.empty()) {
        return;
    }
    if (q.empty()) {
        return;
    }
    if ((x_offset >= x.size()) or (x_offset < 0)) {
        return;
    }
    reset_matrix(graph, lengths);
    for (size_t j = 0, n = q.size(), m = x.size(); j < n; ++j) {
        append_occurences(graph[j], x, x_offset, m, q[j]);
        if (graph[j].empty()) {
            return;
        }
        x_offset = graph[j][0] + 1;
    }
}


/**
*/
class Graph {

    /**
    */
    public: explicit Graph(std::string query);
    public: auto init_scores() -> void;
    public: auto find(const std::string& x) -> int;

    private: auto assert_invariants() -> void;
    private: std::string query;
    private: std::vector<std::vector<int>> graph;
    private: std::vector<std::vector<std::array<int, 2>>> scores;
    private: std::vector<int> path;
    private: std::vector<int> lengths;
    private: friend std::ostream& operator<<(std::ostream&, const Graph&);
};


/**
 * Constructor.
*/
Graph::Graph(std::string query)
    : query(query)
    , graph(query.size())
    , scores(query.size())
    , path(query.size())
    , lengths(query.size())
{
    if (query.size() < 1) {
        throw std::invalid_argument("Query cannot be empty.");
    }
    std::ranges::for_each(this->graph, [&](auto& x) {x.reserve(128);});
    std::ranges::for_each(this->scores, [&](auto& x) {x.reserve(128);});
    std::ranges::fill(this->path, 0);
    std::ranges::fill(this->lengths, 0);

    this->assert_invariants();
}


/**
*/
auto Graph::assert_invariants() -> void {
    assert(this->query.size() > 0);
    assert(this->graph.size() == this->query.size());
    assert(this->scores.size() == this->query.size());
    assert(this->path.size() == this->query.size());
    assert(this->lengths.size() == this->query.size());
}


/**
*/
auto Graph::init_scores() -> void {
    for (size_t j = 0, n = this->scores.size(); j < n; ++j) {
        if (int d = this->lengths[j] - this->scores[j].size(); d > 0) {
            this->scores[j].reserve(this->lengths[j]);
            for (size_t k = 0; k < d; ++k) {
                this->scores[j].push_back({0, 0});
            }
        }
        for (size_t k = 0, m = this->lengths[j]; k < m; ++k) {
            this->scores[j][k][0] = 0;
            this->scores[j][k][1] = 0;
        }
    }
}


auto Graph::find(const std::string& x) -> int {
    this->assert_invariants();
    size_t offset = find_start(x, this->query);
    if (offset == std::string::npos) {
        return -1;
    }
    graph_subseqs(this->graph, this->lengths, x, this->query, offset);
    prune(this->graph, this->lengths);
    this->init_scores();
    return score_graph(this->path, this->scores, this->graph, this->lengths, x);
}


std::ostream& operator<<(std::ostream &s, const Graph &g) {
    s << "Lengths:\n  ";
    std::ranges::for_each(g.lengths, [&](auto& x) { s << x << " "; });
    s << "\nGraph:";
    for (int j = 0; j < g.graph.size(); ++j) {
        s << "\n  ";
        for (int k = 0; k < g.lengths[j]; ++k) {
            s << g.graph[j][k] << " ";
        }
    }
    s << "\nScores:";
    for (int j = 0; j < g.scores.size(); ++j) {
        s << "\n  ";
        for (int k = 0; k < g.lengths[j]; ++k) {
            s << "(";
            s << g.scores[j][k][0] << ", ";
            s << g.scores[j][k][1] << ") ";
        }
    }
    s << "\nPath:\n  ";
    std::ranges::for_each(g.path, [&](auto& x) { s << x << " "; });
    return s;
}


auto main(int argc, char *argv[]) -> int {
    init_score_matrix();
    auto f = [&](const auto& a, const auto& b) {
            return std::get<0>(a) < std::get<0>(b);
            };
    auto heap = std::priority_queue<std::tuple<int, int>, std::vector<std::tuple<int, int>>, decltype(f)>(f);
    if (heap.size() < max_len) {
        heap.push(elem);
        return;
    }
    if (std::get<0>(elem) > std::get<0>(heap.top())){
        heap.pop();
        heap.push(elem);
    }

    auto x = std::string("hello world elowol");
    auto q = std::string("ell");
    q = std::string("elowol");
    //q = std::string("local");
    auto g = Graph(q);
    auto score = g.find(x);
    std::cout << g << std::endl;
    std::cout << score << std::endl;
    score = g.find("x = 'hello world elowol'");
    std::cout << g << std::endl;
    std::cout << score << std::endl;
    score = g.find("q = 'elowol'");
    std::cout << g << std::endl;
    std::cout << score << std::endl;
    auto lines = std::vector<std::string>();
    {
        auto fis = std::fstream("s.cpp");
        for (std::string line; std::getline(fis, line);) {
            lines.push_back(line);
        }
    }
    auto scores = std::vector<std::tuple<int, int>>();
    for (const auto [j, line] : lines | std::views::enumerate) {
        scores.push_back({j, g.find(line)});
    }
    std::ranges::sort(scores, [](auto& a, auto& b) {
            return std::get<1>(a) > std::get<1>(b);
            });
    std::cout << std::get<0>(scores.front()) << std::endl;
    for (int j = 0; j < 10; ++j) {
        std::cout << "(" << std::get<0>(scores[j]) << ", " << std::get<1>(scores[j]) << ") ";
    }
    std::cout << std::endl;

    g = Graph("local");
    scores.clear();
    scores.reserve(1 << 13);
    lines.clear();
    lines.reserve(1 << 13);
    for (const auto[j, path] :
            std::filesystem::recursive_directory_iterator(".local")
            | std::views::enumerate
            ) {
        lines.push_back(path.path().string());
    }
    auto t0 = std::chrono::steady_clock::now();
    for (int j = 0; j < 1; ++j) {
    for (const auto[j, path] : lines | std::views::enumerate) {
        scores.push_back({j, g.find(path)});
    }
    }
    auto t1 = std::chrono::steady_clock::now();
    std::chrono::duration<double> init_time = t1 - t0;
    std::cout << scores.size() << std::endl;
    for (int j = 0; j < 10; ++j) {
        std::cout << "(" << std::get<0>(scores[j]) << ", " << std::get<1>(scores[j]) << ") ";
    }
    std::cout << std::endl;
    std::cout << init_time.count() << std::endl;

    return 0;
}
