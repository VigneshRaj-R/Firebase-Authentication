import 'dart:convert';
import 'package:firebase_authentication/controller/provider/login.dart';
import 'package:firebase_authentication/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/auth_provider.dart';
import '../../../controller/provider/sign_up.dart';

class HomeImageSetUp extends StatelessWidget {
  const HomeImageSetUp({Key? key, required this.type}) : super(key: key);

  final ActionType type;

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<LogInProvider>();
    final editProvider = Provider.of<AuthProvider>(context, listen: false);
    return Consumer<SignUpProvider>(
      builder: (context, value, child) {
        return GestureDetector(
            onTap: () {
              editProvider.updateImageFromGallery(context);
            },
            child: type == ActionType.signUp
                ? value.newImage.isEmpty || editProvider.newImage.isEmpty
                    ? const CircleAvatar(
                        radius: 80,
                      )
                    : CircleAvatar(
                        radius: 80,
                        //   backgroundColor: kBlack,
                        backgroundImage: MemoryImage(
                          const Base64Decoder().convert(value.newImage),
                        ),
                      )
                : loginProvider.loggedUserDetails.image == null
                    ? const CircleAvatar(
                        radius: 100,
                      )
                    : editProvider.newImage.isNotEmpty
                        ? CircleAvatar(
                            radius: 80,
                            //   backgroundColor: kBlack,
                            backgroundImage: MemoryImage(
                              const Base64Decoder()
                                  .convert(editProvider.newImage),
                            ),
                          )
                        : CircleAvatar(
                            radius: 80,
                            //   backgroundColor: kBlack,
                            backgroundImage: MemoryImage(
                              const Base64Decoder().convert(loginProvider
                                  .loggedUserDetails.image
                                  .toString()),
                            ),
                          ));
      },
    );
  }
}
