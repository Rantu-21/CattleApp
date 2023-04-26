import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  
  late File _image;
  late List _results;
  bool imageSelect=false;
  @override
  void initState()
  {
    super.initState();
    loadModel();
  }
  Future loadModel()
  async {
    Tflite.close();
    String res;
    res=(await Tflite.loadModel(model: "assets/model.tflite",labels: "assets/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image)
  async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results=recognitions!;
      _image=image;
      imageSelect=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disease Detection"),
      ),
      body: ListView(
        children: [
          (imageSelect)?Container(
        margin: const EdgeInsets.all(10),
        child: Image.file(_image),
      ):Container(
        margin: const EdgeInsets.all(10),
            child: const Opacity(
              opacity: 0.8,
              child: Center(
                child: Text("No image selected"),
              ),
            ),
      ),
          SingleChildScrollView(
            child: Column(
              children: (imageSelect)?_results.map((result) {
                return Card(
                  child: Container(
                      margin: EdgeInsets.all(5),

                      child: result['label'] == 'Normal Skin'?
                      Text("Normal Skin Disease", textAlign: TextAlign.center,style: const TextStyle(color: Colors.black87,
                          fontSize: 20),):
                      Text("রোগ: লাম্পি চর্ম রোগ\nসমাধান / চিকিৎসা:-\n১. মিথিলিন ব্লু দিয়ে অ্যান্টিভাইরাল চিকিৎসা।\n২. প্রদাহজনিত রোগের চিকিৎসার জন্য নন-স্টেরয়েডাল, অ্যান্টি-ইনফ্লেমেটরি ওষুধের ব্যবহার।\n৩. উচ্চ জ্বরের জন্য প্যারাসিটামল ব্যবহার।\n৪. সেকেন্ডারি ইনফেকশন নিয়ন্ত্রণে অ্যান্টিবায়োটিক দেওয়া।\n৫. টিকাদান।",style: const TextStyle(color: Colors.black87,fontSize: 25,height: 1.5,fontWeight: FontWeight.bold),)

                  ),
                );
              }).toList():[],

            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: "Pick Image",
        child: const Icon(Icons.image),
      ),
    );
  }
  Future pickImage()
  async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image=File(pickedFile!.path);
    imageClassification(image);
  }
}
