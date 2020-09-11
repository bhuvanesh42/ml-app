/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ml_app/Screen/mlscreen.dart';

const String TEXT_SCANNER = 'TEXT_SCANNER';
const String BARCODE_SCANNER = 'BARCODE_SCANNER';
const String LABEL_SCANNER = 'LABEL_SCANNER';
const String FACE_SCANNER = 'FACE_SCANNER';

class Home extends StatefulWidget {
  static const routname = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const String CAMERA_SOURCE = 'CAMERA_SOURCE';
  static const String GALLERY_SOURCE = 'GALLERY_SOURCE';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  File _file;
  String _selectedScanner = TEXT_SCANNER;

  void onselectedscanner(String scanner) {
    setState(() {
      _selectedScanner = scanner;
    });
  }

  void onimageselected(String source) async {
    var imagesource;
    if (source == CAMERA_SOURCE) {
      imagesource = ImageSource.camera;
    } else {
      imagesource = ImageSource.gallery;
    }
    final scaffold = _scaffoldKey.currentState;
    try {
      final imagepicker = ImagePicker();
      final file = await imagepicker.getImage(source: imagesource);
      final imagefile = File(file.path);
      if (imagefile == null) {
        throw Exception('file not available');
      }
      // Navigator.of(context).pushNamed(MlScreen.routname, arguments: {
      //   'file': file,
      //   'selectedscanner': _selectedScanner,
      // });
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => MlScreen(_file, _selectedScanner)),
      );
    } catch (exception) {
      scaffold.showSnackBar(
        SnackBar(
          content: Text(exception.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner type'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Select Scanner Type',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            RadioListTile(
              title: Text('Text Scanner'),
              value: TEXT_SCANNER,
              groupValue: _selectedScanner,
              onChanged: onselectedscanner,
            ),
            RadioListTile(
              title: Text('Barcode Scanner'),
              value: TEXT_SCANNER,
              groupValue: _selectedScanner,
              onChanged: onselectedscanner,
            ),
            RadioListTile(
              title: Text('Lable Scanner'),
              value: TEXT_SCANNER,
              groupValue: _selectedScanner,
              onChanged: onselectedscanner,
            ),
            RadioListTile(
              title: Text('Face Scanner'),
              value: TEXT_SCANNER,
              groupValue: _selectedScanner,
              onChanged: onselectedscanner,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () => onimageselected(CAMERA_SOURCE),
                  icon: Icon(Icons.camera),
                  label: Text('Camera'),
                ),
                FlatButton.icon(
                  onPressed: () => onimageselected(GALLERY_SOURCE),
                  icon: Icon(Icons.photo),
                  label: Text('Gallery'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
*/
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ml_app/Screen/mlscreen.dart';
import 'package:ml_app/card%20items/item1.dart';

const String TEXT_SCANNER = 'TEXT_SCANNER';
const String BARCODE_SCANNER = 'BARCODE_SCANNER';
const String LABEL_SCANNER = 'LABEL_SCANNER';
const String FACE_SCANNER = 'FACE_SCANNER';

class MLHome extends StatefulWidget {
  MLHome({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MLHomeState();
}

class _MLHomeState extends State<MLHome> {
  static const String CAMERA_SOURCE = 'CAMERA_SOURCE';
  static const String GALLERY_SOURCE = 'GALLERY_SOURCE';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  File _file;
  String _selectedScanner = TEXT_SCANNER;
  var _currentvalue = 0;

  List cardlist = [Item1(), Item2(), Item3(), Item4()];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final columns = List<Widget>();
    columns.add(buildRowTitle(context, 'Select Scanner Type'));
    columns.add(buildSelectScannerRowWidget(context));
    columns.add(buildRowTitle(context, 'Pick Image'));
    columns.add(buildSelectImageRowWidget(context));
    columns.add(buildsliderimage(context));

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text('MLKit Demo', style: TextStyle(fontFamily: 'Bree')),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: columns,
          ),
        ));
  }

  Widget buildsliderimage(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height-600,
          child: CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height-700,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              /*onPageChanged: ,*/
            ),
            items: cardlist.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    elevation: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      //margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(color: Colors.white),
                      child: i,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        /* Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(cardlist, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentvalue == index ? Colors.blueAccent : Colors.grey,
              ),

            );
          }),
        ),*/
      ],
    );
  }

  Widget buildRowTitle(BuildContext context, String title) {
    return Center(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(fontFamily: 'Bree', fontSize: 20),
      ),
    ));
  }

  Widget buildSelectImageRowWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: RaisedButton.icon(
              color: Colors.blue,
              textColor: Colors.white,
              splashColor: Colors.blueGrey,
              icon: Icon(Icons.camera),
              onPressed: () {
                onPickImageSelected(CAMERA_SOURCE);
              },
              label:
                  const Text('Camera', style: TextStyle(fontFamily: 'Bree'))),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: RaisedButton.icon(
              color: Colors.blue,
              textColor: Colors.white,
              icon: Icon(Icons.photo),
              splashColor: Colors.blueGrey,
              onPressed: () {
                onPickImageSelected(GALLERY_SOURCE);
              },
              label:
                  const Text('Gallery', style: TextStyle(fontFamily: 'Bree'))),
        ))
      ],
    );
  }

  Widget buildSelectScannerRowWidget(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Wrap(
        children: <Widget>[
          RadioListTile<String>(
            title:
                Text('Text Recognition', style: TextStyle(fontFamily: 'Bree')),
            groupValue: _selectedScanner,
            value: TEXT_SCANNER,
            onChanged: onScannerSelected,
          ),
          RadioListTile<String>(
            title:
                Text('Barcode Scanner', style: TextStyle(fontFamily: 'Bree')),
            groupValue: _selectedScanner,
            value: BARCODE_SCANNER,
            onChanged: onScannerSelected,
          ),
          RadioListTile<String>(
            title: Text('Label Scanner', style: TextStyle(fontFamily: 'Bree')),
            groupValue: _selectedScanner,
            value: LABEL_SCANNER,
            onChanged: onScannerSelected,
          ),
          RadioListTile<String>(
            title: Text('Face Scanner', style: TextStyle(fontFamily: 'Bree')),
            groupValue: _selectedScanner,
            value: FACE_SCANNER,
            onChanged: onScannerSelected,
          )
        ],
      ),
    );
  }

  Widget buildImageRow(BuildContext context, File file) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Image.file(
          file,
          fit: BoxFit.fitWidth,
        ));
  }

  Widget buildDeleteRow(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            splashColor: Colors.blueGrey,
            onPressed: () {
              setState(() {
                _file = null;
              });
              ;
            },
            child: const Text('Delete Image',
                style: TextStyle(fontFamily: 'Bree'))),
      ),
    );
  }

  void onScannerSelected(String scanner) {
    setState(() {
      _selectedScanner = scanner;
    });
  }

  void onPickImageSelected(String source) async {
    var imageSource;
    if (source == CAMERA_SOURCE) {
      imageSource = ImageSource.camera;
    } else {
      imageSource = ImageSource.gallery;
    }

    final scaffold = _scaffoldKey.currentState;

    try {
      final file = await ImagePicker.pickImage(source: imageSource);
      if (file == null) {
        throw Exception('File is not available');
      }
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => MLDetail(file, _selectedScanner)),
      );
    } catch (e) {
      scaffold.showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }
}
