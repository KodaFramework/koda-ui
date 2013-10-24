require 'spec_helper'

class UIContext
  include Koda::UI::Helpers
end

describe Koda::UI::Helpers do
  before :each do
    @query_instance = Koda::UI::Query.new
  end

  def stub_document(data = {})
    document = mock('document')
    document.stub(:data).and_return(data)
    document.stub(:type).and_return('/test')
    document.stub(:url).and_return('/test/url.json')
    document.stub(:url_name).and_return('url')
    document.stub(:file_name).and_return('url.json')
    document
  end

  describe "all" do
    it "queries for the root model" do
      documents = [stub_document, stub_document]
      Koda::Document.should_receive(:where).with(type: '/').and_return(documents)
      cars = @query_instance.query('/')
      cars.length.should == 2
    end

    it "queries documents for a specific type" do
      documents = [stub_document, stub_document]
      Koda::Document.should_receive(:where).with(type: '/cars').and_return(documents)
      cars = @query_instance.query('/cars')
      cars.length.should == 2
    end

    it "queries documents for sub model" do
      documents = [stub_document, stub_document, stub_document]
      Koda::Document.should_receive(:where).with(type: '/fast/cars').and_return(documents)
      cars = @query_instance.query('/fast/cars')
      cars.length.should == 3
    end
  end

  describe "single" do
    it "queries for a specific document" do
      expected_document = stub_document name: 'ferrari'
      Koda::Document.should_receive(:where).with(uri: '/cars/ferrari.json').and_return([expected_document])
      car = @query_instance.single('/cars/ferrari')
      car[:name].should == 'ferrari'
    end
  end
end