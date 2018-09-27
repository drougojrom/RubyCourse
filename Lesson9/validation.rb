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
      klass.validators << args
    end
  end

  module InstanceMethods
    protected

    def validate!
      self.class.validators.each do |value|
        val = instance_variable_get("@#{value[0]}".to_sym)
        send value[1].to_sym, val, value[2]
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    def presence(value, _arg = nil)
      raise ArgumentError.new 'Invalid attribute' unless !value.empty?
    end

    def format(value, arg = nil)
      raise ArgumentError.new 'Invalid format' if value !~ arg
    end

    def type(value, arg = nil)
      value.each do |station|
        unless station.instance_of? Station
          raise ArgumentError, 'Should contain only stations'
        end
      end
    end
  end
end
