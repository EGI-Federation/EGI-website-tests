require 'watir'
require "rspec/expectations"

Given("I visit www.egi.eu") do
  @browser ||= Watir::Browser.new :firefox
  @browser.goto "https://egi.eu"
  @browser.title.should == "watir - Google Search"
end

When("I go to Services") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I do not see CheckIn in Beta") do
  pending # Write code here that turns the phrase above into concrete actions
end
