class FakeStoreResponsePojo {
  
  String id;
  String title;
  String price;
  String description;
  String category;
  String image;

  FakeStoreResponsePojo(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.category,
      this.image});

  FakeStoreResponsePojo.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    price = json['price'].toString();
    description = json['description'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['category'] = this.category;
    data['image'] = this.image;
    return data;
  }
}