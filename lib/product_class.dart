class ProductClass {
  String title;
  double price;
  String description;
  String imageURL;

  ProductClass(this.title, this.price, this.description, this.imageURL);
}

List<ProductClass> productList = <ProductClass>[
  ProductClass('Product 1', 300, 'Ok', 'assets/images/1.png'),
  ProductClass('Product 2', 500, 'Ok', 'assets/images/2.png'),
  ProductClass('Product 3', 700, 'Ok', 'assets/images/3.png'),
];
