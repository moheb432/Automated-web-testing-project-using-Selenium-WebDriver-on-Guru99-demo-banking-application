package StepDefinations;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.*;
import org.testng.Assert;
import resources.Utils;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.support.ui.ExpectedConditions;
import java.time.Duration;

import java.io.IOException;

public class AddCustomer extends Utils {
    public AddCustomer() throws IOException {
    }



    @Given("the user open the website provided valid login details {string} {string}")
    public void the_user_open_the_website_provided_valid_login_details(String string, String string2) throws IOException {
        Utils.driver = setup_Driver(Utils.Get_GlobalData("driver"));
        Utils.wait = new WebDriverWait(Utils.driver, Duration.ofSeconds(10));
        Utils.driver.findElement(By.name("uid")).sendKeys(Utils.Get_GlobalData("email"));
        Utils.driver.findElement(By.name("password")).sendKeys(Utils.Get_GlobalData("password"));
        Utils.driver.findElement(By.name("btnLogin")).click();

    }

    @And("user navigates to Add customer webpage and applied customer data {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}")
    public void userNavigatesToAddCustomerWebpageAndAppliedCustomerData(String CustomerName, String Gender, String DOB, String Address, String City, String State, String PIN, String Telephone, String Email ,String Password) {
        driver.findElement(By.xpath("/html/body/div[3]/div/ul/li[2]/a")).click();
        driver.findElement(By.name("name")).sendKeys(CustomerName);
        driver.findElement(By.id("dob")).sendKeys(DOB);
        driver.findElement(By.name("addr")).sendKeys(Address);
      driver.findElement(By.name("city")).sendKeys(City);
      driver.findElement(By.name("state")).sendKeys(State);
      driver.findElement(By.name("pinno")).sendKeys(PIN);
      driver.findElement(By.name("telephoneno")).sendKeys(Telephone);
      driver.findElement(By.name("emailid")).sendKeys(Email);
      driver.findElement(By.name("password")).sendKeys(Password);

    }
    @When("the user click on submit")
    public void the_user_click_on_submit() {
        driver.findElement(By.name("sub")).click();
    }

    @When("enter wrong data")
    public void enterWrongData() {
    }

    @Then("the website should give {string}")
    public void the_website_should_give(String string){
        String actualMessage = driver.findElement(By.xpath("//*[@id=\"customer\"]/tbody/tr[1]/td/p")).getText();
        Assert.assertEquals(actualMessage, "Customer Registered Successfully!!!");

    }

    @Then("the website should give text {string} {string}")
    public void the_website_should_give_text(String Case ,String msg) {
        WebElement messageElement = Utils.wait.until(ExpectedConditions.presenceOfElementLocated(By.id(Case)));
        String actualMessage = messageElement.getText().trim();
        Assert.assertEquals(actualMessage, msg) ;

    }

    @And("user navigates to Customised Statement webpage and applied  data {string} {string} {string} {string}")
    public void userNavigatesToCustomisedStatementWebpageAndAppliedData(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7) {
    }
}




