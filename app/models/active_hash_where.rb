module ActiveHashWhere
  def where_in(options)
    result = all
    options.each do |key, values|
      result = result & (all.select{ |v| values.include?(v.send(key))})
    end
    result
  end

  def where_not_in(options)
    result = all
    options.each do |key, values|
      result = result - (all.select{ |v| values.include?(v.send(key))})
    end
  end
end
