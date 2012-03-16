class Hash
  def method_missing(key)
    self[key] or self[key.to_s] or super
  end
end
