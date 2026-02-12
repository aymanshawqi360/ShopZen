
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {

  //Initialize Environment
  static Future<void> initializeEnvironment() async {
  await dotenv.load(fileName: ".env");
  }

  
  //GET Base Url
  static String getBaseUrl() {
    return dotenv.env['BASE_URL'].toString();
    
  }

  //GET Accept Token
  static String getAcceptToken() {
    return dotenv.env['ACCEPT_KEY'].toString(); 
  }

  // GET Encryption Key
   String getEncryptionKey() {
    return dotenv.env['ENCRYPTION_KEY'].toString(); 
  }

  String getEncryptionToken() {
    return dotenv.env['ENCRYPTION_TOKEN'].toString(); 
  }
  String getEncryptionEmail() {
    return dotenv.env['ENCRYPTION_EMAIL'].toString(); 
  }

 String ddd() {
    return dotenv.env['ENCRYPTION_KEY'].toString(); 
  }
}


