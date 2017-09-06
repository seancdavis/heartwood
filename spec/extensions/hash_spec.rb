require 'rails_helper'

describe Hash do

  describe '#to_mash' do
    it 'returns a Hashie::Mash object' do
    expect({}.to_mash).to eq(Hashie::Mash.new)
    end
    it 'returns a recursive mash' do
      hash = { :a => '1', :b => 2, :c => [3, 4, 5], :d => { :e => '6' } }
      expect(hash.to_mash.d.e).to eq('6')
    end
  end

end
