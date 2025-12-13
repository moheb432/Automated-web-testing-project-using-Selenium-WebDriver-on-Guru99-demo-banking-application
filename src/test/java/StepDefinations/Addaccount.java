package StepDefinations;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.cucumber.junit.Cucumber;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import org.testng.Assert;
import resources.Utils;

import java.io.IOException;

public class Addaccount extends Utils {
    public Addaccount() throws IOException {
    }

    @And("user navigates to Add account webpage and applied customer data {string}, {string}")
    public void userNavigatesToAddAccountWebpageAndAppliedCustomerData(String Accounttype, String intialdep) {
        driver.findElement(By.linkText("New Account")).click();
        driver.findElement(By.name("cusid")).sendKeys(getCustomerId());
        WebElement element = driver.findElement(By.name("selaccount"));
        Select dropdown = new Select(element);
        dropdown.selectByVisibleText(Accounttype);
        driver.findElement(By.name("inideposit")).sendKeys(intialdep);
    }

    @When("the user click on Submit")
    public void theUserClickOnSubmit() {
        driver.findElement(By.name("button2")).click();

    }
    @Then("the website should give Account created Successfully!!!")
    public void theWebsiteShouldGiveAccountCreatedSuccessfully() {
        String actualMessage = driver.findElement(By.xpath("//*[@id=\"account\"]/tbody/tr[1]/td/p")).getText();
        Assert.assertEquals(actualMessage, "Account Generated Successfully!!!");

    }

}
