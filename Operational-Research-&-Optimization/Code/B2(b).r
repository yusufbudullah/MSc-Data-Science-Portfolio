library(igraph)

# Create adjacency matrix 
M <- matrix(0, 12, 12)

# Node names (order matters)
node_names <- c(
  "Pav_BJ", "Bukit_Jalil", "Sri_Petaling", "OUG",
  "Salak_South", "Mid_Valley", "Bangsar_South",
  "Brickfields", "KL_Sentral",
  "Bangsar", "TRX", "Pav_KL"
)

dimnames(M) <- list(node_names, node_names)


M["Pav_BJ", "Bukit_Jalil"]      <- 2
M["Bukit_Jalil", "Sri_Petaling"] <- 3
M["Sri_Petaling", "OUG"]        <- 4
M["OUG", "Salak_South"]         <- 4


M["Salak_South", "Mid_Valley"]   <- 5
M["Mid_Valley", "Bangsar_South"] <- 2
M["Bangsar_South", "Brickfields"] <- 2
M["Brickfields", "KL_Sentral"]   <- 1


M["KL_Sentral", "Bangsar"] <- 3
M["KL_Sentral", "TRX"]     <- 3
M["TRX", "Pav_KL"]         <- 2


M["Sri_Petaling", "Mid_Valley"]   <- 5
M["OUG", "Bangsar_South"]         <- 3
M["Mid_Valley", "Brickfields"]    <- 1
M["Bangsar_South", "TRX"]         <- 3
M["Brickfields", "Bangsar"]       <- 2


G <- graph_from_adjacency_matrix(
  M,
  mode = "undirected",
  weighted = TRUE
)

# source node (1 = Pav_BJ) and destination node (12 = Pav_KL)

# shortest path nodes
node <- shortest_paths(
  G,
  1,
  to = V(G)
)$vpath[[12]]
node


# shortest distance dijkstra
shortest_distance_d <- distances(
  G,
  v = 1,
  to = 12,
  weights = E(G)$weight,
  algorithm = "dijkstra"
)

# shortest distance bellman fords
shortest_distance_bf <-distances(
  G,
  v = 1,
  to = 12,
  weights = E(G)$weight,
  algorithm = "bellman-ford"
)

paste(
  "The shortest distance using Dijkstras from Pavillion Bukit Jalil to Pavillion Kuala Lumpur is",
  shortest_distance_d
)

paste(
  "The shortest distance using Bellmans_Ford from Pavillion Bukit Jalil to Pavillion Kuala Lumpur is",
  shortest_distance_bf
)
