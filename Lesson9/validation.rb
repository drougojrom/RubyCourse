module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attribute, validation, arg)
      define_method "#{attribute}=" do |value|
        case validation
        when :presence
          raise 'Invalid attribute' unless !value.nil?
        when :format
          raise 'Invalid format' if value !~ arg
        when :type
          raise 'Invalid type' unless value.instance_of? validation
      end
    end
  end

  module InstanceMethods
    def validate!
    end

    def valid?
    end

    def validate_presence
      raise 'Invalid attribute' unless !value.nil?
    end

    def validate_format
    end

    def validate_type
    end
  end
end
