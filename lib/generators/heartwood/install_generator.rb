require 'rake'
require 'rails/generators'

module Heartwood
  class InstallGenerator < Rails::Generators::Base
    desc "Add Heartwood config file to your initializers."

    source_root File.expand_path('../../templates', __FILE__)

    # Copy our Heartwood config file into the project's
    # config/initializers directory.
    #
    def add_config_file
      config_file = "config/initializers/heartwood.rb"
      copy_file config_file, config_file
    end

  end
end
