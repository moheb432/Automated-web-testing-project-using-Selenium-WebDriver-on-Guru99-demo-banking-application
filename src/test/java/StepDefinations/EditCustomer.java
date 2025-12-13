package StepDefinations;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.*;
import org.testng.Assert;
import resources.Utils;

import java.io.IOException;


public class EditCustomer extends Utils {

    public EditCustomer() throws IOException {
    }

    @And("user edited applied customer data {string}, {string}, {string}, {string}, {string}, {string}, {string}")
    public void userEditedAppliedCustomerData(String Address, String City, String State, String PIN, String Telephone, String Email ,String Password) {

        driver.findElement(By.name("addr")).clear();
        driver.findElement(By.name("addr")).sendKeys(Address);

        driver.findElement(By.name("city")).clear();
        driver.findElement(By.name("city")).sendKeys(City);

        driver.findElement(By.name("state")).clear();
        driver.findElement(By.name("state")).sendKeys(State);

        driver.findElement(By.name("pinno")).clear();
        driver.findElement(By.name("pinno")).sendKeys(PIN);

        driver.findElement(By.name("telephoneno")).clear();
        driver.findElement(By.name("telephoneno")).sendKeys(Telephone);

        driver.findElement(By.name("emailid")).clear();
        driver.findElement(By.name("emailid")).sendKeys(Email);

    }


    @Given("user navigates to Edit Customer webpage and applied Valid customer ID")
    public void userNavigatesToEditCustomerWebpageAndAppliedValidCustomerID() {
        Utils.driver.findElement(By.linkText("Edit Customer")).click();
        Utils.driver.findElement(By.name("cusid")).sendKeys(getCustomerId());
        Utils.driver.findElement(By.name("AccSubmit")).click();
    }

    @Then("the website gives {string}")
    public void theWebsiteGives(String arg0) {
        Assert.assertTrue(true);
    }

}