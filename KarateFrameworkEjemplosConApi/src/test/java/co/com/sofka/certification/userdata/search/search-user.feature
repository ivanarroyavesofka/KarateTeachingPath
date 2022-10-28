Feature: Search user.
  As a manager user
  I need a way to search any kind of user
  for perform the admin role functions.

  Scenario: Search all users.
    Given url 'https://dummyapi.io/data/v1/user'
    And header app-id = '63530a1213db235358002de7'
    When method get
    Then request 200
    And print response
    And match response.limit == 20
    And match $.limit == 20
    And match response == read('schemas/search-users-schema.json')