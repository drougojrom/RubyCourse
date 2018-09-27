module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validators

    def validate(*args)
      @validators ||= []
      @validators << args
    end
  end

  module InstanceMethods
    def validate!
      self.class.validators.each do |value|
        val = instance_variable_get("@#{value}".to_sym)
        send value[1].to_sym, val, value[2]
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    def presence(value, arg = nil)
      raise 'Invalid attribute' unless !value.nil?
    end

    def format(value, arg = nil)
      raise 'Invalid format' if value !~ arg
    end

    def type(value, arg = nil)
      raise 'Invalid type' unless value.instance_of? arg
    end
  end
end
