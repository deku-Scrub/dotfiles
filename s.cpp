//#include <iostream>
//#include <future>
//#include <thread>
//#include <queue>
//#include <cmath>
//#include <array>
//#include <filesystem>
//#include <fstream>
//#include <cctype>
//#include <algorithm>
//#include <stdexcept>
//#include <vector>
//#include <ranges>
//#include <cassert>
//#include <string.h>
//
//#include "readerwritercircularbuffer.h"
//
//
//auto distance_scores = std::array<int, 256>();
//auto unigram_scores = std::array<int, 256>();
//auto bigram_scores = std::array<std::array<int, 256>, 256>();
//
//
///**
//*/
//auto init_score_matrix() -> void {
    //auto s = std::string("` \n\t\r~!@#$%^&*()_+-=[]{};':\",.<>/?\\|\0");
    //for (int j = 0; j < 256; ++j) {
        //for (int k = 0; k < 256; ++k) {
            //bigram_scores[j][k] = 0;
        //}
    //}
    //for (const auto c : s) {
        //for (int k = 0; k < 256; ++k) {
            //bigram_scores[c][k] = 1;
        //}
    //}
    //for (const auto c : s) {
        //for (int k = 0; k < 256; ++k) {
            //bigram_scores[k][c] = 1;
        //}
    //}
//
    //auto u = std::string("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
    //for (int j = 0; j < 256; ++j) {
        //unigram_scores[j] = 0;
    //}
    //for (const auto c : s) {
        //unigram_scores[c] = 1;
    //}
//
    //for (int j = 0; j < 256; ++j) {
        //distance_scores[j] = 10 * std::exp(-(std::pow((j - 1.0), 2)) / 9.0);
    //}
    //distance_scores[0] = distance_scores[1];
//}
//
//
///**
//*/
//auto append_occurences(std::vector<int>& g, const std::string& x, size_t x_offset, size_t end, char c) -> void {
    //for (size_t k = x_offset; k < end; ++k) {
        //if ((k = x.find(c, k)) == std::string::npos) {
            //break;
        //}
        //g.push_back(k);
    //}
//}
//
//
///**
//*/
//auto reconstruct_path(
        //std::vector<int>& path,
        //const std::vector<std::vector<int>>& graph,
        //std::vector<std::vector<std::array<int, 2>>>& scores,
        //const std::vector<int>& lengths
        //) -> int {
    //if (scores.empty()) {
        //return -1;
    //}
    //if (lengths.size() != graph.size()) {
        //throw std::invalid_argument("Lengths and graph must have the same number of rows.");
    //}
    //int max_idx = 0;
    //for (int j = 0, n = lengths[lengths.size() - 1]; j < n; ++j) {
        //if (scores.back()[j][0] > scores.back()[max_idx][0]) {
            //max_idx = j;
        //}
    //}
    //int last_idx = max_idx;
    //for (int j = scores.size() - 1; j > -1; --j) {
        //path[j] = graph[j][max_idx];
        //max_idx = scores[j][max_idx][1];
    //}
    //return scores.back()[last_idx][0];
//}
//
//
///**
//*/
//inline auto score_single_node(int j, const std::string& x) -> int {
    //// Formula:
    ////   is_prefix + is_suffix + is_upper
    //if (x.empty()) {
        //return 0;
    //}
    //if ((0 < j) and (j < (x.size() - 1))) {
        ////return 0 + (std::isupper(x[j]) ? 1 : 0);
        //return unigram_scores[x[j]] + bigram_scores[x[j]][x[j + 1]] + bigram_scores[x[j - 1]][x[j]];
    //}
    //if ((j < 0) or (j >= x.size())) {
        //return 0;
    //}
    //if (x.size() == 1) {
        //// 2 for prefix and suffix.
        //return unigram_scores[x[j]] + 2;
    //}
    //if (j == 0) {
        ////return 1 + (std::isupper(x[j]) ? 1 : 0);
        //return unigram_scores[x[j]] + bigram_scores[x[j]][x[j + 1]];
    //}
    //if (j == (x.size() - 1)) {
        ////return 1 + (std::isupper(x[j]) ? 1 : 0);
        //return unigram_scores[x[j]] + bigram_scores[x[j - 1]][x[j]];
    //}
    //return unigram_scores[x[j]];
//}
//
//
//
//
///**
//*/
//auto score_layer_zero(
        //std::vector<std::vector<std::array<int, 2>>>& scores,
        //const std::vector<std::vector<int>>& graph,
        //const std::vector<int>& lengths,
        //const std::string& x
        //) -> void {
    //for (int j = 0, n = lengths[0]; j < n; ++j) {
        //scores[0][j][0] = score_single_node(graph[0][j], x);
        //scores[0][j][1] = 0;
    //}
//}
//
//
///**
//*/
//inline auto score_joint_nodes(int j, int k, const std::string& x) -> int {
    //int d = j - k;
    //if ((d < 0) or (d > 255)) {
        //return 0;
    //}
    //return distance_scores[d];
