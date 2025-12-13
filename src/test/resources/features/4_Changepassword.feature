Feature: Verify Change password feature

  Scenario Outline: Verify MGR can log in and successfully add a new account
    Given the user open the website provided valid login details "mngr647426" "vAsAvEg"
    And user navigates to Edit Account webpage and applied customer data "<oldpassword>", "<newpassword>"
    When the user click on submit
    Then the website gives "<popupmsg>"


    Examples:
      | oldpassword | newpassword | popupmsg                  |
      | vAsAvEg@3   | vAsAvEg@3   | Password is Changed       |
      | vAsAvEg     | vAsAvEg@3   | Old Password is incorrect |


  Scenario Outline: Verify Rejection on Change password with invalid one
    Given the user open the website provided valid login details "mngr647426" "vAsAvEg"
    And user navigates to Edit Account webpage and applied customer data "<oldpassword>", "<newpassword>"
    When enter wrong data
    Then the website should give text "<Case>" "<msg>"
#
    Examples:
      | oldpassword | newpassword | Case      | msg                                  |  |
      |             | vAsAvEg@3   | message20 | Old Password must not be blank       |  |
      | vAsAvEg@3   |             | message21 | New Password must not be blank       |  |
      | vAsAvEg@3   | vAsAvEg     | message21 | Enter at-least one numeric value     |  |
      | vAsAvEg@3   | vAsAvEg3    | message21 | Enter at-least one special character |  |
      | vAsAvE      | vAsAvEg3    | message21 | Enter at-least one special character |  |
