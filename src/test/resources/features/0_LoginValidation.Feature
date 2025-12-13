Feature: Verify login as MGR account

  Scenario Outline: Verify MGR can log in with valid username and password
    Given the user open the website provided valid login details "mngr647426" "vAsAvEg"
    And user navigates to Add customer webpage and applied customer data "<CustomerName>", "<Gender>", "<DOB>", "<Address>", "<City>", "<State>", "<PIN>", "<Telephone>", "<Email>", "<Password>"
    When the user click on submit
    Then the website should give "Customer Registered Successfully!!!"

    Examples:
      | CustomerName | Gender | DOB        | Address             | City  | State             | PIN    | Telephone   | Email               | Password |
      | Ahmed Hassan | Male   | 12-05-1998 | 15 El Tahrir Street | Cairo | Cairo Governorate | 115111 | 01005557893 | ahmssjjjh@gmail.com | dsdasd   |
