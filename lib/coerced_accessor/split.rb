module CoercedAccessor
  module Split
    def split_accessors(attribute, *accessors)
      options = accessors.extract_options!
      delimiter = options.delete(:delimiter) || ':'

      accessors.each.with_index do |accessor, index|
        define_method accessor do
          send(attribute).to_s.split(delimiter)[index]
        end

        define_method "#{accessor}=" do |value|
          values = accessors.map { |a| send(a) }
          values[index] = value
          send("#{attribute}=", values.join(delimiter))
        end
      end
    end
  end
end
