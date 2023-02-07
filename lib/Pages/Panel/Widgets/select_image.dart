// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/helpers/location_setter.dart';
import '../../../Constants/global.dart';
import '../../../Constants/messages.dart';
import '../../../Transitions/save_attendence_image.dart';
import '../helpers.dart';
import '../scoped.dart';
import 'eveningimage.dart';
import 'morningimage.dart';

class SelectImage extends StatefulWidget {
  const SelectImage({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {

  String date = '';

  String? addresslocal;

  @override
  void initState() {
    final datetime = DateTime.now();
    date = '${datetime.year}-${datetime.month}-${datetime.day}';
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getlocaladdress();
    imagefileIn;
    imagefileOut;
    super.didChangeDependencies();
  }

  getlocaladdress() async {
    addresslocal = await getaddress(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Attendence",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(date),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (tempnoteresult == 'Present' && mimg != null && mimg != " ")
                  ? const MorningImage()
                  : InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: imagefileIn == null
                                ? const AssetImage("assets/profile.png")
                                : FileImage(File(imagefileIn!.path))
                                    as ImageProvider,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "In",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      onTap: () {
                          getimage(ImageSource.camera, "IN");
                      },
                    ),
              (tempnoteresult == 'Present' && eimg != null && eimg != " ")
                  ? const EveningImage()
                  : InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: imagefileOut == null
                                ? const AssetImage("assets/profile.png")
                                : FileImage(File(imagefileOut!.path))
                                    as ImageProvider,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Out",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      onTap: () {
                        getimage(ImageSource.camera, "OUT");
                      },
                    ),
            ],
          ),
          const SizedBox(height: 5),
          addresslocal != null
              ? Text(
                  'Location : $addresslocal',
                  maxLines: 3,
                  style: const TextStyle(fontSize: 15),
                )
              : const SizedBox(
                  height: 0,
                ),
          ElevatedButton(
              onPressed: () {
                if (tempnoteresult  == 'Present' && mimg != null && mimg != " " && eimg != null && eimg != " " ) {
                   ScaffoldMessenger.of(context).showSnackBar(snackBar_alreadymarked);
                } else {
                  imagefileIn != null || imagefileOut != null
                    ? Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SaveAttendenceImage(
                              latitude: StateInherited.of(context)
                                  .locationData!
                                  .latitude!,
                              longitude: StateInherited.of(context)
                                  .locationData!
                                  .longitude!,
                            )))
                    : ScaffoldMessenger.of(context)
                        .showSnackBar(snackBar_imagenotselected);
                }
              },
              child: const Text("DONE"))
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> getimage(ImageSource source, String value) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        // ignore: avoid_print
        print("Bad Format");
      } else {
        setState(() {
          if (value == 'IN') {
            imagefileIn = File(image.path);
          }
          if (value == 'OUT') {
            imagefileOut = File(image.path);
          }
          imagefileUpload = image.path;
        });
      }
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to pick Image: $e')));
    }
  }
}
