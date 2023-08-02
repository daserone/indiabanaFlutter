import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final String? imageUrl;
  const ProfilePic({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 30,
      //profile pic or asset logo
      backgroundImage: imageUrl != null
          ? NetworkImage(
              imageUrl!,
            )
          : const AssetImage('assets/icons/logo.png') as ImageProvider,
    );
  }
}
