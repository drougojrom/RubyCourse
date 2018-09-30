require 'pry'

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validators

    def validate(*args)
      klass = self
      klass.validators ||= []
      validator = {type: args[1], attr: args[0], option: args[2] }
      klass.validators << validator
    end
  end

  module InstanceMethods
    def validate!
      self.class.validators.each do |value|
        attr = instance_variable_get("@#{value[:attr]}".to_sym)
        send value[:type].to_sym, attr, value[:option]
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    def presence(value, _arg = nil)
      raise ArgumentError.new 'Invalid attribute' if !value.nil?
    end

    def format(value, arg)
      raise ArgumentError.new 'Invalid format' if value !~ arg
    end

    def i_type(value, arg)
      raise ArgumentError.new 'Type does not match' unless value.instance_of? arg
    end

    def contain_only(value, _arg = nil)
      raise ArgumentError.new "Doesn't contain same values" if value.uniq.length == 1
    end
  end
end
