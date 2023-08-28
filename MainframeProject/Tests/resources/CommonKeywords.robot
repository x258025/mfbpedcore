*** Settings ***
Library           ../../Mainframe3270/
Library           Dialogs
Library           OperatingSystem
Library           String
Library           Screenshot
Library           ../utils/genericUtils.py
Resource          ../mainframe_variables.robot
Resource          BaseKeywords.robot

*** Keywords ***
##Keywords for AB region Login
Login Into The Mainframe Region AB and verify
    Connect to AB Region
    Login into the AB Region

Connect to AB Region
    Log Reporting    Step1- Login into the TPX AB in ${REGION} region
    Capture Screen    LAUNCH.jpg             
    Verify actual and expected string    19    013    41    ${WELCOME_TITLE}
    Log Reporting    Region page displayed successfully
    Connect to region    ${REGION}

Login into the AB Region
    Login Into Region    ${REG_USERNAME}    ${REG_PASSWORD}    17    015    034
    Write Text and Enter    ${SELECT_NEWS}
    Capture Screen    LOGIN.jpg

##Keywords of Application login

Login Into the CRIS3 Application and verify
	Enter CRIS3 Application name and verify
	Login into the Application with valid credentials
	
Login Into the CRIS Application and verify
	Enter CRIS Application name and verify
	Login into the Application with valid credentials

Login Into the CRIS SS Application and verify
	Enter CRIS SS Application name and verify
    Login into the CRIS SS Application with valid credentials
    
Enter CRIS3 Application name and verify
    Log Reporting    Step2- Login into CRIS3 Application
    Write Text and Enter    /for cris3
    Verify actual and expected string    17    031    35    ${CRIS_APP_LOGINPAGE}
    Log Reporting    CRIS3 login page displayed successfully
    Capture Screen        LOGINPAGE.jpg
	
Enter CRIS Application name and verify 
    Log Reporting    Step2- Login into CRIS Application
    Write Text and Enter    /for cris
    Verify actual and expected string    17    031    35    ${CRIS_APP_LOGINPAGE}
    Log Reporting    CRIS login page displayed successfully
    Capture Screen        LOGINPAGE.jpg

Enter CRIS SS Application name and verify
    Log Reporting    Step2- Login into CRIS SS Application
    Write Text and Enter    /for cris ss
    Verify actual and expected string    17    031    35    ${CRIS_APP_LOGINPAGE}
    Log Reporting    CRIS SS login page displayed successfully
    Capture Screen        LOGINPAGE.jpg
    
Login into the Application with valid credentials
    Login Into Application    ${APP_USERNAME}    ${APP_PASSWORD}
    Verify actual and expected string    01    027    13    ${CRIS_APP_TITLE}
    Log Reporting    Homepage displayed successfully
    Capture Screen        DASHBOARD.jpg

Login into the CRIS SS Application with valid credentials
    # Login Into Application    ${APP_USERNAME}    ${APP_PASSWORD}
    # Verify actual and expected string    01    027    13    ${CRIS_APP_TITLE}
    Log Reporting    Homepage displayed successfully
    Capture Screen        DASHBOARD.jpg

##Keywords for AB BSC verification
Open CRIS3 AB BSC page to verify Health Check
    Log Reporting    Step3- Open BSC Screen to verify CRIS3 AB.
    Enter required details of AB region to navigate to BSC screen
    Verify BSC Screen
    Verify TN Number

Open CRIS AB BSC page to verify Health Check
    Log Reporting    Step3- Open BSC Screen to verify CRIS AB.
    Enter required details of AB region to navigate to BSC screen
    Verify BSC Screen
    Verify TN Number

Enter required details of AB region to navigate to BSC screen  
    ${TN}    Add Two String value    ${AB_PRE_TN}    ${POST_TN}    
    Write Text and Move to next field    ${TN}
    Write Text    ${SCREEN}
    Write Text and Enter    ${MONTH}
    Capture Screen        BSC_PAGE.jpg

##Keywords for BC Region Login
Login Into The Mainframe Region BC and verify
    Connect to BC Region
    Login into the BC Region

Connect to BC Region
    Log Reporting    Step1- Login into the TPX BC in ${REGION} region
    Capture Screen        LAUNCH.jpg
    Verify actual and expected string    04    002    20    ${REGION_TITLE}
    Log Reporting    Region page displayed successfully
    Connect to region    ${REGION}
	
