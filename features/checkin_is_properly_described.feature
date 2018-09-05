Feature: Does the EGI Website correctly describe the state of CheckIn?
  Everybody expects CheckIn to be in production, but it is only production for internal users.
  External users are able to enquire about it, even though it's marked as beta

  Scenario: CheckIn is in Beta for the world, but production internally
    Given I am on www.egi.eu
      When I go to Services
      Then I see a link to Internal Services
      And  I see a link to CheckIn
      And  The page shows that CheckIn for external users is in Beta
    Given I am on the services page
      When I go to internal services
      Then it has a list of services
      And  one of them is Security
      And  The security item lists CheckIn
      But  the service is not marked in Beta