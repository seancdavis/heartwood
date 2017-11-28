require 'rails_helper'

describe Heartwood::BaseService do

  class MyService < Heartwood::BaseService
    required_attr :a, :b
    optional_attr :c, :d
    attr_with_default :e, 'some_string'
    attr_with_default :f, 'another_string'
  end

  describe 'self.required_attr' do
    it 'stores required attributes in an array' do
      expect(MyService.required_attrs).to match_array(%i[a b])
    end
    it 'throws an error when a required attributee is missing' do
      expect { MyService.new }.to raise_error(ArgumentError)
    end
    it 'initializes when required attributes are present' do
      expect { MyService.new(a: true, b: false) }.to_not raise_error
    end
  end

  describe 'self.optional_attr' do
    it 'stores optional attributes in an array' do
      expect(MyService.optional_attrs).to match_array(%i[c d])
    end
    it 'does not throw an error when a optional attributee is missing' do
      expect { MyService.new(a: true, b: false) }.to_not raise_error
    end
    it 'initializes when optional attributes are present' do
      opts = { a: true, b: false, c: true, d: false }
      expect { MyService.new(opts) }.to_not raise_error
    end
  end

  describe 'self.attr_with_default' do
    it 'stores default attributes in an array' do
      exp_arr = [[:e, 'some_string'], [:f, 'another_string']]
      expect(MyService.attrs_with_defaults).to match_array(exp_arr)
    end
    it 'automatically sets default attributes' do
      my_service = MyService.new(a: true, b: false)
      expect(my_service.e).to eq('some_string')
      expect(my_service.f).to eq('another_string')
    end
    it 'can have default attributes overwritten' do
      my_service = MyService.new(a: true, b: false, e: true, f: 'ok')
      expect(my_service.e).to eq(true)
      expect(my_service.f).to eq('ok')
    end
  end

  describe 'self.call' do
    class CallTestService < MyService
      def call
        'ok'
      end
    end
    it 'raises an error if the call method is missing' do
      expect { MyService.call(a: true, b: false) }.to raise_error(RuntimeError)
    end
    it 'instantiates an instance, passes options, and runs the call method' do
      expect(CallTestService.call(a: true, b: false)).to eq('ok')
    end
  end

end
