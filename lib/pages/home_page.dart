import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  static const id = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  String data = "No Data";

  @override
  initState() {
    super.initState();
    readData();
  }

  // /storage/emulated/0/Android/data/com.example.te/files => getExternalStorageDirectory
  // /data/user/0/com.example.te/files => getApplicationSupportDirectory
  // /storage/emulated/0/Android/data/com.example.te/cache => getExternalCacheDirectories
  Future<File?> writeText() async {
    final directory = Directory("/storage/emulated/0/My_APP");
    // if(directory == null) return null;
    // await directory.create();
    print("path: ${directory.path}");
    final file = File('${directory.path}/note.txt');
    // await file.create();
    // Write the file
    return file.writeAsString(controller.text);
  }

  Future<void> readData() async {
    try {
      final directory = Directory("/storage/emulated/0/My_APP");
      directory.create();
      // if(directory == null) return;
      // for(Directory element in directory) {
      //   print("path: ${element.path}");
      // }
      final file = File('${directory.path}/note.txt');

      // Read the file
      final contents = await file.readAsString();

      setState(() {
        data =  contents;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text("Read Data: $data", style: TextStyle(fontSize: 20),)),
            const SizedBox(height: 20,),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Write Data',
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
              onEditingComplete: () async {
                await writeText();
                await readData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
