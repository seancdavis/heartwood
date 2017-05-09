module Heartwood
  module Test
    module FeatureHelpers

      # Shorthand identification for test-specific attributes.
      def el(id)
        "[data-test='#{id}']"
      end

    end
  end
end
