Feature: Update user.
  As a manager user
  I need a way to update any kind of user information
  for perform the admin role functions and so, the user would continue they work process too.

  Scenario: Update a normal user using all fields.
    Given url 'https://dummyapi.io/data/v1/user/635c3ab823f2790bfc2c0e45'
    And headers {app-id: '63530a1213db235358002de7', Content-Type: 'application/json'}
    And def bodyRequest =
    """
      {
        "title": "mr",
        "firstName": "pedro",
        "lastName": "navajas",
        "gender": "male",
        "email": "bla.andersen@example.com",
        "phone": "760-386-1377"
      }
    """
    And request bodyRequest
    When method put
    Then request 200
    And print response

    And match response.id == '#string'
    And match response.title == bodyRequest.title
    And match response.firstName == bodyRequest.firstName
    And match response.lastName == bodyRequest.lastName
    And match $.gender == bodyRequest.gender
    And match $.email == bodyRequest.email
    And match $.phone == bodyRequest.phone
    And match $.registerDate == '#string'
    And match $.updatedDate == '#string'

    And match response == read('schemas/update-user-schema.json')