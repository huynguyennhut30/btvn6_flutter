import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  FocusNode myFocusNode = new FocusNode();

  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptrionController = TextEditingController();
  TextEditingController imageURLController = TextEditingController();

  String url = '';
  String title = '';
  double price = 0.0;
  bool _loadingImage = false;

  void loadImage() {
    _loadingImage = true;
    precacheImage(NetworkImage(url), context, onError: (e, stackTrace) {
      //print('error $e');
      setState(() {
        _loadingImage = false;
        //print(_loadingimage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Add new product'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Expand',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(children: [
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      Positioned(
                          left: 1,
                          child: Container(
                            height: 20,
                            color: Colors.brown.withOpacity(0.8),
                            child: Text(
                              '1',
                              style: TextStyle(fontSize: 15),
                            ),
                          ))
                    ]),
                  ),
                  Expanded(
                      flex: 2,
                      child: Stack(
                        children: [
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.blue,
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 20,
                              color: Colors.brown.withOpacity(0.8),
                              child: Text(
                                '1',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.orange,
                            ),
                          ),
                          Positioned(
                              right: 1,
                              child: Container(
                                height: 20,
                                color: Colors.brown.withOpacity(0.8),
                                child: Text(
                                  '2',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ))
                        ],
                      ))
                ],
              ),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                      color: myFocusNode.hasFocus ? Colors.blue : Colors.green,
                    ),
                    labelText: 'Title'),
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                    color: Colors.grey,
                  ),
                  labelText: 'Price',
                ),
              ),
              TextFormField(
                controller: descriptrionController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                      color: Colors.grey,
                    ),
                    labelText: 'Descriptrion'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        _loadingImage == false
                            ? Positioned(
                                top: 10,
                                left: 10,
                                child: Icon(Icons.image_outlined))
                            : Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  image: DecorationImage(
                                    image: NetworkImage(url),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ],
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: imageURLController,
                        onChanged: (value) {
                          setState(() {
                            url = value;
                            loadImage();
                          });
                        },
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                              color: Colors.grey,
                            ),
                            labelText: 'Image URL'),
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