//}
//
//
//
///**
//*/
//auto score_nodes(
        //std::vector<std::vector<std::array<int, 2>>>& scores,
        //const std::vector<std::vector<int>>& graph,
        //int j,
        //int m,
        //const std::string& x,
        //const std::vector<int>& lengths
        //) -> void {
    //for (int r = 0, n1 = lengths[j], n2 = lengths[j - 1]; r < n1; ++r) {
        //auto& ss = graph[j][r];
        //auto& sss = scores[j][r];
        //for (; m < n2; ++m) {
            //if (graph[j - 1][m] >= ss) {
                //break;
            //}
            //int s = score_joint_nodes(ss, graph[j - 1][m], x);
            //if (sss[0] < s) {
                //sss[0] = s;
                //sss[1] = m;
            //}
        //}
    //}
//}
//
//
//
///**
//*/
//auto score_layer(
        //const std::vector<std::vector<int>>& graph,
        //std::vector<std::vector<std::array<int, 2>>>& scores,
        //int j,
        //const std::vector<int>& lengths,
        //const std::string& x
        //) -> void {
    //if (graph.empty()) {
        //return;
    //}
    //if (scores.empty()) {
        //return;
    //}
    //if ((j < 0) or (j >= graph.size())) {
        //return;
    //}
    //if (lengths.size() != graph.size()) {
        //throw std::invalid_argument("Lengths and graph must have the same number of rows.");
    //}
    //if (j == 0) {
        //return score_layer_zero(scores, graph, lengths, x);
    //}
    //auto& S = scores[j];
    //score_nodes(scores, graph, j, 0, x, lengths);
    //for (int k = 1, n = lengths[j]; k < n; ++k) {
        //int s = score_joint_nodes(graph[j][k], graph[j - 1][S[k - 1][1]], x);
        //S[k][0] = S[k][0] > s ? S[k][0] : s;
        //S[k][1] = S[k][0] > s ? S[k][1] : S[k - 1][1];
    //}
    //for (int k = 0, n = lengths[j]; k < n; ++k) {
        //S[k][0] += scores[j - 1][S[k][1]][0];
    //}
    //for (int k = 0, n = lengths[j]; k < n; ++k) {
        //S[k][0] += score_single_node(graph[j][k], x);
    //}
//}
//
//
///**
//*/
//auto score_graph(
        //std::vector<int>& path,
        //std::vector<std::vector<std::array<int, 2>>>& scores,
        //const std::vector<std::vector<int>>& graph,
        //const std::vector<int>& lengths,
        //const std::string& x
        //) -> int {
    //for (int j = 0, n = graph.size(); j < n; ++j) {
        //score_layer(graph, scores, j, lengths, x);
    //}
    //return reconstruct_path(path, graph, scores, lengths);
//}
//
//
///**
//*/
//auto prune(
        //const std::vector<std::vector<int>>& graph,
        //std::vector<int>& lengths
        //) -> void {
    //if (graph.empty()) {
        //return;
    //}
    //if (lengths.empty()) {
        //return;
    //}
    //if (lengths.size() != graph.size()) {
        //throw std::invalid_argument("Lengths and graph must have the same number of rows.");
    //}
    //lengths[lengths.size() - 1] = graph[graph.size() - 1].size();
    //for (int j = graph.size() - 2; j > -1; --j) {
        //auto g = graph[j + 1][lengths[j + 1] - 1];
        //for (int k = graph[j].size() - 1; k > -1; --k) {
            //if (graph[j][k] < g) {
                //lengths[j] = k + 1;
                //break;
            //}
        //}
    //}
//}
//
//
//template<class T>
//auto reset_matrix(std::vector<T>& x, const std::vector<int>& lengths) -> void {
    //for (size_t j = 0, n = x.size(); j < n; ++j) {
        //x[j].clear();
        //x[j].reserve(lengths[j]);
    //}
//}
//
//
///**
//*/
//auto find_start(const std::string& x, const std::string& q) -> size_t {
    //size_t  notfound_idx = std::string::npos;
    //if (x.empty()) {
        //return notfound_idx;
    //}
    //if (q.empty()) {
        //return notfound_idx;
    //}
    //if (x.size() <= q.size()) {
        //return notfound_idx;
    //}
    //size_t k = -1;
    //size_t beg = notfound_idx;
    //for (size_t j = 0, n = q.size(); j < n; ++j) {
        //if ((k = x.find(q[j], k + 1)) == std::string::npos) {
            //return notfound_idx;
        //}
        //if (j == 0) {
            //beg = k;
        //}
    //}
    //return beg;
//}
//
//
///**
//*/
//auto graph_subseqs(
        //std::vector<std::vector<int>>& graph,
        //const std::vector<int>& lengths,
        //const std::string& x,
        //const std::string& q,
        //size_t x_offset
        //) -> void
