def display_graph(arr)
  arr.each { |row| puts row }
end

def build_graph(arr,iter,count=1,r=62,c=49)
  return if count > iter

  if (count <= iter)
    [:+,:-].each { |op| build_subtree(arr,count,r,c,op) }
    [:+,:-].each { |op|
      build_graph(arr,iter,count+1,r-(2**(6-count)),c.send(op, (2**(5-count)))) }
  end

  arr
end

def build_subtree(arr,count,r,c,op)
  (1..(2**(5-count))).each do |i|
    arr[r-i+1][c] = '1'
    arr[r-(2**(5-count))-i+1][c.send(op,i)] = '1'
  end
end

tree = [].tap { |arr| 63.times { arr << ('_' * 100) } }
display_graph( build_graph(tree,gets.to_i) )
