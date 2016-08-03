module Fuel
  class Engine < ::Rails::Engine

    config.to_prepare do
      Rails.application.config.assets.precompile += %w(
        fuel/wysihtml.css
        fuel/default-img.jpg
        fuel/logo.svg
      )
    end

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

    initializer :fuel do
      if defined?(ActiveAdmin)
        ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
      end
    end

  end
end
