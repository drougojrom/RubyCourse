module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def self.instances
      self.class.instances
    end
  end

  module InstanceMethods
    protected
    def register_instance
      self.class.register_instance
    end
  end
end
