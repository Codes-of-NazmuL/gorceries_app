import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
    final String status;
    final String message;
    final Data data;
    final DateTime timestamp;

    RegisterResponse({
        required this.status,
        required this.message,
        required this.data,
        required this.timestamp,
    });

    factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
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
    final int id;
    final String username;
    final String email;
    final String displayName;
    final String firstName;
    final String lastName;
    final String role;
    final String token;

    Data({
        required this.id,
        required this.username,
        required this.email,
        required this.displayName,
        required this.firstName,
        required this.lastName,
        required this.role,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        displayName: json["display_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        role: json["role"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "display_name": displayName,
        "first_name": firstName,
        "last_name": lastName,
        "role": role,
        "token": token,
    };
}
