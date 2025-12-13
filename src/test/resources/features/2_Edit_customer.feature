Feature: Verify Edit the customer account
Scenario Outline: Verify user can Edit customer Detials
  Given the user open the website provided valid login details "mngr647426" "vAsAvEg"
  Given user navigates to Edit Customer webpage and applied Valid customer ID
  And user edited applied customer data "<Address>", "<City>", "<State>", "<PIN>", "<Telephone>", "<Email>", "<Password>"
  When the user click on submit
  Then the website gives "customer edited successfully"
  Examples:
      | Address          | City | State            | PIN    | Telephone   | Email                | Password |
      | 22 Nile Corniche | Giza | Giza Governorate | 125156 | 01009987766 | sara.ali@example.com | dsdasd   |


Scenario Outline: Verify Rejection on Editing with invalid Data
    Given the user open the website provided valid login details "mngr647426" "vAsAvEg"
    Given user navigates to Edit Customer webpage and applied Valid customer ID
    And user edited applied customer data "<Address>", "<City>", "<State>", "<PIN>", "<Telephone>", "<Email>", "<Password>"
    Then the website should give text "<Case>" "<msg>"
    Examples:
      | Address                   | City  | State             | PIN    | Telephone   | msg                                | Case     | Email            | Password |
      | @##$%^&                   | Cairo | Cairo Governorate | 114446 | 01006664422 | Special characters are not allowed | message3 | dsdasd@gmail.com |          |
      | 55 Talaat Harb Street`    |       | Giza Governorate  | 112665 | 01001112233 | City Field must not be blank       | message4 | dsdasd@gmail.com |          |
      | 12 Lorem Ipsum` Apartment | 213   | Cairo Governorate | 115116 | 01002251521 | Numbers are not allowed            | message4 | dsadas@gmail.com |          |
      | 12 Lorem Ipsum Apartment  | #@$   | Cairo Governorate | 114446 | 01006664422 | Special characters are not allowed | message4 | dsdasd@gmail.com |          |
      | 12 Lorem Ip`sum Apartment | Cairo |                   | 114446 | 01006664422 | State must not be blank            | message5 | dsdasd@gmail.com |          |
      | 55 Talaat Harb Street`    | Cairo | @#$               | 112665 | 01001112233 | Special characters are not allowed | message5 | dsdasd@gmail.com |          |
      | 12 Lorem Ip`sum Apartment | Cairo | 12345             | 115116 | 01002251521 | Numbers are not allowed            | message5 | dsadas@gmail.com |          |
      | 12 Lorem Ipsum Apartment  | Cairo | Cairo Governorate | 1144   | 01006664422 | PIN Code must have 6 Digits        | message6 | dsdasd@gmail.com |          |
      | 12 Lorem Ipsum` Apartment | Cairo | Cairo Governorate | ASDSAD | 01006664422 | Characters are not allowed         | message6 | dsdasd@gmail.com |          |
      | 12 Lorem Ipsum Apartment  | Cairo | Cairo Governorate | @#$    | 01006664422 | Special characters are not allowed | message6 | dsdasd@gmail.com |          |
      | 12 Lorem Ipsum Apart`ment | Cairo | Cairo Governorate |        | 01006664422 | PIN Code must not be blank         | message6 | dsdasd@gmail.com |          |
      | 12 Lorem Ipsum Apartment  | Cairo | Cairo Governorate | 123456 |             | Mobile no must not be blank        | message7 | dsdasd@gmail.com |          |
