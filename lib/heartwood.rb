require 'heartwood/version'
require 'heartwood/configuration'

support_files = "#{File.expand_path('../heartwood/support', __FILE__)}/*.rb"
Dir.glob(support_files).each do |file|
  require "heartwood/support/#{File.basename(file)}"
end

module Heartwood
  require 'heartwood/engine' if defined?(Rails)
end
