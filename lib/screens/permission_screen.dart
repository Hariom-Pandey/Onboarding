import 'package:flutter/material.dart';
import 'package:my_anim/data/permission_data.dart';
import 'package:flutter/gestures.dart';
import 'package:my_anim/screens/select_user.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends StatelessWidget {
  final PermissionDataItems permissionDataItems = PermissionDataItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "App Permissions",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: permissionDataItems.items.length,
                  itemBuilder: (context, index) {
                    PermissionData permission = permissionDataItems.items[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            permission.imagePath,
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  permission.title,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  permission.desc,
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  HighlightedText(),
                ],
              ),
            ),

            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  bool allPermissionsGranted = await _requestAllPermissions();
                  if (allPermissionsGranted) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Permissions Granted'),
                        content: Text('All requested permissions have been granted.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SelectUser()));
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Permissions Denied'),
                        content: Text('Some permissions were denied.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 56),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HighlightedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: 'You can change any of the above permissions later. Please provide your acceptance to ',
          ),
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Terms and Conditions tapped');
              },
          ),
          TextSpan(
            text: ' and ',
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle the tap on 'Privacy Policy'
                print('Privacy Policy tapped');
              },
          ),
          TextSpan(
            text: ' by clicking on I agree.',
          ),
        ],
      ),
    );
  }
}

Future<bool> _requestAllPermissions() async {
  var statuses = await [
    Permission.location,
    Permission.camera,
    Permission.microphone,
    Permission.contacts,
    Permission.storage,
    Permission.phone,
    Permission.sms,
  ].request();

  statuses.forEach((permission, status) {
    print('$permission: $status');
  });


  bool allGranted = statuses.values.every((status) => status.isGranted);
  return allGranted;
}





