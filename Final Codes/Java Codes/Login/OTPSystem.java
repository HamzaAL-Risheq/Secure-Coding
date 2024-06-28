//package login;
//
//import com.twilio.Twilio;
//import com.twilio.rest.api.v2010.account.Message;
//import com.twilio.type.PhoneNumber;
//
///*
// * OTPSystem class for generating and sending OTP using Twilio API.
// */
//final public class OTPSystem {
//
//    // Twilio account SID and authentication token
//    public static final String ACCOUNT_SID = "AC1973eb4cc2b1bcdecbe3f681d81eaf84";
//    public static final String AUTH_TOKEN = "a4a8ff2d587efafc95c631c0f2cdb854";
//    
//    /*
//     * Main method to generate OTP and send it via Twilio SMS.
//     * @param args Command line arguments (not used).
//     */
//    public static void main(String[] args) {
//        try {
//            Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
//
//            // Generate OTP
//            int otp = generateOTP(); 
//
//            // Compose SMS message
//            String message = "Your OTP is " + otp;
//            String phoneNumber = "+962786270234"; // Receiver's phone number
//
//            // Send OTP via Twilio SMS
//            Message twilioMessage = Message.creator(
//                    new PhoneNumber(phoneNumber),
//                    new PhoneNumber("+12132925387"), // Twilio phone number
//                    message
//            ).create();
//
//            // Print Twilio message SID
//            System.out.println("Message SID: " + twilioMessage.getSid());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//    
//
//    /**
//     * Generates a sample OTP (for testing purposes).
//     * @return The generated OTP.
//     */
//    private static int generateOTP() {
//        return 4666444;
//    }
//}
