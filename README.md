# EGI Website tests

[![Build Status](https://travis-ci.org/EGI-Foundation/EGI-website-tests.svg?branch=master)](https://travis-ci.org/EGI-Foundation/EGI-website-tests) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/d6a36ccb73d54709a9e09e56ed134940)](https://app.codacy.com/app/brucellino/EGI-website-tests?utm_source=github.com&utm_medium=referral&utm_content=EGI-Foundation/EGI-website-tests&utm_campaign=Badge_Grade_Settings)

These are behaviour-driven tests for the [EGI website](https://egi.eu), using [cucumber](https://docs.cucumber.io/).
The [features](/features) directory contains user stories and features that the website should have.
The features are written in the [gherkin](https://docs.cucumber.io/gherkin/) language, using plain human language.
Tests are implemented in ruby, and found in the [`features/step_definitions/`](/features/step_definitions/) directory.

## How to use this repo

If you have a scenario or feature which should be present on the website, it should come here.
You should be able to run the tests on your local setup in order to test your proposed feature, before opening a pull request and discussing it.
This will require an installation of cucumber, and backing tools for browser automation.

### Tools, Browsers and Drivers

We use [Watir](https://watir.com) to implement the tests, which in turn requires a selenium driver for the browser you want to test with.
[Watir's documentation](www.rubydoc.info/gems/watir/) goes into detail about how to use it, but their [guides](http://watir.com/guides/) are more readable when getting started:

  - [Install Ruby](http://watir.com/guides/ruby/)
  - [Install Watir](http://watir.com/guides/installation/)
  - [Install Drivers](http://watir.com/guides/drivers/)

For an example, see the [`before_install` part of the Travis setup](/.travis.yml)

### Describe your feature

We refer to the [Cucumber documentation](https://docs.cucumber.io) for explaining how to do this.
A good starting point is [their BDD overview](https://docs.cucumber.io/guides/overview/)

### Execute the tests

Running the tests is simple: just execute `cucumber` on the command line :tada:
You should get a test summary:

```
egi-website-tests$ cucumber
@checkin @public @engagement
Feature: Does the EGI Website correctly describe the state of CheckIn?
  Everybody expects CheckIn to be in production, but it is only production for internal users.
  External users are able to enquire about it, even though it's marked as beta

  Scenario: CheckIn is in Beta for the world, but production internally # features/checkin_is_properly_described.feature:6
    Given I am on www.egi.eu                                            # features/step_definitions/stepdefs.rb:8
    When I go to Services                                               # features/step_definitions/stepdefs.rb:15
    Then I see a link to Internal Services                              # features/step_definitions/stepdefs.rb:19
    And I see a link to CheckIn                                         # features/step_definitions/stepdefs.rb:23
    And The page shows that CheckIn for external users is in Beta       # features/step_definitions/stepdefs.rb:30
    Given I am on the services page                                     # features/step_definitions/stepdefs.rb:38
    When I go to internal services                                      # features/step_definitions/stepdefs.rb:43
    Then it has a list of services                                      # features/step_definitions/stepdefs.rb:47
    And one of them is Security                                         # features/step_definitions/stepdefs.rb:54
    And The security item lists CheckIn                                 # features/step_definitions/stepdefs.rb:59
    But the service is not marked in Beta                               # features/step_definitions/stepdefs.rb:63

1 scenario (1 passed)
11 steps (11 passed)
0m13.735s
```

Tests that fail are then used to help the developers implement desired features on the service.

### Send a pull request, discuss

Features and scenarios need to be agreed upon by several groups and roles. Although an individual can propose tests which can drive the development of a service, it is the diverse perspectives of various stakeholders which will decide what features and scenarios are valid and desirable.

The typical way to do this is the typical git-flow way:

 - clone the repository to your own account
 - work on a feature with some scenarios
 - open a pull request and ask for review from user representatives and product owners
 - get developer feedback

Requests for new features may also be made for features by opening issues, or linking to existing user stories elsewhere.

