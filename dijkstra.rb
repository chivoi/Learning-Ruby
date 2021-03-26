# initial population of the node table, marking them infinity
def populate_paths_costs(graph, start)
  table = {}
  all_nodes = graph.keys
  all_nodes.map do |node|
    if node == start
      table[node] = {cost: 0, path: "#{node}"}
    else
      table[node] = {cost: Float::INFINITY, path: ""}
    end
  end
  return table
end

# solution
def dijkstra(graph, start, finish)
  paths_costs = populate_paths_costs(graph, start)
  visited = []
  queue = []
  current_node = start
  queue << current_node
  prev_node = ""
  loop do
    # get the neighbours of the current node
    current_neighbours = graph[current_node].keys
    # iterate through them
    if current_neighbours
      # add each neighbour to the queue
      current_neighbours.each {|neighbour| queue << neighbour if !visited.include?(neighbour)}
      queue.uniq!
      current_neighbours.each do |neighbour|
        # if the neighbour hasn't been visited
        marked_cost = paths_costs[neighbour][:cost]
        neighbour_cost = graph[current_node][neighbour]
        if !visited.include?(neighbour)
          if marked_cost = Float::INFINITY
            paths_costs[neighbour][:cost] = neighbour_cost + paths_costs[current_node][:cost]
            paths_costs[neighbour][:path] = paths_costs[current_node][:path] + neighbour
          else
            if (marked_cost + neighbour_cost) < marked_cost
              paths_costs[neighbour][:cost] = marked_cost + neighbour_cost
              paths_costs[neighbour][:path] = paths_costs[current_node][:path] + current_node
            end
          end
        else 
          if (marked_cost + neighbour_cost) < marked_cost
            paths_costs[neighbour][:cost] = marked_cost + neighbour_cost
            paths_costs[neighbour][:path] = paths_costs[current_node][:path] + current_node
          end
        end
      end
    end
    visited << current_node if !visited.include?(current_node)
    queue.delete(current_node) if queue.include?(current_node)
    # if all nodes are visited
    if graph.keys.sort == visited.uniq.sort
      return paths_costs[finish]
    else
      current_node = queue.first
    end
  end
end

graph = {'A'=> { 'B'=> 2, 'C'=> 7 }, 'B'=> { 'D'=> 1, 'E'=> 8 }, 'C'=> { 'B'=> 3, 'E'=> 12 }, 'D'=> { 'E'=> 4, 'F'=> 9 }, 'E'=> { 'F'=> 4 }, 'F'=> {} }

p dijkstra(graph, "A", "F")
