def path_exists?(source, dest, visited_nodes)
  visited_nodes.insert(source)

  return true if source == dest

  source.children.each do |child|
    unless visited_nodes.include?(child)
      return true if path_exists?(child, dest, visited_nodes)
    end
  end

  false
end
