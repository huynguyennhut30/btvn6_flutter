import 'package:btvn6_flutter/add_product.dart';
import 'package:btvn6_flutter/product_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Product'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddProduct()),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
        body: ListView.separated(
          // shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTileCustom(
              productModel: productList[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 1,
            color: Colors.black12,
          ),
        ),
      ),
    );
  }
}

class ListTileCustom extends StatelessWidget {
  ProductClass productModel;

  ListTileCustom({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              productModel.imageURL,
            ),
          ),
        ),
        Expanded(
          child: Text(productModel.title),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EditProduct(productModel: productModel)),
            );
          },
          child: const Icon(
            Icons.edit,
            color: Colors.purple,
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.calendar_today_rounded,
            color: Colors.green,
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}

class EditProduct extends StatefulWidget {
  ProductClass productModel;

  EditProduct({required this.productModel});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  FocusNode myFocusNode = new FocusNode();

  late TextEditingController titleController;
  late TextEditingController priceController;
  late TextEditingController descriptrionController;
  late TextEditingController imageURLController;

  String url = '';
  bool _loadingImage = false;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.productModel.title);
    priceController =
        TextEditingController(text: widget.productModel.price.toString());
    descriptrionController =
        TextEditingController(text: widget.productModel.description);
    imageURLController =
        TextEditingController(text: widget.productModel.imageURL);
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        url = widget.productModel.imageURL;
      });
      loadImage();
    });
  }

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

  void testAsync() {
    for (int i = 0; i < 1000000000000; i++) {}
  }

  @override
  Widget build(BuildContext context) {
    testAsync();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Expanded',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.lightBlueAccent,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 20,
                        color: Colors.brown.withOpacity(0.8),
                        child: const Text(
                          '1',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        height: 20,
                        color: Colors.brown.withOpacity(0.8),
                        child: const Text(
                          '1',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.orange,
                      ),
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 20,
                        color: Colors.brown.withOpacity(0.8),
                        child: const Text(
                          '2',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                //initialValue: widget.productModel.title,
                controller: titleController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                      color: myFocusNode.hasFocus ? Colors.blue : Colors.grey),
                  //I believe the size difference here is 6.0 to account padding
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                //initialValue: widget.productModel.price.toString(),
                controller: priceController,
                decoration: InputDecoration(
                  //alignLabelWithHint: true,
                  labelStyle: TextStyle(
                      fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                      color: Colors.grey),
                  //I believe the size difference here is 6.0 to account padding
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                //initialValue: widget.productModel.description,
                controller: descriptrionController,
                decoration: InputDecoration(
                  //alignLabelWithHint: true,
                  labelStyle: TextStyle(
                      fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                      color: Colors.grey),
                  //I believe the size difference here is 6.0 to account padding
                  labelText: 'Description',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                          errorBuilder: (a, b, c) {
                            return Container(
                              height: 90,
                              width: 90,
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 10,
                              ),
                              alignment: Alignment.topLeft,
                              child: const Icon(Icons.image),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          //initialValue: widget.productModel.imageURL,
                          controller: imageURLController,
                          onChanged: (value) {
                            setState(
                              () {
                                url = value;
                              },
                            );
                          },
                          decoration: InputDecoration(
                            //alignLabelWithHint: true,
                            labelStyle: TextStyle(
                                fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                                color: Colors.grey),
                            //I believe the size difference here is 6.0 to account padding
                            labelText: 'Image URL',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
