import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../controller/provider/sign_up.dart';

class ImageSetUp extends StatelessWidget {
  const ImageSetUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            value.getImageFromGallery(context);
          },
          child: value.newImage.isNotEmpty
              ? CircleAvatar(
                  radius: 50,
                  //   backgroundColor: kBlack,
                  backgroundImage: MemoryImage(
                    const Base64Decoder().convert(value.newImage),
                  ),
                )
              : Stack(children: [
                  const CircleAvatar(
                    radius: 50,
                    //backgroundImage: AssetImage('Assets/images/Ny.jpg')
                  ),
                  Positioned(
                      right: 10,
                      top: 50,
                      child: IconButton(
                        onPressed: () {
                          value.getImageFromGallery(context);
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 35,
                        ),
                      ))
                ]),
        );
      },
    );
  }
}
