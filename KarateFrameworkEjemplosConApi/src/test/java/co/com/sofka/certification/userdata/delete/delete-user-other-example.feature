Feature: Delete user.
    As a manager user
    I need a way to delete any kind of user
    for perform the admin role functions.

    Scenario: Delete an user.
        Given call read('../common-definitions.feature@CommonDefinitionsCreateUser')
        And headers headerConfiguration
        And url 'https://dummyapi.io/data/v1/user/' + userCreationResponse.id
        When method delete
        Then request 200
        And print response
        And match $.id == userCreationResponse.id
        And match response == read('schemas/delete-user-schema.json')
