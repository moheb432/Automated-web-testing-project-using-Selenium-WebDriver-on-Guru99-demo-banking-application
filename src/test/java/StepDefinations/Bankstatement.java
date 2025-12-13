package StepDefinations;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;
import resources.Utils;

import java.io.IOException;

public class Bankstatement extends Utils {


    public Bankstatement() throws IOException {
    }

    @And("user navigates to Customised Statement webpage and applied  data {string} {string} {string} {string} {string}")
    public void userNavigatesToCustomisedStatementWebpageAndAppliedData(String Accno,String Fromdate, String todate, String Minno, String nooftrans)
        {driver.findElement(By.linkText("Customised Statement")).click();
            driver.findElement(By.name("accountno")).sendKeys(Accno);
            driver.findElement(By.name("fdate")).sendKeys(Fromdate);
            driver.findElement(By.name("tdate")).sendKeys(todate);
            driver.findElement(By.name("amountlowerlimit")).sendKeys(Minno);
            driver.findElement(By.name("numtransaction")).sendKeys(nooftrans);

    }
    @When("the user clicks on Submit")
    public void theUserClicksOnSubmit() {
    driver.findElement(By.name("AccSubmit")).click();
    }

    @Then("the website gives Blank Statement or {string}")
    public void theWebsiteGivesBlankStatement(String popupmsg)
    {
        try {
            wait.until(ExpectedConditions.alertIsPresent());
            Alert alert = driver.switchTo().alert();
            String alertText = alert.getText();
            alert.accept();
            Assert.assertEquals(alertText, popupmsg);
        }catch(TimeoutException e)
                {


            }
        }


}