//{
    //if (x.empty()) {
        //return;
    //}
    //if (q.empty()) {
        //return;
    //}
    //if ((x_offset >= x.size()) or (x_offset < 0)) {
        //return;
    //}
    //reset_matrix(graph, lengths);
    //for (size_t j = 0, n = q.size(), m = x.size(); j < n; ++j) {
        //append_occurences(graph[j], x, x_offset, m, q[j]);
        //if (graph[j].empty()) {
            //return;
        //}
        //x_offset = graph[j][0] + 1;
    //}
//}
//
//
///**
//*/
//struct MatchInfo {
    //public: int score;
    //// TODO: probably needs to be copied to array since the underlying
    //// data can change.
    //public: std::span<const int> path;
//};
//
//
///**
//*/
//class Graph {
//
    ///**
    //*/
    //public: explicit Graph(std::string query);
    //public: auto init_scores() -> void;
    //public: auto find(const std::string& x) -> MatchInfo;
//
    //private: auto assert_invariants() -> void;
    //private: std::string query;
    //private: std::vector<std::vector<int>> graph;
    //private: std::vector<std::vector<std::array<int, 2>>> scores;
    //private: std::vector<int> path;
    //private: std::vector<int> lengths;
    //private: friend std::ostream& operator<<(std::ostream&, const Graph&);
//};
//
//
///**
 //* Constructor.
//*/
//Graph::Graph(std::string query)
    //: query(query)
    //, graph(query.size())
    //, scores(query.size())
    //, path(query.size())
    //, lengths(query.size())
//{
    //if (query.size() < 1) {
        //throw std::invalid_argument("Query cannot be empty.");
    //}
    //std::ranges::for_each(this->graph, [&](auto& x) {x.reserve(128);});
    //std::ranges::for_each(this->scores, [&](auto& x) {x.reserve(128);});
    //std::ranges::fill(this->path, 0);
    //std::ranges::fill(this->lengths, 0);
//
    //this->assert_invariants();
//}
//
//
///**
//*/
//auto Graph::assert_invariants() -> void {
    //assert(this->query.size() > 0);
    //assert(this->graph.size() == this->query.size());
    //assert(this->scores.size() == this->query.size());
    //assert(this->path.size() == this->query.size());
    //assert(this->lengths.size() == this->query.size());
//}
//
//
///**
//*/
//auto Graph::init_scores() -> void {
    //for (size_t j = 0, n = this->scores.size(); j < n; ++j) {
        //if (int d = this->lengths[j] - this->scores[j].size(); d > 0) {
            //this->scores[j].reserve(this->lengths[j]);
            //for (size_t k = 0; k < d; ++k) {
                //this->scores[j].push_back({0, 0});
            //}
        //}
        //for (size_t k = 0, m = this->lengths[j]; k < m; ++k) {
            //this->scores[j][k][0] = 0;
            //this->scores[j][k][1] = 0;
        //}
    //}
//}
//
//
//auto Graph::find(const std::string& x) -> MatchInfo {
    //this->assert_invariants();
    //size_t offset = find_start(x, this->query);
    //if (offset == std::string::npos) {
        //return {-1, {}};
    //}
    //graph_subseqs(this->graph, this->lengths, x, this->query, offset);
    //prune(this->graph, this->lengths);
    //this->init_scores();
    //auto score = score_graph(this->path, this->scores, this->graph, this->lengths, x);
    //return {score, this->path};
//}
//
//
//std::ostream& operator<<(std::ostream &s, const Graph &g) {
    //s << "Lengths:\n  ";
    //std::ranges::for_each(g.lengths, [&](auto& x) { s << x << " "; });
    //s << "\nGraph:";
    //for (int j = 0; j < g.graph.size(); ++j) {
        //s << "\n  ";
        //for (int k = 0; k < g.lengths[j]; ++k) {
            //s << g.graph[j][k] << " ";
        //}
    //}
    //s << "\nScores:";
    //for (int j = 0; j < g.scores.size(); ++j) {
        //s << "\n  ";
        //for (int k = 0; k < g.lengths[j]; ++k) {
            //s << "(";
            //s << g.scores[j][k][0] << ", ";
            //s << g.scores[j][k][1] << ") ";
        //}
    //}
    //s << "\nPath:\n  ";
    //std::ranges::for_each(g.path, [&](auto& x) { s << x << " "; });
    //return s;
//}
//
//
///**
//*/
//template<class T>
//auto update_heap(MatchInfo mi, int row, T& heap, int max_len) -> void {
    //if (heap.size() < max_len) {
        //heap.push({std::move(mi), row});
        //return;
    //}
    //auto min_elem = heap.top();
    //if (mi.score > std::get<0>(min_elem).score){
        //heap.pop();
        //std::get<0>(min_elem) = std::move(mi);
        //std::get<1>(min_elem) = row;
        //heap.push(min_elem);
    //}
//}
//
//
///**
//*/
//auto worker(
        //moodycamel::BlockingReaderWriterCircularBuffer<std::vector<std::string>>& q,
        //const std::string& query,
        //int n_results,
        //std::promise<std::vector<std::tuple<MatchInfo, int>>> results_promise
        //) -> void
