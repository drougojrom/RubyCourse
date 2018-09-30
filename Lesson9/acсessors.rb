module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*args)
      args.each do |name|
        var_name = "@#{name}".to_sym
        define_method(var_name) { instance_variable_get(name) }
        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          @history ||= {}
          @history[name] ||= []
          @history[name].push value
        end
        define_method("#{name}_history") { @history[name] unless @history.nil? }
      end
    end

    def strong_attr_accessor(name, klass)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        raise ArgumentError "The class doesn't match" unless value.is_a? klass
        instance_variable_set(var_name, value)
      end
    end
  end
end
