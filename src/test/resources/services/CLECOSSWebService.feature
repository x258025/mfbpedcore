@Ignore
Feature: Operation Ping V1_0

  Background: Configuration - Set up the authentication, Headers, and params
  #Configure the Authentication
    * def payload = karate.properties['karate.CLECPAYLOAD']


  Scenario: CLECOSS
  	#Set endpoint url
    Given url ENDPOINT_CLECOSS
    And request payload
    And header Content-Type = 'text/xml; charset=utf-8'
    And header SOAPAction = ''
    When method post
		#Request XML passed for the operation and printing the same for verification
    Then status 200



