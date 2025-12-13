package resources;

public class TestContext {

    private static String CustomerId="46248";
    private static String Accountno="178940";

    public static String getAccountno() {
        return Accountno;
    }

    public static void setAccountno(String accountno) {
        Accountno = accountno;
    }

    public static String getCustomerId() {
        return CustomerId;
    }

    public static void setCustomerId(String customerId) {
        CustomerId = customerId;
    }

}

