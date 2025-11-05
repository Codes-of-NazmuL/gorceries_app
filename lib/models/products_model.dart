// ignore_for_file: constant_identifier_names

class ProductModel {
    final String status;
    final String message;
    final DateTime timestamp;
    final Data data;

    ProductModel({
        required this.status,
        required this.message,
        required this.timestamp,
        required this.data,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        message: json["message"],
        timestamp: DateTime.parse(json["timestamp"]),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "timestamp": timestamp.toIso8601String(),
        "data": data.toJson(),
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
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
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
    final dynamic next;

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
    final String description;
    final ShortDescription shortDescription;
    final double price;
    final double comparePrice;
    final int discountPercentage;
    final dynamic stockQuantity;
    final StockStatus stockStatus;
    final bool isFeatured;
    final bool isActive;
    final List<Image> images;
    final Category category;
    final Reviews reviews;
    final DateTime createdAt;
    final DateTime updatedAt;

    Product({
        required this.id,
        required this.name,
        required this.slug,
        required this.description,
        required this.shortDescription,
        required this.price,
        required this.comparePrice,
        required this.discountPercentage,
        required this.stockQuantity,
        required this.stockStatus,
        required this.isFeatured,
        required this.isActive,
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
        description: json["description"],
        shortDescription: shortDescriptionValues.map[json["short_description"]]!,
        price: json["price"]?.toDouble(),
        comparePrice: json["compare_price"]?.toDouble(),
        discountPercentage: json["discount_percentage"],
        stockQuantity: json["stock_quantity"],
        stockStatus: stockStatusValues.map[json["stock_status"]]!,
        isFeatured: json["is_featured"],
        isActive: json["is_active"],
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
        "description": description,
        "short_description": shortDescriptionValues.reverse[shortDescription],
        "price": price,
        "compare_price": comparePrice,
        "discount_percentage": discountPercentage,
        "stock_quantity": stockQuantity,
        "stock_status": stockStatusValues.reverse[stockStatus],
        "is_featured": isFeatured,
        "is_active": isActive,
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

class Image {
    final String id;
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

enum ShortDescription {
    CLASSIC_ITALIAN_PIZZA,
    EMPTY,
    MIXED_FRUIT_SMOOTHIE_WITH_YOGURT
}

final shortDescriptionValues = EnumValues({
    "Classic Italian pizza": ShortDescription.CLASSIC_ITALIAN_PIZZA,
    "": ShortDescription.EMPTY,
    "Mixed fruit smoothie with yogurt": ShortDescription.MIXED_FRUIT_SMOOTHIE_WITH_YOGURT
});

enum StockStatus {
    INSTOCK
}

final stockStatusValues = EnumValues({
    "instock": StockStatus.INSTOCK
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
