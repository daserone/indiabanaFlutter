import 'package:cached_network_image/cached_network_image.dart';
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
          ? CachedNetworkImageProvider(
              imageUrl!,
            )
          : const AssetImage('assets/icons/logo.png') as ImageProvider,
    );
  }
}
