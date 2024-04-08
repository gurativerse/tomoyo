import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import '../theme.dart';
import '../shared/DefaultLayout.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return ProfileContent();
  }
}

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  User? user = FirebaseAuth.instance.currentUser;
  final ImagePicker _picker = ImagePicker();

  get http => null;

  Future<void> pickAndUploadImage() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return; // User canceled the picker

    final String uploadUrl = dotenv.env['UPLOAD_ENDPOINT'] ?? '';

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(uploadUrl))
      ..files.add(await http.MultipartFile.fromPath('file', image.path));

    // Send the request
    var response = await request.send();

    if (response.statusCode == 200) {
      // Get the response from the server
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var decoded = json.decode(responseString);

      // Assuming 'url' is the key in the response JSON
      var imageUrl = decoded['url'];

      await user!.updatePhotoURL(imageUrl);

      // Ensure the UI is refreshed, e.g., by setting state or other means
      setState(() {});
    } else {
      print('Image upload failed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text('Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profile'),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(ColorPalatte.color['setting']!),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await pickAndUploadImage();
                                  },
                                  child: ClipOval(
                                      child: SizedBox.fromSize(
                                    size: Size.fromRadius(40),
                                    child: user!.photoURL != null
                                        ? Image.network(
                                            user!.photoURL.toString(),
                                            fit: BoxFit.cover)
                                        : Image.asset('./asset/profile.png',
                                            fit: BoxFit.cover),
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25, right: 10),
                                  child: Text(user!.displayName.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.mode_edit_rounded,
                              color: Color(ColorPalatte.color['icon']!),
                            ),
                          ],
                        ))),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Text('Email'),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Container(
                  width: double.maxFinite,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(ColorPalatte.color['border']!),
                      ),
                    ),
                    child: Text(
                      user!.email.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Text('Password'),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: double.maxFinite,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(ColorPalatte.color['border']!),
                          ),
                        ),
                        child: Text(
                          "************",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'change password?',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            )
          ]),
        ));
  }
}
