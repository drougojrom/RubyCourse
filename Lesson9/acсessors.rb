module Accessors
  def attr_accessor_with_history
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name+"_history"
    class_eval %Q"
      def #{attr_name}=(value)
        if !defined? @#{attr_name}_history
          @#{attr_name}_history = [@#{attr_name}]
        end
        @#{attr_name} = value
        @#{attr_name}_history << value
      end
    "
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
