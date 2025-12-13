package StepDefinations;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;
import resources.Utils;

import java.io.IOException;

public class Changepassword extends Utils {
    String alertText;
    public Changepassword() throws IOException {
    }

    @And("user navigates to Edit Account webpage and applied customer data {string}, {string}")
    public void userNavigatesToEditAccountWebpageAndAppliedCustomerData(String Oldpassword, String newpassworrd) throws IOException {
        driver.findElement(By.linkText("Change Password")).click();
        driver.findElement(By.name("oldpassword")).sendKeys(Oldpassword);
        driver.findElement(By.name("newpassword")).sendKeys(newpassworrd);
        driver.findElement(By.name("confirmpassword")).sendKeys(newpassworrd);




    }

    @Then("the website should gives {string}")
    public void theWebsiteShouldGivePasswordChangedSuccessfully(String popupmsg) {
            wait.until(ExpectedConditions.alertIsPresent());
            Alert alert = driver.switchTo().alert();
            alertText = alert.getText();
            System.out.println("Alert Text: " + alertText);
            alert.accept();

            Assert.assertEquals(alertText,popupmsg);
    }
}
