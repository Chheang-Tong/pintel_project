import 'package:get/get.dart';

class Product {
  final String image, title, description;
  final int id;
  int stock;
  final double price, pricediscount, percendiscount;
  var isFavorite = false.obs;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.pricediscount,
    required this.percendiscount,
    required this.stock,
    required this.description,
    required this.image,
    bool? isFavorite,
  }) {
    this.isFavorite.value = isFavorite ?? false;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "pricediscount": pricediscount,
      "percendiscount": percendiscount,
      "stock": stock,
      "description": description,
      "image": image,
      "isFavorite": isFavorite.value,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      price: (json["price"] as num).toDouble(),
      pricediscount: (json["pricediscount"] as num).toDouble(),
      percendiscount: (json["percendiscount"] as num).toDouble(),
      stock: json["stock"],
      description: json["description"],
      image: json["image"],
      isFavorite: json["isFavorite"] ?? false,
    );
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void decreaseStock(int quantity) {
    if (stock >= quantity) {
      stock -= quantity;
    }
  }

  void increaseStock(int quantity) {
    stock += quantity;
  }
}

RxList<Product> productList = <Product>[
  Product(
    id: 1,
    title: "Men Fashion",
    price: 15,
    pricediscount: 0,
    percendiscount: 15,
    stock: 12,
    description:
        "A handbag is a fashion accessory designed for carrying personal items such as wallets, keys, cosmetics, phones, and other essentials. It is commonly used by women and comes in various stocks, shapes, materials, and styles to suit different occasions and preferences.",
    image:
        "https://i.pinimg.com/736x/50/ae/df/50aedf1095fc533fc1a98bf31de6e9fc.jpg",
  ),
  Product(
    id: 2,
    title: "title1",
    price: 15,
    pricediscount: 1,
    percendiscount: 0,
    stock: 12,
    description:
        "A handbag is a fashion accessory designed for carrying personal items such as wallets, keys, cosmetics, phones, and other essentials. It is commonly used by women and comes in various stocks, shapes, materials, and styles to suit different occasions and preferences.",
    image:
        "https://i.pinimg.com/736x/59/e2/74/59e2743a12e862a137fcf223e75f0a6f.jpg",
  ),
  Product(
    id: 3,
    title: "title2",
    price: 15,
    pricediscount: 0,
    percendiscount: 15,
    stock: 12,
    description:
        "A handbag is a fashion accessory designed for carrying personal items such as wallets, keys, cosmetics, phones, and other essentials. It is commonly used by women and comes in various stocks, shapes, materials, and styles to suit different occasions and preferences.",
    image:
        "https://i.pinimg.com/736x/3b/fd/7e/3bfd7e39f683fac353e3266eb25a9062.jpg",
  ),
  Product(
    id: 4,
    title: "title3",
    price: 15,
    pricediscount: 0,
    percendiscount: 15,
    stock: 12,
    description:
        "A handbag is a fashion accessory designed for carrying personal items such as wallets, keys, cosmetics, phones, and other essentials. It is commonly used by women and comes in various stocks, shapes, materials, and styles to suit different occasions and preferences.",
    image:
        "https://i.pinimg.com/736x/e9/97/79/e99779130a4beb929310db1e84d1069c.jpg",
  ),
  Product(
    id: 5,
    title: "title4",
    price: 15,
    pricediscount: 0,
    percendiscount: 0,
    stock: 12,
    description:
        "A handbag is a fashion accessory designed for carrying personal items such as wallets, keys, cosmetics, phones, and other essentials. It is commonly used by women and comes in various stocks, shapes, materials, and styles to suit different occasions and preferences.",
    image:
        "https://i.pinimg.com/736x/7d/c3/be/7dc3be52504b8137e8e3ca53af119d11.jpg",
  ),
  Product(
    id: 6,
    title: "title5",
    price: 15,
    pricediscount: 0,
    percendiscount: 0,
    stock: 2,
    description:
        "A handbag is a fashion accessory designed for carrying personal items such as wallets, keys, cosmetics, phones, and other essentials. It is commonly used by women and comes in various stocks, shapes, materials, and styles to suit different occasions and preferences.",
    image:
        "https://i.pinimg.com/736x/5b/b8/e9/5bb8e934633796263c0406b0ee395f6f.jpg",
  ),
  Product(
    id: 7,
    title: "title6",
    price: 15,
    pricediscount: 0,
    percendiscount: 20,
    stock: 1,
    description:
        "A handbag is a fashion accessory designed for carrying personal items such as wallets, keys, cosmetics, phones, and other essentials. It is commonly used by women and comes in various stocks, shapes, materials, and styles to suit different occasions and preferences.",
    image:
        "https://i.pinimg.com/736x/3f/44/42/3f4442a30a24a85d960247267deb4c3e.jpg",
  ),
].obs;
