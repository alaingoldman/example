require 'spec_helper'

describe "Help page" do
  
  it "should have the content 'Help'" do
  	visit '/static_pages/help'
    page.should have_selector('h1', :text => "Help")
  end

  it "should have the right title" do
  	visit '/static_pages/help'
  	page.should have_selector('title', :text => "title a | Help")
	end
end

describe "Home page" do
  it "should have the content 'Home'" do
  	visit '/static_pages/home'
    page.should have_selector('h1', :text => "Home")
  end
  it "should have the right title" do
    visit '/static_pages/home'
    page.should have_selector('title', :text => "title a")
  end
end
