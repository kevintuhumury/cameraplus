class Hash
  def method_missing(method, *args, &block)
    if self.has_key? method
      return self[method]
    elsif self.has_key? method.to_s
      return self[method.to_s]
    else
      super
    end
  end
end
