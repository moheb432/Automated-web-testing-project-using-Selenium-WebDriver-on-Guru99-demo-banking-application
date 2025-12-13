Feature: Verify  ADD new customer with MGR account

  Scenario Outline: Verify MGR can log in and successfully add a customer
    Given the user open the website provided valid login details "mngr647426" "vAsAvEg"
    And user navigates to Add customer webpage and applied customer data "<CustomerName>", "<Gender>", "<DOB>", "<Address>", "<City>", "<State>", "<PIN>", "<Telephone>", "<Email>", "<Password>"
    When the user click on submit
    Then the website should give "Customer Registered Successfully!!!"

   Examples:
     | CustomerName | Gender | DOB        | Address             | City  | State             | PIN    | Telephone   | Email                   | Password |
#     | Ahmed Hassan | Male   | 12-05-1998 | 15 El Tahrir Street | Cairo | Cairo Governorate | 115111 | 01005557893 | ahmssjj5565jh@gmail.com | dsdasd   |


  Scenario Outline: Verify Rejection on Adding customer with invalid Data
    Given the user open the website provided valid login details "mngr647426" "vAsAvEg"
    And user navigates to Add customer webpage and applied customer data "<CustomerName>", "<Gender>", "<DOB>", "<Address>", "<City>", "<State>", "<PIN>", "<Telephone>", "<Email>", "<Password>"
    When enter wrong data
    Then the website should give text "<Case>" "<msg>"

    Examples:
      | CustomerName  | Gender | DOB        | Address                  | City       | State                  | PIN    | Telephone    | Email                    | msg                                | Case      | Password |
      |               | Female | 11-23-1995 | 22 Nile Corniche         | Giza       | Giza Governorate       | 125156 | 01009987766  | sara.ali@example.com     | Customer name must not be blank    | message   | dsdasd   |
      | ahmed@hassan  | Female | 11-23-1995 | 22 Nile Corniche         | Giza       | Giza Governorate       | 125156 | 01009987766  | sara.ali@example.com     | Special characters are not allowed | message   | dsdasd   |
      | sadsd2132     | Female | 11-23-1995 | 22 Nile Corniche         | Giza       | Giza Governorate       | 125156 | 01009987766  | sara.ali@example.com     | Numbers are not allowed            | message   | dsdasd   |
      | John Smith    | Male   | mo-sf-1990 | 100 Main Street          | Alexandria | Alexandria Governorate | 215326 | 01009987766  | john.smith@example.com   | Date Field must not be blank       | message24 | dsadas   |
      | Mona Ibrahim  | Female |            | 5 Airport Road           | Cairo      | Cairo Governorate      | 116776 | 01003335566  | mona.ibrahim@example.com | Date Field must not be blank       | message24 | dsdasd   |
      | Mona Ibrahim  | Female | 11-23-2030 | 9 Unknown Road           | Mansoura   | Dakahlia               | 355116 | 01001234567  | missingemail@example.com | Date Field must not be blank       | message24 | dsdasd   |
      | Mona Ibrahim  | Female | 30-12-2026 | 9 Unknown Road           | Mansoura   | Dakahlia               | 355116 | 01001234567  | missingemail@example.com | Date Field must not be blank       | message24 | dsdasd   |
      | Noura Mohamed | Female | 11-23-1995 |                          | Cairo      | Cairo Governorate      | 115116 | 01007778899  | noura.m@example.com      | Address Field must not be blank    | message3  | dsdasd   |
      | Ali Ramadan   | Male   | 11-23-1995 | @##$%^&                  | Cairo      | Cairo Governorate      | 114446 | 01006664422  | ali.ramadan@example.com  | Special characters are not allowed | message3  | dsdasd   |
      | Fatma Hassan  | Female | 11-23-1995 | 55 Talaat Harb Street    |            | Giza Governorate       | 112665 | 01001112233  | fatma.hassan@example.com | City Field must not be blank       | message4  | dsdasd   |
      | Omar Youssef  | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | 213        | Cairo Governorate      | 115116 | 01002251521  | omar.youssef@example.com | Numbers are not allowed            | message4  | dsadas   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | #@$        | Cairo Governorate      | 114446 | 01006664422  | ali.ramadan@example.com  | Special characters are not allowed | message4  | dsdasd   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      |                        | 114446 | 01006664422  | ali.ramadan@example.com  | State must not be blank            | message5  | dsdasd   |
      | Fatma Hassan  | Female | 11-23-1995 | 55 Talaat Harb Street    | Cairo      | @#$                    | 112665 | 01001112233  | fatma.hassan@example.com | Special characters are not allowed | message5  | dsdasd   |
      | Omar Youssef  | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      | 12345                  | 115116 | 01002251521  | omar.youssef@example.com | Numbers are not allowed            | message5  | dsadas   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      | Cairo Governorate      | 1144   | 01006664422  | ali.ramadan@example.com  | PIN Code must have 6 Digits        | message6  | dsdasd   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      | Cairo Governorate      | ASDSAD | 01006664422  | ali.ramadan@example.com  | Characters are not allowed         | message6  | dsdasd   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      | Cairo Governorate      | @#$    | 01006664422  | ali.ramadan@example.com  | Special characters are not allowed | message6  | dsdasd   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      | Cairo Governorate      |        | 01006664422  | ali.ramadan@example.com  | PIN Code must not be blank         | message6  | dsdasd   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      | Cairo Governorate      | 123456 |              | ali.ramadan@example.com  | Mobile no must not be blank        | message7  | dsdasd   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      | Cairo Governorate      | 123456 | asdsdasd sas | ali.ramadan@example.com  | Characters are not allowed         | message7  | dsdasd   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      | Cairo Governorate      | 123456 | 01006664422  | ali.ramadan              | Email-ID is not valid              | message9  | dsdasd   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      | Cairo Governorate      | 123456 | 01006664422  | ali.ramadan.com          | Email-ID is not valid              | message9  | dsdasd   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      | Cairo Governorate      | 123456 | asdsdasd sas |                          | Email-ID must not be blank         | message9  | dsdasd   |
      | Ali Ramadan   | Male   | 11-23-1995 | 12 Lorem Ipsum Apartment | Cairo      | Cairo Governorate      | 123456 | 01006664422  | ali.ramadan@example.com  | Password must not be blank         | message18 |          |
