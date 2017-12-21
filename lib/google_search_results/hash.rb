class Hash
  def symbolize_all_keys(hash=self)
    symbolized_hash = {}
    return hash if hash.is_a?(String)
    hash.each do |k, v|
      if v.is_a?(Array)
        symbolized_hash[k.to_sym] = v.map do |e|
          symbolize_all_keys(e)
        end
      elsif v.is_a?(Hash)
        symbolized_hash[k.to_sym] = symbolize_all_keys(v)
      else
        symbolized_hash[k.to_sym] = v
      end
    end
    symbolized_hash
  end
end