//{
    //auto f = [&](const auto& a, const auto& b) {
            //return std::get<0>(a).score > std::get<0>(b).score;
            //};
    //auto heap = std::priority_queue<
        //std::tuple<MatchInfo, int>,
        //std::vector<std::tuple<MatchInfo, int>>,
        //decltype(f)>(f);
//
    //auto graph = Graph(query);
//
    //auto lines = std::vector<std::string>();
    //while (true) {
        //q.wait_dequeue(lines);
//
        //if (lines.empty()) {
            //break;
        //}
//
        //for (const auto& line : lines) {
            //update_heap(std::move(graph.find(line)), 0, heap, n_results);
        //}
    //}
//
    //auto results = std::vector<std::tuple<MatchInfo, int>>();
    //for (; !heap.empty(); heap.pop()) {
        //results.emplace_back(heap.top());
    //}
    //results_promise.set_value(std::move(results));
//}
            //
//
///**
//*/
//auto parallel_read_input(
        //std::istream& stream,
        //std::vector<moodycamel::BlockingReaderWriterCircularBuffer<std::vector<std::string>>>& queues,
        //int batch_size
        //) -> void
//{
    //auto batches = std::vector<std::vector<std::string>>(queues.size());
    //std::ranges::for_each(batches, [&](auto& b) {b.reserve(batch_size);});
    //int cur_batch_idx = 0;
    //for (auto line = std::string(); std::getline(stream, line);) {
        //batches[cur_batch_idx].emplace_back(line);
        //if (batches[cur_batch_idx].size() >= batch_size) {
            //queues[cur_batch_idx].wait_enqueue(batches[cur_batch_idx]);
            //batches[cur_batch_idx].clear();
            //cur_batch_idx = (cur_batch_idx + 1) % batches.size();
        //}
    //}
    //for (int j = 0; j < queues.size(); ++j) {
        //if (batches[j].empty()) {
            //continue;
        //}
        //queues[j].wait_enqueue(batches[j]);
    //}
    //std::ranges::for_each(queues, [](auto& q) {q.wait_enqueue({});});
//}
//
//
///**
//*/
//auto read_input(
        //std::istream& stream,
        //const std::string& query
        //) -> std::vector<std::tuple<MatchInfo, int>>
//{
    //init_score_matrix();
//
    //auto f = [&](const auto& a, const auto& b) {
            //return std::get<0>(a).score > std::get<0>(b).score;
            //};
    //auto heap = std::priority_queue<
        //std::tuple<MatchInfo, int>,
        //std::vector<std::tuple<MatchInfo, int>>,
        //decltype(f)>(f);
//
    //auto graph = Graph(query);
//
    //int line_num = 0;
    //int n_results = 10;
    //for (auto line = std::string(); std::getline(stream, line); ++line_num) {
        //update_heap(std::move(graph.find(line)), line_num, heap, n_results);
    //}
//
    //auto results = std::vector<std::tuple<MatchInfo, int>>();
    //for (; !heap.empty(); heap.pop()) {
        //results.emplace_back(heap.top());
    //}
    //return std::move(results);
//}
//
//
//auto main(int argc, char *argv[]) -> int {
    //init_score_matrix();
    //auto f = [&](const auto& a, const auto& b) {
            //return std::get<0>(a).score > std::get<0>(b).score;
            //};
    //auto heap = std::priority_queue<std::tuple<MatchInfo, int>, std::vector<std::tuple<MatchInfo, int>>, decltype(f)>(f);
//
    //auto x = std::string("hello world elowol");
    //auto q = std::string("ell");
    //q = std::string("elowol");
    ////q = std::string("local");
    //auto g = Graph(q);
    //auto mi = g.find(x);
    //std::cout << g << std::endl;
    //std::cout << mi.score << std::endl;
    //mi = g.find("x = 'hello world elowol'");
    //std::cout << g << std::endl;
    //std::cout << mi.score << std::endl;
    //mi = g.find("q = 'elowol'");
    //std::cout << g << std::endl;
    //std::cout << mi.score << std::endl;
    //auto lines = std::vector<std::string>();
    //{
        //auto fis = std::fstream("s.cpp");
        //for (std::string line; std::getline(fis, line);) {
            //lines.push_back(line);
        //}
    //}
    //auto scores = std::vector<std::tuple<int, int>>();
    //for (const auto [j, line] : lines | std::views::enumerate) {
        //scores.push_back({j, g.find(line).score});
    //}
    //std::ranges::sort(scores, [](auto& a, auto& b) {
            //return std::get<1>(a) > std::get<1>(b);
            //});
    //std::cout << std::get<0>(scores.front()) << std::endl;
    //for (int j = 0; j < 10; ++j) {
        //std::cout << "(" << std::get<0>(scores[j]) << ", " << std::get<1>(scores[j]) << ") ";
    //}
    //std::cout << std::endl;
