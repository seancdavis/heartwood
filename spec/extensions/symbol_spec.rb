require 'rails_helper'

describe Symbol do

  describe '#to_title' do
    it 'humanizes and titleizes itself and converts to string' do
      expect(:hello_world.to_title).to eq('Hello World')
    end
  end

end
