require 'spec_helper'

class UIContext
  include Koda::UI::Helpers
end

describe Koda::UI::Helpers do
  describe "koda" do
    before :each do
      @context = UIContext.new
    end

    it 'should respond to query' do
      @context.koda.should respond_to(:query)
    end

    it 'should respond to single' do
      @context.koda.should respond_to(:single)
    end
  end
end