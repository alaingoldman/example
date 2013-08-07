require 'spec_helper'

describe ProductsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'view'" do
    it "returns http success" do
      get 'view'
      response.should be_success
    end
  end

end
