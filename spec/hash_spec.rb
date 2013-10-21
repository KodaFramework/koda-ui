require 'spec_helper'
require 'koda-ui'

describe Koda::UI::Hash do
  describe '#create' do
    it 'populates itself from an existing hash' do
      hash = Koda::UI::Hash.create({a: 1, b: 2})
      hash[:a].should == 1
      hash[:b].should == 2
    end
  end

  describe '[]' do
    it 'gets a default value when the key does not exist' do
      hash = Koda::UI::Hash.create({})
      hash['a'].should == "The key 'a' was not found in the supplied hash"
    end

    it 'gets a value from a child hash using dot notation' do
      hash = Koda::UI::Hash.create({'a' => {'b' => 1}, 'c' => 2})
      hash['a.b'].should == 1
      hash['c'].should == 2
    end
  end
end
