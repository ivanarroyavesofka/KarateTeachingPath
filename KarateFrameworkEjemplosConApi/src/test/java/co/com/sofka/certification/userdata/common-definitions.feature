@ignore
Feature: Common definitions.

  Background:
    * def headerConfiguration = {app-id: '63530a1213db235358002de7', Content-Type: 'application/json; charset=utf-8'}

  @CommonDefinitionsCreateUser
  Scenario: create user
    Given url 'https://dummyapi.io/data/v1/user/create'
    And headers headerConfiguration
    * def randomString =
    """
      function(s) {
       var text = "";
       var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
       for (var i = 0; i < s; i++)
         text += possible.charAt(Math.floor(Math.random() * possible.length));
       return text;
      }
    """
    * def firtsName =  randomString(5)
    * def lastName =  randomString(5)
    * def email =  firtsName + '.' + lastName + '@sofka.com'
    And def bodyRequest =
        """
      {
        "title": "mr",
        "firstName": '#(firtsName)',
        "lastName": '#(lastName)',
        "gender": "male",
        "email": '#(email)',
        "phone": "918.240.2878"
      }
    """
    And request bodyRequest
    When method post
    Then request 200
    * def userCreationResponse = response
    And print response
