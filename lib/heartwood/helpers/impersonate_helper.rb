module Heartwood
  module Helpers
    module ImpersonateHelper

      def heartwood_impersonate(users)
        return unless Rails.env.development?
        render partial: 'heartwood/impersonate/list', locals: { users: users }
      end

    end
  end
end
