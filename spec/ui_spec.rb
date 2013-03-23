require 'spec_helper'
require 'koda-ui'

class UIContext
  include Koda::UI::Helpers
end

describe Koda::UI::Helpers do
  describe "model" do
    before :each do
      @context = UIContext.new
    end

    def stub_document(data = {})
      document = mock('document')
      document.stub(:data).and_return(data)
      document.stub(:url).and_return('/test/url.json')
      document.stub(:alias).and_return('url')
      document.stub(:name).and_return('url.json')
      document
    end
    describe "all" do
      it "queries documents for specific model" do
        documents = [stub_document, stub_document]
        Koda::Document.should_receive(:where).with(type: '/cars').and_return(documents)
        cars = @context.model.cars.all
        cars.length.should == 2
      end

      it "queries documents for sub model" do
        documents = [stub_document, stub_document, stub_document]
        Koda::Document.should_receive(:where).with(type: '/fast/cars').and_return(documents)
        cars = @context.model.fast.cars.all
        cars.length.should == 3
      end
    end

    describe "single" do
      it "queries for a specific document" do
        expected_document = stub_document name: 'ferrari'
        Koda::Document.should_receive(:where).with(url: '/cars/ferrari.json').and_return([expected_document])
        car = @context.model.cars.single('ferrari')
        car[:name].should == 'ferrari'
      end
    end
  end
end