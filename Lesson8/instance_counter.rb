# Instance counter docs
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # Class methods docs
  module ClassMethods
    attr_accessor :instances, :count

    def add_instance(instance)
      cls = self
      cls.instances = cls.instances.to_a << instance
      cls.count = cls.count.to_i + 1
    end
  end

  # Instacnce methods docs
  module InstanceMethods
    protected

    def register_instance
      cls = self.class
      cls.add_instance(self)
      loop do
        cls = cls.superclass
        break unless cls.included_modules.include?(InstanceCounter)

        cls.add_instance(self)
      end
    end
  end
end
