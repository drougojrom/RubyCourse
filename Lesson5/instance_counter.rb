module InstanceCounter

  @@instances = 0

  def self.instances
    @@instances
  end

  def self.register_instance
    @@instances += 1
  end

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      InstanceCounter.instances
    end
  end

  module InstanceMethods
    protected
    def register_instance
      InstanceCounter.register_instance
    end
  end
end
