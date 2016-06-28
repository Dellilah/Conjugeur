module ActiveHashWhere
  def where_in(options)
    retrieve_elements(:&, options)
  end

  def where_not_in(options)
    retrieve_elements(:-, options)
  end

  private

  def retrieve_elements(relation, options)
    result = all
    options.each do |key, values|
      result = result.send(relation, all.select{ |v| values.include?(v.send(key))})
    end
    result
  end
end
