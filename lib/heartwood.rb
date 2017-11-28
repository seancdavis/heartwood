require 'heartwood/version'
require 'heartwood/configuration'

require 'hashie'

autoload_dirs = %w[extensions services test]

autoload_dirs.each do |dir|
  autoload_files = "#{File.expand_path("../heartwood/#{dir}", __FILE__)}/*.rb"
  Dir.glob(autoload_files).each do |file|
    require "heartwood/#{dir}/#{File.basename(file)}"
  end
end

module Heartwood
  require 'heartwood/engine' if defined?(Rails)
end