Login into the BC Region
    Write Text and Enter    /for signon
    Verify actual and expected string    01    025    05    ${REGION_LOGIN_TITLE}
    Log Reporting    Region sign in page displayed.
    Login Into Region    ${REG_USERNAME}    ${REG_PASSWORD}    03    028    053
    Verify actual and expected string    20    020    22    ${LOGIN_ALERT}
    Log Reporting    Region logged in successfully
    Capture Screen        REGION_LOGIN.jpg
    ${PRESS_ESC}=    evaluate    genericUtils.clearScreen()    modules=genericUtils
    Sleep    3s

##Keywords for BC BSC verification
Enter required details of BC region to navigate to BSC screen
    ${TN}    Add Two String value    ${BC_PRE_TN}    ${POST_TN}
    Write Text and Move to next field    ${TN}
    Write Text    ${SCREEN}
    Write Text and Enter    ${MONTH}
    Capture Screen        BSC_PAGE.jpg


Open CRIS BC BSC page to verify Health Check
    Log Reporting    Step3- Open BSC Screen to verify CRIS BC.
    Enter required details of BC region to navigate to BSC screen
    Verify BSC Screen
    Verify TN Number

Open CRIS3 BC BSC page to verify Health Check
    Log Reporting    Step3- Open BSC Screen to verify CRIS3 BC.
    Enter required details of BC region to navigate to BSC screen
    Verify BSC Screen
    Verify TN Number

Enter required details of CRIS SS to navigate to SBSC screen


Verify SBSC CRISS SS Screen
    

Open CRIS SS BC SBSC page to verify Health Check
    Log Reporting    Step3- Open BSC Screen to verify CRIS SS BC.
    Enter required details of CRIS SS to navigate to SBSC screen
    Verify SBSC CRISS SS Screen

##Common Keywords for All testcases

Open CAMS Collection Screen to verify Health Check
    Log Reporting    Step3- Open Collection Screen to verify CAMS.
    Write Text on specific position    ${CAMS_SCREEN}    23    032
    Send Enter
    Verify actual and expected string    01    031    17    ${CAMS_COLLECTION_SCREEN_PAGE}
    Log Reporting    Collection Screen displayed successfully.
    Capture Screen    SS4_CAMSAB_PAGE.jpg

Verify BSC Screen
    #1. Verify screen name
    ${read_screen_title}    Read Text    01    035    27
    #Invalid TPX/NPP verification
    IF    "${read_screen_title}" == "${SCREEN_TITLE}"
        Compare Two String    ${SCREEN_TITLE}    ${read_screen_title}
        Log Reporting    BSC Screen Displayed successfully
    ELSE
        Assertion Fail    Alert- Please Enter valid TN Number
    END

Verify TN Number
    #2. Verify TN number name
    Verify actual and expected string    01    007    7    ${POST_TN}
    Log Reporting    TN number is displayed.
    Log Reporting    ${TEST_NAME} Health Check is verified.


Logout CRIS Application
    Send PF    1
    Sleep    2s 

Logout CAMS Application
    Send PF    3
    Send PF    1
    Sleep    2s 

Capture Screen
    [Arguments]    ${ssname}
    ${suite_source}    Get Variable Value    ${SUITE SOURCE}
    ${file_name}    Evaluate    os.path.basename($suite_source).split('.')[0]
    Screenshot.Take Screenshot    ${file_name}_${ssname}

Suite Setup for TPX_AB
    Open Connection    ${TPX_AB}
    Create Directory    ${FOLDER}
    Set Screenshot Directory    ${FOLDER}
    Change Wait Time    0.4
    Change Wait Time After Write    0.4
    Sleep    3s

Suite Setup for TPX_BC
    Open Connection    ${TPX_BC}
    Create Directory    ${FOLDER}
    Set Screenshot Directory    ${FOLDER}
    Change Wait Time    0.4
    Change Wait Time After Write    0.4
    Sleep    3s

#Soecs Application Keywords    
Login SOECS Application
    Write Text and Enter    ${SOECS_username}
    Write Text and Enter    ${SOECS_password}
    sleep    3s

Login into SOECS application
    Log Reporting    Step1- Login into the SOECS Application with valid credentials.
    Capture Screen    LAUNCH_PAGE.jpg
    Verify Page Contain Text    ${SOECS_LOGINPAGE}
    Login SOECS Application
    
 Verify SOECS homepage is displayed
    Log Reporting    Step2- Verify SOECS Application homepage.
    Verify Page Contain Text    ${SOECS_HOMEPAGE}
    Capture Screen    HOMEPAGE.jpg

