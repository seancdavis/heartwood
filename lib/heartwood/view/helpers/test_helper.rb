module Heartwood
  module View
    module Helpers
      module TestHelper

        # data-test attribute is added to be able to focus upon a unique element
        # while testing without the need for superfluous attributes in dev/prod.
        def spec_id(id)
          "data-test=#{id}"
        end

      end
    end
  end
end
