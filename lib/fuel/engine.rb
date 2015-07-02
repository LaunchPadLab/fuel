module Fuel
  class Engine < ::Rails::Engine

    # ISOLATE NAMESPACE ONLY FOR MODELS
    mod = Fuel
    engine_name(generate_railtie_name(mod.name))
    unless mod.respond_to?(:railtie_namespace)
      name, railtie = engine_name, self
      mod.singleton_class.instance_eval do
        unless mod.respond_to?(:table_name_prefix)
          define_method(:table_name_prefix) { "#{name}_" }
        end
      end
    end

    if defined?(ActiveAdmin)
      initializer :fuel do
        ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
      end
    end

  end
end
