Feature: Delete user.
  As a manager user
  I need a way to delete any kind of user
  for perform the admin role functions.

  Scenario: Delete an user.
    Given url 'https://dummyapi.io/data/v1/user/60d0fe4f5311236168a109cf'
    And header app-id = '63530a1213db235358002de7'
    When method delete
    Then request 200
    And print response
    And match $.id == '60d0fe4f5311236168a109cf'
    And match response.id == '60d0fe4f5311236168a109cf'
    And match response == read('schemas/delete-user-schema.json')