Logout from SOECS application
    Log Reporting    Step3- Perform logout from SOECS application.
    Write Text and Enter    3
    Capture Screen        LOGOUT_PAGE.jpg

Suite Setup for SOECS
    Open Connection    ${HOST_soecs}
    Create Directory    ${FOLDER}
    Set Screenshot Directory    ${FOLDER}
    Change Wait Time    0.4
    Change Wait Time After Write    0.4
    Sleep    3s

Open Flexipay Payment Screen and verify for AB
    Log Reporting    Step3- Open FLEX screen and verify
    Enter required details of AB region to navigate to FLEX Page
    Verify actual and expected string    02    013    7    ${POST_TN}
    Verify actual and expected string    03    071    3    ${FLEX_SCREEN}
    Log Reporting    TN and Application name verified successfully.

Enter required details of AB region to navigate to FLEX Page
    ${TN}    Add Two String value    ${AB_PRE_TN}    ${POST_TN}    
    Write Text and Move to next field    ${TN}
    Write Text and Enter    ${FLEX_SCREEN}
    Capture Screen        FLX_PAGE.jpg

Open Flexipay Payment Screen and verify for BC
    Log Reporting    Step3- Open FLEX screen and verify
    Enter required details of BC region to navigate to FLEX Page
    Verify actual and expected string    02    013    7    ${POST_TN}
    Verify actual and expected string    03    071    3    ${FLEX_SCREEN}
    Log Reporting    TN and Application name verified successfully.

Enter required details of BC region to navigate to FLEX Page
    ${TN}    Add Two String value    ${BC_PRE_TN}    ${POST_TN}    
    Write Text and Move to next field    ${TN}
    Write Text and Enter    ${FLEX_SCREEN}
    Capture Screen        FLX_PAGE.jpg

Open Pre Authorised Payment Details and verify for AB
    Open PAPI for AB Screen and verify
    Open PAPD screen and verify

Open PAPI for AB Screen and verify
    Log Reporting    Step3- Open PAPI Screen to verify PAPI page.
    Enter required details of AB region to navigate to PAPI Page
    Verify actual and expected string    01    025    36    ${PAPI_SCREEN}
    Log Reporting    Screen name verified successfully.
    Verify actual and expected string    02    010    7    ${POST_TN}
    Verify actual and expected string    03    021    4    ${START_PAPI}
    Log Reporting    TN and app name verified successfully.
    Capture Screen        PAPI_SCREEN.jpg
    Sleep    1s

Open PAPD screen and verify
    Log Reporting    Step4- Open PAPD Screen to verify PAPD page.
    Write Text on specific position    ${START_PAPD}    03    021
    Send Enter
    Sleep    1s
    Verify actual and expected string    01    025    29    ${PAPD_SCREEN}
    Log Reporting    Screen name verified successfully.
    Verify actual and expected string    02    010    7    ${POST_TN}
    Verify actual and expected string    03    021    4    ${START_PAPD}
    Log Reporting    TN and app name verified successfully.
    Capture Screen        PAPD_SCREEN.jpg

Enter required details of AB region to navigate to PAPI Page
    ${TN}    Add Two String value    ${AB_PRE_TN}    ${POST_TN}    
    Write Text and Move to next field    ${TN}
    Write Text on specific position    ${INQ_SCREEN}    23    032
    Write Text on specific position    ${START_PAPI}    23    052
    Send Enter
    Capture Screen        PAPI_PAGE.jpg


Open Pre Authorised Payment Details and verify for BC
    Open PAPI Screen for BC and verify
    Open PAPD screen and verify

Open PAPI Screen for BC and verify
    Log Reporting    Step3- Open PAPI Screen to verify PAPI page.
    Enter required details of BC region to navigate to PAPI Page
    Verify actual and expected string    01    025    36    ${PAPI_SCREEN}
    Log Reporting    Screen name verified successfully.
    Verify actual and expected string    02    010    7    ${POST_TN}
    Verify actual and expected string    03    021    4    PAPI
    Log Reporting    TN and app name verified successfully.
    Capture Screen        PAPI_SCREEN.jpg
    Sleep    1s

Enter required details of BC region to navigate to PAPI Page
    ${TN}    Add Two String value    ${BC_PRE_TN}    ${POST_TN}    
    Write Text and Move to next field    ${TN}
    Write Text on specific position    ${INQ_SCREEN}    23    032
    Write Text on specific position    ${START_PAPI}    23    052
    Send Enter
    Capture Screen        PAPI_PAGE.jpg

    

