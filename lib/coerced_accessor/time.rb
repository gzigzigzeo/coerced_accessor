module CoercedAccessor
  module Time
    def time_coerced_accessor(attribute, format = nil, options = {})
      as = options.delete(:as) || "#{attribute}_human"
      time_class = options.delete(:time_class) || ::Time

      define_method("#{as}=") do |value|
        time = time_class.strptime(value, format) rescue nil
        send("#{attribute}=", time)
      end

      define_method(as) do
        value = send(attribute)
        value.strftime(format) if value
      end
    end
  end
end
