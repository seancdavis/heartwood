require 'rails'

module Cambium
  class Engine < ::Rails::Engine

    isolate_namespace Cambium

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    def root
      @root ||= Gem::Specification.find_by_name('cambium').gem_dir.to_s
    end

  end
end
