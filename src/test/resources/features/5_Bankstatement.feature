Feature: Verify display Bank Statement

  Scenario Outline: Verify MGR can log in and successfully Get Bank statement for Customer
    Given the user open the website provided valid login details "mngr647426" "vAsAvEg"
    And user navigates to Customised Statement webpage and applied  data "<accno>" "<fromdate>" "<todate>" "<min_no_transaction>" "<nooftransaction>"
    When the user clicks on Submit
    Then the website gives Blank Statement or "<Popupmsg>"


    Examples:
      | accno               |  | fromdate   | todate     | min_no_transaction | nooftransaction | Popupmsg               |  |
      | 178940              |  | 12-10-2025 | 12-11-2025 | 55                 | 5               | none                   |  |
      | 232                 |  | 12-10-2025 | 12-11-2025 | 33                 | 5               | Account does not exist |  |
      | 5656566556565656525 |  | 12-10-2025 | 12-11-2025 | 33                 | 5               | Account does not exist |  |
      |                     |  | 12-10-2025 | 12-11-2025 | 33                 | 5               | Please fill all fields |  |

  Scenario Outline: Verify rejection on  successfully Get Bank statement with invalid data
    Given the user open the website provided valid login details "mngr647426" "vAsAvEg"
    And user navigates to Customised Statement webpage and applied  data "<accno>" "<fromdate>" "<todate>" "<min_no_transaction>" "<nooftransaction>"
    When enter wrong data
    Then the website should give text "<Case>" "<msg>"


    Examples:
      | accno   |  | fromdate   | todate     | min_no_transaction | nooftransaction | msg                                | Case      |
      |         |  | 12-10-2025 | 12-11-2025 | 33                 | 5               | Account Number must not be blank   | message2  |
      | @#$     |  | 12-10-2025 | 12-11-2025 | 33                 | 5               | Special characters are not allowed | message2  |
      | dasdsad |  | 12-10-2025 | 12-11-2025 | 33                 | 5               | Characters are not allowed         | message2  |
      | 178940  |  | 12-10-2025 | 12-11-2025 |                    | 5               | Number must not be blank           | message12 |
      | 178940  |  | 12-10-2025 | 12-11-2025 | @#$                | 5               | Special characters are not allowed | message12 |
      | 178940  |  | 12-10-2025 | 12-11-2025 | asdasd             | 5               | Characters are not allowed         | message12 |
      | 178940  |  | 12-10-2025 | 12-11-2025 | 22                 |                 | Number must not be blank           | message13 |
      | 178940  |  | 12-10-2025 | 12-11-2025 | 77                 | @#$             | Special characters are not allowed | message13 |
      | 178940  |  | 12-10-2025 | 12-11-2025 | 77                 | asad            | characters are not allowed         | message13 |
      | 178940  |  | 12-10-2029 | 12-11-2025 | 77                 | 22              | From date not invalid              | message12 |
      | 178940  |  | 12-10-3020 | 12-11-1555 | 77                 | 22              | to date is invalid                 | message12 |
      | 178940  |  | 12-12-2025 | 12-10-2025 | 77                 | 12              | From Date cant be after to date    | message12 |
      | 178940  |  | 12-10-2025 | 12-11-2025 | 77                 | 12              | Special characters are not allowed | message12 |

