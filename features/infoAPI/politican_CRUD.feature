Feature: Politician data CRUD

  Scenario Outline: Add Politician to the data pool
    Given a system has all the mandatory information
    Then a politician can be added to the data pool by providing the mandatory field
      | name   | country   | yob   | position   | risk   |
      | <name> | <country> | <yob> | <position> | <risk> |

    And the response generated contains generated ID for the entity and the fields

    Examples:
      | name  | country          | yob  | position | risk |
      | Peach | Mushroom Kingdom | 1965 | Standing | 1    |

#    Above scenario seems to not be saving the yob for a politician
#    Even tried to pass it as an integer to see if the service would save it but it does not save the YOB


  Scenario: Retrieve 5 latest politicians
    Given A user calls the InfoAPI service
    Then the latest 5 politicians are returned in decending order of the date that they were created

  Scenario Outline: Retreive Politician data
    Given A call is made to the InfoAPI with the politician ID
      | id   |
      | <id> |

    Then then politician information will be returned
      | id   |
      | <id> |

    Examples:
      | id                       |
      | 5d6746cb0f069803f0611324 |
