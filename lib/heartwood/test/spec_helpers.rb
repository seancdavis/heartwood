module Heartwood
  module Test
    module SpecHelpers

      # Stub the Rails environment
      def stub_env(env)
        env_str = ActiveSupport::StringInquirer.new(env)
        allow(Rails).to receive(:env).and_return(env_str)
      end

    end
  end
end