//
    //g = Graph("local");
    //scores.clear();
    //scores.reserve(1 << 13);
    //lines.clear();
    //lines.reserve(1 << 13);
    //for (const auto[j, path] :
            //std::filesystem::recursive_directory_iterator(".local")
            //| std::views::enumerate
            //) {
        //lines.push_back(path.path().string());
    //}
    //auto t0 = std::chrono::steady_clock::now();
    //for (int j = 0; j < 1; ++j) {
        //for (const auto[j, path] : lines | std::views::enumerate) {
            //update_heap(std::move(g.find(path)), j, heap, 10);
        //}
    //}
    //auto t1 = std::chrono::steady_clock::now();
    //std::chrono::duration<double> init_time = t1 - t0;
    //std::cout << heap.size() << std::endl;
    //for (; !heap.empty(); heap.pop()) {
        //std::cout << "(" << std::get<0>(heap.top()).score << ", " << std::get<1>(heap.top()) << ") ";
    //}
    //std::cout << std::endl;
    //std::cout << init_time.count() << std::endl;
//
    //{
        //std::cout << std::endl;
        //auto fis = std::fstream("s.cpp");
        //auto results = read_input(fis, q);
        //for (const auto& r : results) {
            //std::cout << "(" << std::get<0>(r).score << ", " << std::get<1>(r) << ") ";
        //}
        //std::cout << std::endl;
    //}
//
    //{
        //std::cout << std::endl;
        //auto results = read_input(std::cin, q);
        //for (const auto& r : results) {
            //std::cout << "(" << std::get<0>(r).score << ", " << std::get<1>(r) << ") ";
        //}
        //std::cout << std::endl;
    //}
//
    //{
        //std::cout << std::endl;
        //int batch_size = 100;
        //int n_threads = 2;
        //int n_results = 10;
        //auto queues = std::vector<
            //moodycamel::BlockingReaderWriterCircularBuffer<std::vector<std::string>>
            //>();
        //auto threads = std::vector<std::thread>();
        //auto result_promises = std::vector<std::promise<std::vector<std::tuple<MatchInfo, int>>>>(n_threads);
        //auto result_futures = std::vector<std::future<std::vector<std::tuple<MatchInfo, int>>>>();
        //for (int j = 0; j < n_threads; ++j) {
            //queues.emplace_back(
                    //moodycamel::BlockingReaderWriterCircularBuffer<
                        //std::vector<std::string>
                    //>(10)
                    //);
        //}
        //for (int j = 0; j < n_threads; ++j) {
            //result_futures.emplace_back(result_promises[j].get_future());
        //}
        //for (int j = 0; j < n_threads; ++j) {
            //threads.emplace_back(std::thread(
                        //worker,
                        //std::ref(queues[j]),
                        //std::ref(q),
                        //n_results,
                        //std::move(result_promises[j])
                        //));
        //}
//
        //auto fis = std::fstream("s.cpp");
        //auto producer_thread = std::thread(
                //parallel_read_input,
                //std::ref(fis),
                //std::ref(queues),
                //batch_size
                //);
//
        //producer_thread.join();
        //std::ranges::for_each(threads, [](auto& t) { return t.join(); });
//
        //auto results = std::vector<std::tuple<MatchInfo, int>>();
        //results.reserve(n_results * n_threads);
        //for (auto& future : result_futures) {
            //std::ranges::move(future.get(), std::back_inserter(results));
        //}
//
        //std::ranges::sort(results, [](const auto& a, const auto& b) {
                //return std::get<0>(a).score > std::get<0>(b).score;
                //});
        //for (const auto& r : results | std::views::take(n_results)) {
            //std::cout << "(" << std::get<0>(r).score << ", " << std::get<1>(r) << ") ";
        //}
        //std::cout << std::endl;
    //}
//
    //return 0;
//}


#include <iostream>
#include <execution>
#include <iterator>
#include <future>
#include <thread>
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
#include <mutex>
#include <string_view>
#include <string.h>

#include <tbb/parallel_for.h>

#include "readerwritercircularbuffer.h"
#include "readerwriterqueue.h"
#include "blockingconcurrentqueue.h"


class Batch {
    std::istream* stream;
public:
    using difference_type = std::ptrdiff_t;
    using value_type = std::vector<std::string>;
    using pointer = value_type*;
    using reference = value_type&;
    //using iterator = pointer;
    //using const_iterator = const iterator;
    //using const_reverse_iterator = std::reverse_iterator<const pointer>;
    using iterator_category = std::forward_iterator_tag;


    std::vector<std::string> data;
    int batch_size;
    Batch() : stream(nullptr), batch_size(0) {}
    Batch(std::istream* stream) : stream(stream), batch_size(10000) {
        data.reserve(batch_size);
    }
    const std::vector<std::string>& operator*() const {
        return data;
    }
    Batch& operator++() {
        data.clear();
        if (this->stream == nullptr) {
            return *this;
        }
        auto line = std::string("");
        for (int j = 0; std::getline(*(this->stream), line) and (j < this->batch_size); ++j) {
            data.push_back(std::move(line));
        }
        if (data.size() < this->batch_size) {
            this->stream = nullptr;
        }
        return *this;
    }
    void operator++(int) { ++*this; }
    bool operator==(const Batch& b) const {
        return this->stream == b.stream;
    }
    Batch begin() {
        return Batch(this->stream);
    }
    Batch end() {
        return Batch();
    }
};



