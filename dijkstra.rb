require 'awesome_print'

class Dijkstra
  def perform
    node, cost = find_lowest_cost_node
    while !node.nil?
      neighbors = graph[node] # 相鄰節點
      # cost_from_here: 從這個節點到相鄰節點的 cost
      neighbors.each do |neighbor, cost_from_here|
        new_cost = cost + cost_from_here
        # 若 new_cost 小於舊有 cost，則更新 cost 和 parent 資訊
        if costs[neighbor] > new_cost
          costs[neighbor] = new_cost
          parents[neighbor] = node
        end
      end
      processed << node
      node, cost = find_lowest_cost_node
    end

    puts "=" * 40
    puts "Graph"
    ap graph
    puts "=" * 40
    puts 'Costs:'
    ap costs
    puts "=" * 40
    puts 'Parents:'
    ap parents
    puts "=" * 40

    puts 'Show path from start to final:'
    puts show_path('start', 'final').join(' -> ')
    puts "Cost: #{costs['final']}"
    puts "=" * 40
  end

  private

  # 尋找尚未尋訪過的最小 cost 節點
  def find_lowest_cost_node
    min = []
    costs.each do |node, cost|
      next if processed.include?(node)
      min = [node, cost] if min.empty? || min.last > cost
    end
    min
  end

  def infinity
    infinity = Float::INFINITY
  end

  def graph
    @graph ||= begin
      graph = {}
      # define start node
      graph['start'] = {}
      graph['start']['a'] = 6
      graph['start']['b'] = 2

      # define a node
      graph['a'] = {}
      graph['a']['final'] = 1

      # define b node
      graph['b'] = {}
      graph['b']['a'] = 3
      graph['b']['final'] = 5

      # define final node
      graph['final'] = {}
      graph
    end
  end

  def nodes
    graph.keys
  end

  def costs
    @costs ||= begin
      costs = {}
      nodes.each do |node|
        costs[node] = graph['start'][node] || infinity
      end
      costs
    end
  end

  def parents
    @parents ||= begin
      parents = {}
      graph['start'].keys.each do |node|
        parents[node] = 'start'
      end
      parents
    end
  end

  def processed
    @processed ||= []
  end

  def show_path(from, to)
    parent = parents[to]
    if parent == from
      return [from, to]
    else
      return [show_path(from, parent), to].flatten
    end
  end
end

Dijkstra.new.perform
