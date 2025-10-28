import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:se7ty/firebase_options.dart';

class
FireHelper {
 static final FirebaseAuth auth = FirebaseAuth.instance;

  static String? getUid() {
    return null;
  }

  static Future init() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  }


  
}