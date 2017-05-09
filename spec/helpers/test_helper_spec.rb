require 'rails_helper'

describe Heartwood::Helpers::TestHelper do

  describe '#spec_id' do
    it 'returns a data attribute in test' do
      expect(helper.spec_id('my_id')).to eq("data-test=my_id")
    end
    it 'returns nil in development and production' do
      %w[development production].each do |env|
        stub_env(env)
        expect(helper.spec_id('my_id')).to eq(nil)
      end
    end
  end

end
