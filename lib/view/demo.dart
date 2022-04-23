import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 50,
          width: 250,
          child: ElevatedButton(
            onPressed: () async {
              FilePickerResult? picker = await FilePicker.platform.pickFiles();
              if (picker != null) {
                File file = File(picker.files.single.path!);
              } else {}
            },
            child: Text("pick file"),
          ),
        ),
      ),
    );
  }
}
