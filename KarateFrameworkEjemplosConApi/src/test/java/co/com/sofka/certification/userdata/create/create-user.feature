Feature: Create user.
  As a manager user
  I need a way to create any kind of user
  for perform the admin role functions and so, the user would star they work process too.

  Scenario: Create a normal user.
    Given url 'https://dummyapi.io/data/v1/user/create'
    And header app-id = '63516da13945d3e8da8889d7'
    And def bodyRequest =
        """
      {
        "title": "mr",
        "firstName": "Mary",
        "lastName": "Casas",
        "gender": "male",
        "email": "mary.casas@sofka.com",
        "phone": "918.240.2878"
      }
    """
    And request bodyRequest
    When method post
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
    And match response == read('schemas/create-user-schema.json')

  Scenario: Create a normal user - other version.
    Given url 'https://dummyapi.io/data/v1/user/create'
    And header app-id = '63516da13945d3e8da8889d7'
    And def bodyRequest =
        """
      {
        "title": "mr",
        "firstName": "Mary",
        "lastName": "Casas",
        "gender": "male",
        "email": "sswwe.casas@sofka.com",
        "phone": "918.240.2878"
      }
    """
    And request bodyRequest
    When method post
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
    And match response ==
    """
    {
      "id": "#string",
      "title": "#string",
      "firstName": "#string",
      "lastName": "#string",
      "gender": "#string",
      "email": "#string",
      "phone": "#string",
      "registerDate": "#string",
      "updatedDate": "#string"
    }
    """

