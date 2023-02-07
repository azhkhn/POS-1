import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/messages.dart';
import '../../../Transitions/save_attendence.dart';

class RemarkBox extends StatefulWidget {
  const RemarkBox({Key? key}) : super(key: key);

  @override
  State<RemarkBox> createState() => _RemarkBoxState();
}

class _RemarkBoxState extends State<RemarkBox> {

  final _formKey3 = GlobalKey<FormState>();

  TextEditingController remarkController = TextEditingController();

  @override
  void didChangeDependencies() {
    FocusScope.of(context).unfocus();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey3,
      child: SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.4,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: false,
              controller: remarkController,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 3,
              decoration: const InputDecoration(
                label: Text(
                  'Remark',
                  style: TextStyle(
                    fontSize: 20
                  ),
                )
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter remark';
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey3.currentState!.validate()) {
                    showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => SaveAttendence(remarks: remarkController.text, attendencetype: 't'));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackBar_undefined);
                  }
                },
                child: const Text("Done",))
          ],
        ),
      ),
    );
  }
}
