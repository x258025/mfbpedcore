*** Settings ***
Documentation     This test will verify CAMS AB application is Up or Not
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Library           ../Mainframe3270/    run_on_failure_keyword=None
Library           Dialogs
Library           OperatingSystem
Library           String
Library           Screenshot
Resource          mainframe_variables.robot
Resource          resources/CommonKeywords.robot
*** Test Cases ***
Flexible Payment Options: AB
    
    Login Into The Mainframe Region AB and verify
    
    Login Into the CRIS Application and verify
    
    Open Flexipay Payment Screen and verify for AB

    Logout CRIS Application

*** Keywords ***
Suite Setup
    Suite Setup for TPX_AB

Suite Teardown
    Logout CRIS Application
    Close Connection
    Sleep    1s