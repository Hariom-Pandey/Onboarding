class PermissionData{
  String imagePath;
  String title;
  String desc;

  PermissionData({required this.imagePath, required this.desc, required this.title});
}

class PermissionDataItems{
  List<PermissionData> items=[
    PermissionData(
        title: "Location",
        desc: "Allows the app to access your device's location.",
        imagePath: 'assets/location.png'
    ),
    PermissionData(
        title: "Camera",
        desc: "Allows the app to access your device's camera.",
        imagePath: 'assets/camera.png'
    ),
    PermissionData(
        title: "Microphone",
        desc: "Allows the app to access your device's microphone.",
        imagePath: 'assets/microphone.png'
    ),
    PermissionData(
        title: "Contacts",
        desc: "Allows the app to access your device's contacts.",
        imagePath: 'assets/contacts.png'
    ),
    PermissionData(
        title: "Storage",
        desc: "Allows the app to access your device's storage",
        imagePath: 'assets/storage.png'
    ),
    PermissionData(
        title: "Calls & Messages",
        desc: "Allows the app to access your device's phone features, such as making phone calls or sending text messages",
        imagePath: 'assets/calls.png'
    ),

  ];
}