// https://stackoverflow.com/questions/1567082/how-do-i-iterate-over-cin-line-by-line-in-c/1567703#1567703
class Line {
    std::string data;
public:
    friend std::istream &operator>>(std::istream &is, Line &l) {
        std::getline(is, l.data);
        return is;
    }
    operator std::string_view() const { return data; }
};


std::mutex m;
/**
*/
template<class T>
class A {

    /**
    */
    public: explicit A(int) {}

    public: auto wait_enqueue(T e) -> void;
    public: auto wait_dequeue(T& e) -> bool;

    private: std::queue<T> q;
};


/**
*/
template<class T>
auto A<T>::wait_enqueue(T e) -> void {
    const std::lock_guard<std::mutex> lock(m);
    this->q.emplace(std::move(e));
}


/**
*/
template<class T>
auto A<T>::wait_dequeue(T& e) -> bool {
    const std::lock_guard<std::mutex> lock(m);
    if (this->q.empty()) {
        return false;
    }
    e = std::move(this->q.front());
    this->q.pop();
    return true;
}


//using SynchronizedQueue = A<std::vector<std::string>>;
//using SynchronizedQueue = moodycamel::BlockingConcurrentQueue<std::vector<std::string>>;
//using SynchronizedQueue = moodycamel::ConcurrentQueue<std::vector<std::string>>;
using SynchronizedQueue = moodycamel::BlockingReaderWriterCircularBuffer<std::vector<std::string>>;
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
    size_t notfound_idx = std::string::npos;
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
struct MatchInfo {
    public: int score;
    // TODO: probably needs to be copied to array since the underlying
    // data can change.
    public: std::span<const int> path;
};


/**
*/
class Graph {

