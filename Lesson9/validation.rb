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

    private

    def presence(value, _arg = nil)
      raise ArgumentError.new 'Invalid attribute' unless !value.empty?
    end

    def format(value, arg = nil)
      raise ArgumentError.new 'Invalid format' if value !~ arg
    end

    def type(value, arg = nil)
      if value.is_a?
        value.each do |station|
          unless station.instance_of? arg
            raise ArgumentError.new 'Should contain only stations'
          end
        end
      else
        raise ArgumentError.new 'Type does not match' unless value.instance_of? arg
      end
    end
  end
end
