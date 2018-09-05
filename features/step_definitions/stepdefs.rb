require 'watir'
require "rspec/expectations"

Before do
  @browser ||= Watir::Browser.new :firefox
end

Given("I am on www.egi.eu") do
  
  @browser.goto "https://egi.eu"
  expect(@browser.title).to eq("EGI | EGI Advanced Computing Services for Research")
  expect(@browser.link(href: "https://www.egi.eu/services/")).to exist
end

When("I go to Services") do
  @browser.link(href: "https://www.egi.eu/services/").click()
end

Then("I see a link to Internal Services") do
  expect(@browser.link(href: "https://www.egi.eu/internal-services/")).to exist
end

Then("I see a link to CheckIn") do
  # table holder div should be there
  expect(@browser.h3(class: "service_title", text: "Security")).to exist
  # A link with CheckIn should be there
  expect(@browser.link(href: "https://www.egi.eu/services/check-in/")).to exist
end

Then("The page shows that CheckIn for external users is in Beta") do
  expect(@browser
        .link(visible_text: /Check-in/,
              href: "https://www.egi.eu/services/check-in/")).to exist
  expect(@browser.h5.span(style: 'color: #1e73be;')).to exist
  expect(@browser.span(style: 'color: #1e73be;', text: /^check-in.*beta/i)).to exist
end

Given("I am on the services page") do
  @browser.goto('https://egi.eu/services/')
end


When("I go to internal services") do
  @browser.link(visible_text: /internal services/i).click()
end

Then("it has a list of services") do
  # there are three columns of services (wpb_column vc_column_container vc_col-sm-6)
  # Security is in the first one.
  # The other two are "Co-ordination" and "Operations"
  expect(@browser.divs(class: ['wpb_column', 'vc_column_container', 'vc_col-sm-6']).length).to eq(3)
end

Then("one of them is Security") do
  # test that the icon is the same as a reference - https://stackoverflow.com/questions/16841401/compare-two-images-using-selenium-ruby-webdriver#16852123
  expect(@browser.h3(class: 'service_title').text).to match(/security/i)
end

Then("The security item lists CheckIn") do
  expect(@browser.h6(class: 'icon_title').text).to match(/check-in/i)
end

Then("the service is not marked in Beta") do
  expect(@browser.h6(class: 'icon_title').text).not_to match(/beta/i)
end

After do
  @browser.close
end