    /**
    */
    public: explicit Graph(std::string query);
    public: auto init_scores() -> void;
    public: auto find(const std::string& x) -> MatchInfo;

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


auto Graph::find(const std::string& x) -> MatchInfo {
    this->assert_invariants();
    size_t offset = find_start(x, this->query);
    if (offset == std::string::npos) {
        return {-1, {}};
    }
    graph_subseqs(this->graph, this->lengths, x, this->query, offset);
    prune(this->graph, this->lengths);
    this->init_scores();
    auto score = score_graph(this->path, this->scores, this->graph, this->lengths, x);
    return {score, this->path};
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


/**
*/
template<class T>
auto update_heap(MatchInfo mi, int row, T& heap, int max_len) -> void {
    if (heap.size() < max_len) {
        heap.push({std::move(mi), row});
        return;
    }
    auto min_elem = heap.top();
    if (mi.score > std::get<0>(min_elem).score){
        heap.pop();
        std::get<0>(min_elem) = std::move(mi);
        std::get<1>(min_elem) = row;
        heap.push(min_elem);
    }
}


/**
*/
auto worker(
        SynchronizedQueue& q,
        const std::string& query,
        int n_results,
        std::promise<std::vector<std::tuple<MatchInfo, int>>> results_promise
        ) -> void
{
    auto f = [&](const auto& a, const auto& b) {
            return std::get<0>(a).score > std::get<0>(b).score;
            };
    auto heap = std::priority_queue<
        std::tuple<MatchInfo, int>,
        std::vector<std::tuple<MatchInfo, int>>,
        decltype(f)>(f);

    auto graph = Graph(query);

    auto lines = std::vector<std::string>();
    while (true) {
        q.wait_dequeue(lines);
        //while (!q.wait_dequeue(lines)) {
        //}

        if (lines.empty()) {
            break;
        }
        continue;

        for (const auto& line : lines) {
            update_heap(std::move(graph.find(line)), 0, heap, n_results);
        }
    }

    auto results = std::vector<std::tuple<MatchInfo, int>>();
    for (; !heap.empty(); heap.pop()) {
        results.emplace_back(heap.top());
    }
    results_promise.set_value(std::move(results));
}
            

/**
*/
auto parallel_read_input(
        std::istream& stream,
        std::vector<SynchronizedQueue>& queues,
        int batch_size
        ) -> void
{
    auto batches = std::vector<std::vector<std::string>>(queues.size());
    std::ranges::for_each(batches, [&](auto& b) {b.reserve(batch_size);});
    int cur_batch_idx = 0;
    //std::views::all(stream)
        //| std::views::transform([&](auto& line) { std::getline(stream, line); return line; })
        //| std::views::chunk(batch_size)
        //| std::views::enumerate
        //| std::views::for_each([&](auto& a) {queues[j].wait_enqueue(batches[j]);})
    for (auto line = std::string(); std::getline(stream, line);) {
        batches[cur_batch_idx].emplace_back(line);
        if (batches[cur_batch_idx].size() >= batch_size) {
            queues[cur_batch_idx].wait_enqueue(std::move(batches[cur_batch_idx]));
            batches[cur_batch_idx].clear();
            cur_batch_idx = (cur_batch_idx + 1) % batches.size();
        }
    }
    for (int j = 0; j < queues.size(); ++j) {
        if (batches[j].empty()) {
            continue;
        }
        queues[j].wait_enqueue(std::move(batches[j]));
    }
    std::ranges::for_each(queues, [](auto& q) {q.wait_enqueue({});});
}


/**
*/
auto read_input(
        std::istream& stream,
        const std::string& query
        ) -> std::vector<std::tuple<MatchInfo, int>>
{
    init_score_matrix();

    auto f = [&](const auto& a, const auto& b) {
            return std::get<0>(a).score > std::get<0>(b).score;
            };
    auto heap = std::priority_queue<
        std::tuple<MatchInfo, int>,
        std::vector<std::tuple<MatchInfo, int>>,
        decltype(f)>(f);

    auto graph = Graph(query);

    int line_num = 0;
    int n_results = 10;
    for (auto line = std::string(); std::getline(stream, line); ++line_num) {
        update_heap(std::move(graph.find(line)), line_num, heap, n_results);
    }

    auto results = std::vector<std::tuple<MatchInfo, int>>();
    for (; !heap.empty(); heap.pop()) {
        results.emplace_back(heap.top());
    }
    return std::move(results);
}


/**
*/
auto test_parallel(std::istream& stream) -> void {
    //auto query = std::string("elowol");
    auto query = std::string("a");
    int batch_size = 100000;
    int n_threads = 4;
    int n_results = 10;
    int queue_size = 10;

    auto result_promises = std::vector<std::promise<std::vector<std::tuple<MatchInfo, int>>>>(n_threads);

    auto queues = std::views::repeat(queue_size, n_threads) 
        | std::views::transform([](auto n) { return SynchronizedQueue(n); })
        | std::ranges::to<std::vector>();

    auto result_futures = result_promises 
        | std::views::transform([](auto& p) {return p.get_future();})
        | std::ranges::to<std::vector>();

    auto threads = std::views::zip_transform(
            [&](auto& queue, auto& promise) {
            return std::thread(
                    worker,
                    std::ref(queue),
                    std::ref(query),
                    n_results,
                    std::move(promise)
                    );
            },
            queues,
            result_promises
            )
        | std::ranges::to<std::vector>();

    auto producer_thread = std::thread(
            parallel_read_input,
            std::ref(stream),
            std::ref(queues),
            batch_size
            );

    producer_thread.join();
    std::ranges::for_each(threads, [](auto& t) {t.join();});

    auto results = result_futures
        | std::views::transform([](auto& f) {return f.get();})
        | std::views::join
        | std::ranges::to<std::vector>();
    std::ranges::sort(
            results,
            [](const auto& a, const auto& b) {
            return std::get<0>(a).score > std::get<0>(b).score;
            });
    for (const auto& r : results | std::views::take(n_results)) {
        std::cout << "(" << std::get<0>(r).score << ", " << std::get<1>(r) << ") ";
    }
    std::cout << std::endl;
}


/**
*/
auto test_sequential(std::istream& stream) -> void {
    auto query = std::string("elowol");
    //auto query = std::string("a");
    auto results = read_input(stream, query);
    for (const auto& r : results) {
        std::cout << "(" << std::get<0>(r).score << ", " << std::get<1>(r) << ") ";
    }
}


/**
*/
auto time_function(auto f) -> double {
    auto t0 = std::chrono::steady_clock::now();
    f();
    auto t1 = std::chrono::steady_clock::now();
    std::chrono::duration<double> init_time = t1 - t0;
    return init_time.count();
}


auto main(int argc, char *argv[]) -> int {
    init_score_matrix();
    //auto f = [&](const auto& a, const auto& b) {
            //return std::get<0>(a).score > std::get<0>(b).score;
            //};
    //auto heap = std::priority_queue<std::tuple<MatchInfo, int>, std::vector<std::tuple<MatchInfo, int>>, decltype(f)>(f);
//
    //auto x = std::string("hello world elowol");
    //auto q = std::string("ell");
    //q = std::string("elowol");
    ////q = std::string("local");
    //auto g = Graph(q);
    //auto mi = g.find(x);
    //std::cout << g << std::endl;
    //std::cout << mi.score << std::endl;
    //mi = g.find("x = 'hello world elowol'");
    //std::cout << g << std::endl;
    //std::cout << mi.score << std::endl;
    //mi = g.find("q = 'elowol'");
    //std::cout << g << std::endl;
    //std::cout << mi.score << std::endl;
    //auto lines = std::vector<std::string>();
    //{
        //auto fis = std::fstream("s.cpp");
        //for (std::string line; std::getline(fis, line);) {
            //lines.push_back(line);
        //}
    //}
    //auto scores = std::vector<std::tuple<int, int>>();
    //for (const auto [j, line] : lines | std::views::enumerate) {
        //scores.push_back({j, g.find(line).score});
    //}
    //std::ranges::sort(scores, [](auto& a, auto& b) {
            //return std::get<1>(a) > std::get<1>(b);
            //});
    //std::cout << std::get<0>(scores.front()) << std::endl;
    //for (int j = 0; j < 10; ++j) {
        //std::cout << "(" << std::get<0>(scores[j]) << ", " << std::get<1>(scores[j]) << ") ";
    //}
    //std::cout << std::endl;
//
    //g = Graph("local");
    //scores.clear();
    //scores.reserve(1 << 13);
    //lines.clear();
    //lines.reserve(1 << 13);
    //for (const auto[j, path] :
            //std::filesystem::recursive_directory_iterator(".local")
            //| std::views::enumerate
            //) {
        //lines.push_back(path.path().string());
    //}
//
    //auto tot_time = time_function(
            //[&]() {
                //for (const auto[j, path] : lines | std::views::enumerate) {
                    //update_heap(std::move(g.find(path)), j, heap, 10);
                //}
            //});
    //std::cout << heap.size() << std::endl;
    //for (; !heap.empty(); heap.pop()) {
        //std::cout << "(" << std::get<0>(heap.top()).score << ", " << std::get<1>(heap.top()) << ") ";
    //}
    //std::cout << "\nsequential vector " << tot_time << std::endl;
//
    std::ios::sync_with_stdio(false);

    //auto tot_time = time_function([]() {
        //auto line = std::string();
        //auto q = std::string("elowol");
        //auto j = 1;
        //while (std::getline(std::cin, line)) {
            //if (find_start(line, q) != std::string::npos) {
                //j += 1;
            //}
        //}
        //std::cout << j << std::endl;
    //});
    //std::cout << "\nsequential file: " << tot_time << std::endl;
//
    auto tot_time = time_function([]() {
        auto fis = std::fstream("a");
        test_sequential(fis);
    });
    std::cout << "\nsequential file: " << tot_time << std::endl;
//
    //auto t = time_function([]() {
        //test_sequential(std::cin);
    //});
    //std::cout << "\nsequential stdin: " << t << std::endl;
//
    //tot_time = time_function([]() {
        //auto fis = std::fstream("s.cpp");
        //test_parallel(fis);
    //});
    //std::cout << "\nparallel file: " << tot_time << std::endl;
//
    //auto tot_time = time_function([]() {
        //test_parallel(std::cin);
    //});
    //std::cout << "\nparallel stdin: " << tot_time << std::endl;

    //for (const auto& aj : a) {
        //std::cout << std::string_view(aj) << std::endl;
    //}
    //auto a = std::views::istream<Line>(std::cin)
    static_assert(std::input_or_output_iterator<Batch>);
    static_assert(std::input_iterator<std::ranges::iterator_t<Batch>>);
    static_assert(std::ranges::range<Batch>);
    //auto aj = std::vector<std::string>();
    //int k = 0;
    //for (const auto& aj : Batch(&stream)) {
    ////for (auto a = Batch(&stream).begin(), b = Batch().end(); a != b; ++a) {
        ////aj = std::move(*a);
        ////std::cout << aj.size() << std::endl;
        //k += aj.size();
    //}
        //std::cout << k << std::endl;
    //auto a = std::views::repeat(0)
        //| std::views::transform([&](const auto& l) {auto s = std::string(""); std::getline(stream, s);return s;})
        //| std::views::take_while([&](auto& a) { return stream.eof(); });
        //| std::views::chunk(1);
            //auto b = Batch(&stream);
    //long k = 0;
    //int s = 0;
    //auto stream = std::fstream("a");
    //test_sequential(std::cin);
    //return 0;

    //auto b = Batch(&stream);
    //auto beg = b.begin();
    //auto end = b.end();
    //auto graphs = std::views::repeat(Graph("a"), 1<<5)
        //| std::ranges::to<std::vector>();
    //std::mutex m;
    //std::for_each(
            //std::execution::par,
            //graphs.begin(),
            //graphs.end(),
            //[&](auto& graph) {
                //auto lines = std::vector<std::string>();
                //while (beg != end) {
                    //{
                        //const std::lock_guard<std::mutex> lock(m);
                        //lines = std::move(*beg);
                        //++beg;
                    //}
                    //for (const auto& line : lines) {
                        //auto line_score = graph.find(line).score;
                        //s = line_score > s ? line_score : s;
                    //}
                //}
            //}
            //);
    //std::cout << s << std::endl;

    //std::for_each(
            //std::execution::par,
            //b.begin(),
            //b.end(),
            //[&k](const auto& aj) {
                ////k += aj.size();
                ////std::cout << aj.size() << std::endl;
                //auto graph = Graph("elowol");
                //for (const auto& line : aj) {
                    //k += graph.find(line).score;
                //}
            //}
            //);
        //std::cout << k << std::endl;
        //| std::views::for_each([&](auto& a) {queues[j].wait_enqueue(batches[j]);})
    return 0;
}
