class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromjson(json['data']);
  }
}

class HomeDataModel {
  List<BannerModel>? banners = [];
  List<ProductModel>? products = [];

  HomeDataModel.fromjson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      json['banners'].forEach((element) {
        banners!.add(BannerModel.fromjson(element));
      });
    }
    if (json['products'] != null) {
      json['products'].forEach((element) {
        products!.add(ProductModel.fromjson(element));
      });
    }
  }
}

class BannerModel {
  int? id;
  String? image;

  BannerModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavourites;
  bool? inCart;

  ProductModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavourites = json['in_favourites'];
    inCart = json['in_cart'];
  }
}
