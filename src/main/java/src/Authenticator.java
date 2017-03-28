package src;

public class Authenticator {

    public String authenticate(String username, String password) {
        if (("Denis".equalsIgnoreCase(username))
                && ("12345".equals(password))) {
            return "success";
        } else {
            return "failure";
        }
    }
}