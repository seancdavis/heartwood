require 'database_cleaner'
require 'factory_girl'
require 'fileutils'

module Heartwood
  module Utilities
    module Seeder

      def clean_uploads(dir = 'public/uploads')
        FileUtils.rm_rf(Rails.root.join(dir))
      end

      def clean_database
        DatabaseCleaner.clean_with(:truncation)
      end

      def log(msg, type = :info)
        logger = Logger.new(STDOUT)
        logger.send(type, msg)
      end

      def create(factory, *options)
        obj = FactoryGirl.create(factory, *options)
        log("CREATE #{factory.to_s.humanize.titleize}: #{obj}")
        obj
      end

      def create_list(factory, count, *options)
        collection = FactoryGirl.create_list(factory, count, *options)
        log("CREATE LIST of #{collection[0].class.to_s.humanize.titleize.pluralize}:")
        collection.each { |obj| log("  - #{obj}") }
        collection
      end

    end
  end
end
