import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

import '../../../../Constants/messages.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../Transitions/onduty_builder.dart';
import '../../../../helpers/location_setter.dart';

class DutyType extends StatefulWidget {
  const DutyType({Key? key}) : super(key: key);

  @override
  State<DutyType> createState() => _DutyTypeState();
}

class _DutyTypeState extends State<DutyType> {

  final FlutterContactPicker _contactPicker = FlutterContactPicker();

  String _contact = '';

  final _formKey2 = GlobalKey<FormState>();

  final myagendaController = TextEditingController();
  final mysendernameController = TextEditingController();
  var mysendercontactController = TextEditingController();
  var mypersoncontactController = TextEditingController();
  final myremarksController = TextEditingController();

  late final List<Placemark> locationAddress;
  // ignore: non_constant_identifier_names
  Placemark? location_address_exact;

  String _address = "";

  @override
  void didChangeDependencies() {
    getaddress();
    super.didChangeDependencies();
  }

  getaddress() async {
    List<Placemark> locationAddress = 
     await placemarkFromCoordinates(
        StateInherited.of(context).locationData!.latitude!, 
        StateInherited.of(context).locationData!.longitude! );

    // setState(() {
    location_address_exact = locationAddress.first;
    // });
    String? name = location_address_exact!.name;
    String? subLocality = location_address_exact!.subLocality;
    String? locality = location_address_exact!.locality;
    String? administrativeArea = location_address_exact!.administrativeArea;
    String? postalCode = location_address_exact!.postalCode;
    String? country = location_address_exact!.country;
    String address =
        "$name, $subLocality, $locality, $administrativeArea $postalCode, $country";

    if (kDebugMode) {
      print(address);
    }

    setState(() {
      _address = address; // update _address
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(30),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Text(_address),
              const SizedBox(height: 10),
              TextFormField(
                controller: myagendaController,
                decoration: InputDecoration(
                    labelText: "Agenda",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Provide Value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: mysendernameController,
                decoration: InputDecoration(
                    labelText: "SenderName",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Provide Value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: mysendercontactController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () async {
                      Contact? contact = await _contactPicker.selectContact();
                      setState(() {
                        _contact = contact!.phoneNumbers!.first;
                        mysendercontactController = TextEditingController(text: _contact);
                      });
                    },
                    icon: const Icon(
                        Icons.contacts,
                        size: 25,
                        color: Colors.black26,
                      ),
                  ),
                    labelText: "Sender Contact",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Provide Value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: mypersoncontactController,
                decoration: InputDecoration(
                   suffixIcon:IconButton(
                    onPressed: () async {
                      Contact? contact = await _contactPicker.selectContact();
                      setState(() {
                        _contact = contact!.phoneNumbers!.first;
                        mypersoncontactController = TextEditingController(text: _contact);
                      });
                    }, 
                    icon: const Icon(
                      Icons.contacts,
                      size: 25,
                      color: Colors.black26,
                    ),
                  ),
                    labelText: "Person Contact",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Provide Value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: myremarksController,
                decoration: InputDecoration(
                    labelText: "Remarks",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Provide Value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Back")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey2.currentState!.validate()) {
                          nav();
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar_LoginError);
                        }
                      },
                      child: const Text("Done")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void nav() {
    showCupertinoDialog(
        context: context,
        builder: (context) => OnDutyTransition(
          address: _address,
          agenda: myagendaController.text,
          personcontact: mypersoncontactController.text,
          remarks: myremarksController.text,
          sendercontact: mysendercontactController.text,
          sendername: mysendernameController.text,
        )
    );
  }
}
