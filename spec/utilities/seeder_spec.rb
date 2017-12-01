require 'rails_helper'
require 'fileutils'

describe Heartwood::Utilities::Seeder do

  class MyClass; end

  before(:each) do
    @my_class = MyClass.new
    @my_class.extend(Heartwood::Utilities::Seeder)
  end

  describe '#clean_uploads' do
    it 'removes public/uploads directory' do
      test_dir_prefix = 'tmp/uploads'
      test_dir = Rails.root.join(test_dir_prefix)
      test_file = "#{test_dir}/.test"
      FileUtils.mkdir_p(test_dir)
      FileUtils.touch(test_file)
      expect(Dir.exist?(test_dir)).to eq(true)
      expect(File.exist?(test_file)).to eq(true)
      @my_class.clean_uploads(test_dir_prefix)
      expect(File.exist?(test_file)).to eq(false)
      expect(Dir.exist?(test_dir)).to eq(false)
    end
  end

  describe '#create' do
    it 'creates a single object using factory girl and returns that object' do
      expect(Thing.count).to eq(0)
      thing = @my_class.create(:thing)
      expect(Thing.count).to eq(1)
      expect(thing).to eq(Thing.first)
    end
  end

  describe '#create_list' do
    it 'creates a list of objects using factory girl and returns that list' do
      expect(Thing.count).to eq(0)
      things = @my_class.create_list(:thing, 5)
      expect(Thing.count).to eq(5)
      expect(things.to_a).to match_array(Thing.all.to_a)
    end
  end

end
