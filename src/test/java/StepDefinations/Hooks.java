package StepDefinations;

import io.cucumber.java.After;
import org.openqa.selenium.WebDriver;
import resources.Utils;

public class Hooks {
@After
    public void tearDown() {
        if (Utils.driver != null) {
            Utils.driver.quit();
            Utils.driver = null;
        }
    }
}
