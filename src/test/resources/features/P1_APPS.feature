Feature: BPED Apps HealthCheck

  Background: 
    Given test data configuration for "BPED Apps HealthCheck"

  #================
  #P1 Priority Apps
  #================
  @RRW @ALLAPPS @P1-APPS @PROD-Batch1
  Scenario: Residential Resellers
    Given user login into "RRW"
    Then verify RRW Homepage is displayed
    Then perform search from RRW
    Then logout from "RRW"

  @VPOP @ALLAPPS @P1-APPS @CONTROL
  Scenario: VPOP - Batch
    Then verify "VPOP-INTERNAL" Jobs in ControlM

  @VPOP @ALLAPPS @P1-APPS @PROD-Batch1
  Scenario: VPOP - INTERNAL
    Given user login into "VPOP-INTERNAL"
    Then verify VPOP-Internal Homepage is displayed
    Then perform search from VPOP-Internal

  @VPOP @ALLAPPS @P1-APPS @PROD-Batch1
  Scenario: VPOP - EXTERNAL
    Given user login into "VPOP-EXTERNAL"
    Then verify VPOP-External Homepage is displayed
    Then perform search from VPOP-External
    Then logout from "VPOP-External"

  @OST @ALLAPPS @P1-APPS @PROD-Batch1
  Scenario: Order Status Tool
    Given user login into "OST"
    Then verify OST Homepage is displayed
    Then verify all header link is working of OST
    Then logout from "OST"

  @OST @ALLAPPS @P1-APPS @CONTROL
  Scenario: Order Status Tool - Batch
    Then verify "OST" Jobs in ControlM

  @LSR @ALLAPPS @P1-APPS @PROD-Batch1
  Scenario: Local Service Request
    Given user login into "LSR"
    Then verify LSR Homepage is displayed
    Then perform search from LSR
    Then logout from "LSR"

  @LSR @ALLAPPS @P1-APPS @CONTROL
  Scenario: Local Service Request - Batch
    Then verify "LSR" Jobs in ControlM

  @REX @ALLAPPS @P1-APPS @PROD-Batch1
  Scenario: Rebiller
    Given user login into "REX"
    Then verify REX Rebiller Express Homepage is displayed
    Then perform search from REX
    Then logout from "REX"

  @REX @ALLAPPS @P1-APPS @CONTROL
  Scenario: Rebiller - Batch
    Then verify "REX" Jobs in ControlM

  @AAB @ALLAPPS @P1-APPS @CONTROL
  Scenario: Assurance Account Batch
    Then verify "AAB" Jobs in ControlM

  @LEGACY-IVS @ALLAPPS @P1-APPS @PROD-Batch1
  Scenario: Evolve Voice Services - Legacy
    Given user login into "LEGACY-IVS"
    Then verify Legacy IVS Homepage is displayed
    Then perform search from Legacy IVS
    Then logout from "LEGACY-IVS"

  @IVS2-Internal @ALLAPPS @P1-APPS @IVS2-UI
  Scenario: Evolve Voice Services - INTERNAL
    Given user login into "IVS2-Internal"
    Then verify IVS2-Internal Homepage is displayed
    Then perform search from IVS2 Upgrade Internal
    Then logout from "IVS2-Internal"

  @IVS2-EXTERNAL @ALLAPPS @P1-APPS @IVS2-UI @PROD-Batch1
  Scenario: Evolve Voice Services - EXTERNAL
    Given user login into "IVS2-EXTERNAL"
    Then verify IVS2-EXTERNAL Homepage is displayed
    Then perform search from IVS2 Upgrade External
    Then logout from "IVS2-External"

  @CMS @ALLAPPS @P1-APPS @PROD-Batch1
  Scenario: CMS Web Service
    Then verify CMS WebService response

  @KBG @ALLAPPS @P1-APPS
  Scenario: Kenan Billing Gateway
    Then verify "KBG" Jobs in ControlM

  @CLECOSS @ALLAPPS @P1-APPS @PROD-Batch1
  Scenario: CLEC OSS
    Then verify CLEC OSS WebService response

  @KBP @CitrixApps 
  Scenario: Kenan Billing Platform
    Given user login into "KBP"
    And verify KCB application links downloadable
    And Search For Customer In KBP

  @TFOS @ALLAPPS @P1-APPS
  Scenario: TollFreeOrderStatusRESTSvc
    Then verify TOLL FREE ORDER STATUS WebService response

  @CSOM @ALLAPPS @P1-APPS @NAPI
  Scenario: CRISServiceOrderManagementAPI
    Then verify CSOM WebService response

  @GNBE @ALLAPPS @P1-APPS @PROD-Batch1
  Scenario: GOnet Billing Engine
    Given user login into "GNBE"
    Then verify GOnet Billing Engine Homepage is displayed
    Then verify all servers are running
  #================
  #Mainframe Apps
  #================
  
  @Mainframe @ALLAPPS @P1-APPS-MF @CRIS1AB @test
  Scenario: Customer Records Information System 1 / Inquiry: AB
    Given Test "CRISAB" Applications
    
 	@Mainframe @ALLAPPS @CRIS3AB @P1-APPS-MF
  Scenario: CRIS3: Customer Records Information System 3 / Service Order System: AB
    Given Test "CRIS3AB" Applications

  @Mainframe @ALLAPPS @SOECS @P1-APPS-MF
  Scenario: Service Order Entry and Control System
    Given Test "SOECS" Applications
    
  @Mainframe @ALLAPPS @CRIS1BC @P1-APPS-MF
  Scenario: Customer Records Information System 1 / Inquiry: BC
    Given Test "CRISBC" Applications

	@Mainframe @ALLAPPS @CRIS3BC @P1-APPS-MF
  Scenario: CRIS3: Customer Records Information System 3 / Service Order System: BC
    Given Test "CRIS3BC" Applications
    
	#Additional TC's
	@Mainframe @P1-APPS-MF @CRIS2AB @test
  Scenario: Customer Records Information System 2 / Update: AB
    Given Test "CRISAB" Applications
    
  @Mainframe @P1-APPS-MF @CDBSAB
  Scenario: Customer Data Base System: AB
    Given Test "CRISAB" Applications
    
  @Mainframe @CRISBC @P1-APPS-MF	@CRIS2BC
  Scenario: Customer Records Information System 2 / Update: BC
    Given Test "CRISBC" Applications

	@Mainframe @CRIS3BC @P1-APPS-MF	@CDBSBC
  Scenario: Customer Data Base System: BC
    Given Test "CRISBC" Applications

  @Mainframe	@P1-APPS-MF @CBNAB
  Scenario: Consolidated Billing Number: AB
    Given Test "CRISAB" Applications
		Given Test "CRIS3AB" Applications

	@Mainframe	@P1-APPS-MF @CBNBC
  Scenario: Consolidated Billing Number: BC
    Given Test "CRISBC" Applications
		Given Test "CRIS3BC" Applications
