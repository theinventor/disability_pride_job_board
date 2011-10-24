require 'spec_helper'

describe WelcomeController do
  include Devise::TestHelpers
  render_views

  #before (:each) do
  #  @user = Factory.create(:user)
  #  sign_in @user
  #end


  describe "GET 'index'" do

    it "should be successful" do
      Factory.create(:subscriber)
      get 'index'
      response.should be_success
    end

    #it "should have the right title" do
    #  get 'home'
    #  response.should have_selector("title",
    #    :content => "Home")
    #end

  end

  describe "GET 'about'" do
    it "should be successful" do
      Factory.create(:content, :page_name => "about")
      get 'about'
      response.should be_success
    end

  #  it "should have the right title" do
  #    get 'about'
  #    response.should have_selector("title",
  #                                  :content => "About")
  #  end
  end

  describe "GET 'faq'" do
    it "should be successful" do
      Factory.create(:content, :page_name => "faq")

      get 'faq'
      response.should be_success
    end

  #  it "should have the right title" do
  #    get 'faq'
  #    response.should have_selector("title",
  #                                  :content => "F.A.Q.")
  #  end
  end

  #describe "GET 'help'" do
  #  it "should be successful" do
  #    get 'help'
  #    response.should be_success
  #  end
  #
  #  it "should have the right title" do
  #    get 'help'
  #    response.should have_selector("title",
  #      :content => "Help")
  #  end
  #end
end

