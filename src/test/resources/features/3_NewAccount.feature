Feature: Verify  new customer Account creation

  Scenario Outline: Verify MGR can log in and successfully add a new account
    Given the user open the website provided valid login details "mngr647426" "vAsAvEg"
    And user navigates to Add account webpage and applied customer data "<Accounttype>", "<Initialdep>"
    When the user click on Submit
    Then the website should give Account created Successfully!!!

    Examples:
      | Accounttype | Initialdep |
      | Savings     | 5554       |


  Scenario Outline: Verify Rejection on Adding customer acount with invalid Data
    Given the user open the website provided valid login details "mngr647426" "vAsAvEg"
    And user navigates to Add account webpage and applied customer data "<Accounttype>", "<Initialdep>"
    When enter wrong data
    Then the website should give text "<Case>" "<msg>"

    Examples:
      | Accounttype | Initialdep | msg                               | Case      |
      | Current     |            | Initial Deposit must not be blank | message19 |
      | Savings     | sadasd     | Characters are not allowed        | message19 |
