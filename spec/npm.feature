Feature: npm

  Rules:
  - generated files are owned by the current user

  Scenario: npm init
    Given `package.json` does not exist
    When I run `npm init`
    Then `package.json` should be owned by the current user