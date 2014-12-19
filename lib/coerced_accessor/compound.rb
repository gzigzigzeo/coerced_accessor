module CoercedAccessor
  module Compound
    def compound_accessor(accessor, *attributes)
      options = attributes.extract_options!
      delimiter = options.delete(:delimiter) || ':'

      define_method accessor do
        attributes.map { |a| send(a) }.join(delimiter)
      end

      define_method "#{accessor}=" do |value|
        values = value.split(delimiter)
        attributes.map { |a| send("#{a}=", values.shift) }
      end
    end
  end
end
