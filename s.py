import pathlib


class Graph:

    def __init__(self, query):
        if not query:
            raise ValueError('Query cannot be empty.')
        self._query = query
        self._graph = [[] for _ in range(len(self._query))]
        self._lengths = [0 for _ in range(len(self._query))]
        self._path = [0 for _ in range(len(self._query))]
        self._scores = [[] for _ in range(len(self._query))]

        self._assert_invariants()

    def _init_scores(self):
        for j in range(len(self._graph)):
            if (d := len(self._scores[j]) - self._lengths[j]) < 0:
                self._scores[j].extend([[0, 0] for _ in range(-d)])
            for k in range(self._lengths[j]):
                self._scores[j][k][0] = 0
                self._scores[j][k][1] = 0

    def _assert_invariants(self):
        assert len(self._query) > 0
        assert len(self._scores) == len(self._query)
        assert len(self._scores) == len(self._graph)
        assert len(self._scores) == len(self._path)
        assert len(self._scores) == len(self._lengths)

    #https://okmij.org/ftp/Haskell/extensible/exteff.pdf
    #https://www.cs.ox.ac.uk/people/nicolas.wu/papers/Scope.pdf
    #https://en.wikibooks.org/wiki/Haskell
    #https://soupi.github.io/gotta-go-fast/01-about/00-about.html
    #https://github.com/BurntSushi/ripgrep/blob/962d47e6a1208cf2187cd34c2a7f6cf32e2a4903/benchsuite/benchsuite
    #https://en.wikipedia.org/wiki/S-expression
    def find(self, x):
        self._assert_invariants()

        if (offset := find_start(x, self._query)) < 0:
            return -1, tuple()
        graph_subseqs(self._graph, x, self._query, offset)
        prune(self._graph, self._lengths)
        self._init_scores()
        return score_graph(self._path, self._scores, self._graph, self._lengths, x)

    def __str__(self):
        return 'Lengths:\n  {}\nGraph:\n  {}\nScores:\n  {}\nPath:\n  {}'.format(
                self._lengths,
                '\n  '.join(str(x[:l]) for x, l in zip(self._graph, self._lengths)),
                '\n  '.join(str(x[:l]) for x, l in zip(self._scores, self._lengths)),
                self._path,
                )


def find_start(x, q):
    notfound_idx = -1
    if not x:
        return notfound_idx
    if not q:
        return notfound_idx
    if len(x) <= len(q):
        return notfound_idx
    k = -1
    beg = notfound_idx
    for j, qj in enumerate(q):
        if (k := x.find(qj, k + 1)) < 0:
            return notfound_idx
        if j == 0:
            beg = k
    return beg
    #k = 0
    #for j, xj in enumerate(x):
        #if xj != q[k]:
            #continue
        #k = k + 1
        #if (beg < 0) and (k == 1):
            #beg = j
        #if k >= len(q):
            #return beg
    #return notfound_idx


def graph_subseqs(graph, x, q, x_offset):
    if not x:
        return tuple()
    if not q:
        return tuple()
    if (x_offset >= len(x)) or (x_offset < 0):
        return tuple()
    for j, qj in enumerate(q):
        graph[j] = tuple(k for k in range(x_offset, len(x)) if x[k] == qj)
        if not graph[j]:
            return graph
        x_offset = graph[j][0] + 1
    return graph


def prune(graph, lengths):
    if not graph:
        return tuple()
    if not lengths:
        return tuple()
    if len(graph) != len(lengths):
        raise RuntimeError('Lengths and graph must have the same number of rows.')
    lengths[-1] = len(graph[-1])
    for j in range(len(graph) - 2, -1, -1):
        lengths[j] = next(
                k + 1
                for k in range(len(graph[j]) - 1, -1, -1)
                if graph[j][k] < graph[j + 1][lengths[j + 1] - 1]
                )
    return lengths


def score_single_node(j, x):
    # Formula:
    #   is_prefix + is_suffix + is_upper
    if not x:
        return 0
    if (j < 0) or (j >= len(x)):
        return 0
    if len(x) == 1:
        # 2 for prefix and suffix.
        return 2 + (1 if x[0].isupper() else 0)
    if j == 0:
        return 1 + (1 if x[j].isupper() else 0)
    if j == (len(x) - 1):
        return 1 + (1 if x[j].isupper() else 0)
    return 0 + (1 if x[j].isupper() else 0)


def score_joint_nodes(j, k, x):
    return 1.0/(j - k)


