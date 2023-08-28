@Ignore
Feature: Operation Ping V1_0

  Background: Configuration - Set up the authentication, Headers, and params
  #Configure the Authentication
    * def dynakey = karate.properties['karate.dyna']

  Scenario: Testing valid GET endpoint
    Given url ENDPOINT_DYNATRACE
    And header Authorization = 'Api-Token '+ dynakey
    * configure proxy = 'http://198.161.14.25:8080'
    When method GET
    Then status 200
