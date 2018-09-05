Feature: Does the EGI Website show that CheckIn is production?
  Everybody expects CheckIn to be in production

  Scenario: CheckIn is in production
    Given I visit www.egi.eu
    When I go to Services
    Then I do not see CheckIn in Beta