def score(graph, lengths, x):
    S = [
            [[score_single_node(g[k], x), 0] for k in range(l)]
            for g, l in zip(graph, lengths)
            ]
    for j in range(1, len(graph)):
        m = 0
        for k in range(lengths[j]):
            n = graph[j][k]
            best_score = best_node = 0
            while (m < lengths[j-1]) and (graph[j-1][m] < n):
                cur_score = score_joint_nodes(n, graph[j-1][m], x)
                if cur_score > best_score:
                    best_score = cur_score
                    best_node = m
                m += 1
            best_node_2 = S[j][k-1][1] if k > 0 else 0
            best_score_2 = score_joint_nodes(n, graph[j-1][best_node_2], x)
            if best_score > best_score_2:
                S[j][k][0] = best_score + S[j][k][0]
                S[j][k][1] = best_node
            else:
                S[j][k][0] = best_score_2 + S[j][k][0]
                S[j][k][1] = best_node_2
    return reconstruct_path(graph, S)
    print('S:\n{}'.format(''.join(str(s) + '\n' for s in S)))
    print('path: {}'.format(best_path))


def score_nodes(scores, graph, j, m, x, lengths):
    for r in range(lengths[j]):
        for k in range(m, lengths[j - 1]):
            if graph[j - 1][k] >= graph[j][r]:
                break
            s = score_joint_nodes(graph[j][r], graph[j - 1][k], x)
            if scores[j][r][0] < s:
                scores[j][r][0] = s
                scores[j][r][1] = k
        m = k


def score_layer_zero(scores, graph, lengths, x):
    for k in range(lengths[0]):
        scores[0][k][0] = score_single_node(graph[0][k], x)
        scores[0][k][1] = 0
    return scores


def score_layer(graph, scores, j, lengths, x):
    if not graph:
        return tuple()
    if not scores:
        return tuple()
    if (j < 0) or (j >= len(graph)):
        return tuple()
    if len(graph) != len(lengths):
        raise RuntimeError('Lengths and graph must have the same number of rows.')
    if j == 0:
        return score_layer_zero(scores, graph, lengths, x)
    S = scores[j]
    score_nodes(scores, graph, j, 0, x, lengths)
    for k in range(1, lengths[j]):
        s = score_joint_nodes(graph[j][k], graph[j - 1][S[k - 1][1]], x)
        S[k][0] = S[k][0] if S[k][0] > s else s
        S[k][1] = S[k][1] if S[k][0] > s else S[k - 1][1]
    for k in range(lengths[j]):
        S[k][0] += scores[j - 1][S[k][1]][0]
    for k in range(lengths[j]):
        S[k][0] += score_single_node(graph[j][k], x)
    return scores


def score_graph(path, scores, graph, lengths, x):
    for j in range(len(graph)):
        score_layer(graph, scores, j, lengths, x)
    return reconstruct_path(path, graph, scores, lengths)


def reconstruct_path(path, graph, scores, lengths):
    if not scores:
        return tuple()
    if len(scores) != len(graph):
        raise RuntimeError('Score matrix and graph must have the same number of rows.')
    max_idx = last_idx = max(enumerate(scores[-1]), key=lambda s: s[1][0])[0]
    max_idx = last_idx = max(
            enumerate(scores[-1][j] for j in range(lengths[-1])),
            key=lambda s: s[1][0],
            )[0]
    for l in range(len(scores) - 1, -1, -1):
        path[l] = graph[l][max_idx]
        max_idx = scores[l][max_idx][1]
    return scores[-1][last_idx][0], path


def main():
    x = 'hello world elowol'
    q = 'ell'
    q = 'elowol'
    q = 'local'
    g = Graph(q)
    score, path = g.find(x)
    print('{}'.format(g))
    print('{}, {}'.format(score, path))
    score, path = g.find("x = 'hello world elowol'")
    print('{}'.format(g))
    print('{}, {}'.format(score, path))
    score, path = g.find("q = 'elowol'")
    print('{}'.format(g))
    print('{}, {}'.format(score, path))
    lines = [s for s in pathlib.Path(__file__).read_text().split('\n')]
    scores = [(j, g.find(l)[0]) for j, l in enumerate(lines)]
    print('{}'.format(sorted(scores, key=lambda s: -s[1])[:10]))

    import time
    t0 = time.time()
    scores = [(j, g.find(str(l))[0]) for j, l in enumerate(pathlib.Path('.local').glob('**/*'))]
    t_tot = time.time() - t0
    print('{}'.format(t_tot))

if __name__ == '__main__':
    main()
