class Book {
  late String title;
  late int price;
  late int available;
  late List cate;
  Book(
      {required this.title,
      required this.price,
      required this.available,
      required this.cate});
  displayData() {
    print("title:$title price: $price available: $available cate: $cate");
  }
}