import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final String status;
  final String message;
  final Data data;
  final DateTime timestamp;

  ProductModel({
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "timestamp": timestamp.toIso8601String(),
      };
}

class Data {
  final List<Product> products;
  final Pagination pagination;

  Data({
    required this.products,
    required this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;
  final Links links;

  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
        "links": links.toJson(),
      };
}

class Links {
  final String first;
  final String last;
  final dynamic prev;
  final String next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Product {
  final int id;
  final String name;
  final String slug;
  final String sku;
  final String description;
  final String shortDescription;
  final double price;
  final double comparePrice;
  final int discountPercentage;
  final dynamic stockQuantity;
  final String stockStatus;
  final bool isFeatured;
  final bool isActive;
  final int weight;
  final Dimensions dimensions;
  final List<Image> images;
  final Category category;
  final Reviews reviews;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.sku,
    required this.description,
    required this.shortDescription,
    required this.price,
    required this.comparePrice,
    required this.discountPercentage,
    required this.stockQuantity,
    required this.stockStatus,
    required this.isFeatured,
    required this.isActive,
    required this.weight,
    required this.dimensions,
    required this.images,
    required this.category,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        sku: json["sku"],
        description: json["description"],
        shortDescription: json["short_description"],
        price: json["price"]?.toDouble(),
        comparePrice: json["compare_price"]?.toDouble(),
        discountPercentage: json["discount_percentage"],
        stockQuantity: json["stock_quantity"],
        stockStatus: json["stock_status"],
        isFeatured: json["is_featured"],
        isActive: json["is_active"],
        weight: json["weight"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        category: Category.fromJson(json["category"]),
        reviews: Reviews.fromJson(json["reviews"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "sku": sku,
        "description": description,
        "short_description": shortDescription,
        "price": price,
        "compare_price": comparePrice,
        "discount_percentage": discountPercentage,
        "stock_quantity": stockQuantity,
        "stock_status": stockStatus,
        "is_featured": isFeatured,
        "is_active": isActive,
        "weight": weight,
        "dimensions": dimensions.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "category": category.toJson(),
        "reviews": reviews.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Category {
  final int id;
  final String name;
  final String slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Dimensions {
  final int length;
  final int width;
  final int height;

  Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json["length"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "width": width,
        "height": height,
      };
}

class Image {
  final int id;
  final String url;
  final String alt;
  final bool isPrimary;

  Image({
    required this.id,
    required this.url,
    required this.alt,
    required this.isPrimary,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
        alt: json["alt"],
        isPrimary: json["is_primary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "alt": alt,
        "is_primary": isPrimary,
      };
}

class Reviews {
  final int averageRating;
  final int reviewCount;

  Reviews({
    required this.averageRating,
    required this.reviewCount,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        averageRating: json["average_rating"],
        reviewCount: json["review_count"],
      );

  Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "review_count": reviewCount,
      };
}
