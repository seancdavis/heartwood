module Heartwood
  module Helpers
    module BaseHelper

      require 'heartwood/helpers/test_helper'
      require 'heartwood/helpers/impersonate_helper'

      include Heartwood::Helpers::TestHelper
      include Heartwood::Helpers::ImpersonateHelper

    end
  end
end
