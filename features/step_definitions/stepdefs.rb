require 'watir'
require "rspec/expectations"

Given("I am on www.egi.eu") do
  @browser ||= Watir::Browser.new :firefox
  @browser.goto "https://egi.eu"
  @browser.title.should == "EGI | EGI Advanced Computing Services for Research"
  @browser.link(href: "https://www.egi.eu/services/").should exist
end

When("I go to Services") do
  @browser.link(href: "https://www.egi.eu/services/").click()
end

Then("I see a link to Internal Services") do
  @browser.link(href: "https://www.egi.eu/internal-services/").should exist
end

Then("I see a link to CheckIn") do
  # table holder div should be there
  @browser.h3(class: "service_title", text: "Security").should exist
  # A link with CheckIn should be there
  @browser.link(href: "https://www.egi.eu/services/check-in").should exist
end

Then("The page shows that CheckIn for external users is in Beta") do
  @browser.h5(text: "BETA").should exist
  @browser.close
end

Given("I visit the services page") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I go to internal services") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("it has a list of services") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("one of them is Security") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("The security item lists CheckIn") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the service is not marked in Beta") do
  pending # Write code here that turns the phrase above into concrete actions
end