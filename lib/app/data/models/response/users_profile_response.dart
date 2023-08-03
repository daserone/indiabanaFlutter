// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  ProfileResponseData? data;
  int? code;
  String? type;
  Message? message;
  bool? displayCodeError;
  bool? displayMessage;

  ProfileResponse({
    this.data,
    this.code,
    this.type,
    this.message,
    this.displayCodeError,
    this.displayMessage,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        data: json["data"] == null
            ? null
            : ProfileResponseData.fromJson(json["data"]),
        code: json["code"],
        type: json["type"],
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
        displayCodeError: json["displayCodeError"],
        displayMessage: json["displayMessage"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "code": code,
        "type": type,
        "message": message?.toJson(),
        "displayCodeError": displayCodeError,
        "displayMessage": displayMessage,
      };
}

class ProfileResponseData {
  Profile? data;

  ProfileResponseData({
    this.data,
  });

  factory ProfileResponseData.fromJson(Map<String, dynamic> json) =>
      ProfileResponseData(
        data: json["data"] == null ? null : Profile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Profile {
  String? appMode;
  String? lastName;
  String? dni;
  int? phone;
  int? altPhone;
  bool? isGuest;
  int? reputation;
  String? resetPasswordToken;
  bool? isSeller;
  bool? emailConfirmed;
  String? confirmationToken;
  String? profileImage;
  int? score;
  int? scoreCount;
  bool? subscribed;
  List<dynamic>? billing;
  List<dynamic>? claims;
  List<dynamic>? tickets;
  List<dynamic>? chats;
  List<dynamic>? bankAccounts;
  List<String>? commentariesToSeller;
  List<dynamic>? questionsToSeller;
  List<dynamic>? searches;
  String? id;
  String? name;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? sellerAccount;
  String? mainAddress;
  String? altEmail;
  String? sellerId;

  Profile({
    this.appMode,
    this.lastName,
    this.dni,
    this.phone,
    this.altPhone,
    this.isGuest,
    this.reputation,
    this.resetPasswordToken,
    this.isSeller,
    this.emailConfirmed,
    this.confirmationToken,
    this.profileImage,
    this.score,
    this.scoreCount,
    this.subscribed,
    this.billing,
    this.claims,
    this.tickets,
    this.chats,
    this.bankAccounts,
    this.commentariesToSeller,
    this.questionsToSeller,
    this.searches,
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.sellerAccount,
    this.mainAddress,
    this.altEmail,
    this.sellerId,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        appMode: json["app_mode"],
        lastName: json["last_name"],
        dni: json["DNI"],
        phone: json["phone"],
        altPhone: json["altPhone"],
        isGuest: json["isGuest"],
        reputation: json["reputation"],
        resetPasswordToken: json["resetPasswordToken"],
        isSeller: json["isSeller"],
        emailConfirmed: json["emailConfirmed"],
        confirmationToken: json["confirmationToken"],
        profileImage: json["profileImage"],
        score: json["score"],
        scoreCount: json["scoreCount"],
        subscribed: json["subscribed"],
        billing: json["billing"] == null
            ? []
            : List<dynamic>.from(json["billing"]!.map((x) => x)),
        claims: json["claims"] == null
            ? []
            : List<dynamic>.from(json["claims"]!.map((x) => x)),
        tickets: json["tickets"] == null
            ? []
            : List<dynamic>.from(json["tickets"]!.map((x) => x)),
        chats: json["chats"] == null
            ? []
            : List<dynamic>.from(json["chats"]!.map((x) => x)),
        bankAccounts: json["bankAccounts"] == null
            ? []
            : List<dynamic>.from(json["bankAccounts"]!.map((x) => x)),
        commentariesToSeller: json["commentaries_to_seller"] == null
            ? []
            : List<String>.from(json["commentaries_to_seller"]!.map((x) => x)),
        questionsToSeller: json["questions_to_seller"] == null
            ? []
            : List<dynamic>.from(json["questions_to_seller"]!.map((x) => x)),
        searches: json["searches"] == null
            ? []
            : List<dynamic>.from(json["searches"]!.map((x) => x)),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        sellerAccount: json["seller_account"],
        mainAddress: json["main_address"],
        altEmail: json["altEmail"],
        sellerId: json["seller_id"],
      );

  Map<String, dynamic> toJson() => {
        "app_mode": appMode,
        "last_name": lastName,
        "DNI": dni,
        "phone": phone,
        "altPhone": altPhone,
        "isGuest": isGuest,
        "reputation": reputation,
        "resetPasswordToken": resetPasswordToken,
        "isSeller": isSeller,
        "emailConfirmed": emailConfirmed,
        "confirmationToken": confirmationToken,
        "profileImage": profileImage,
        "score": score,
        "scoreCount": scoreCount,
        "subscribed": subscribed,
        "billing":
            billing == null ? [] : List<dynamic>.from(billing!.map((x) => x)),
        "claims":
            claims == null ? [] : List<dynamic>.from(claims!.map((x) => x)),
        "tickets":
            tickets == null ? [] : List<dynamic>.from(tickets!.map((x) => x)),
        "chats": chats == null ? [] : List<dynamic>.from(chats!.map((x) => x)),
        "bankAccounts": bankAccounts == null
            ? []
            : List<dynamic>.from(bankAccounts!.map((x) => x)),
        "commentaries_to_seller": commentariesToSeller == null
            ? []
            : List<dynamic>.from(commentariesToSeller!.map((x) => x)),
        "questions_to_seller": questionsToSeller == null
            ? []
            : List<dynamic>.from(questionsToSeller!.map((x) => x)),
        "searches":
            searches == null ? [] : List<dynamic>.from(searches!.map((x) => x)),
        "_id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "seller_account": sellerAccount,
        "main_address": mainAddress,
        "altEmail": altEmail,
        "seller_id": sellerId,
      };
}

class Message {
  String? original;
  String? translation;

  Message({
    this.original,
    this.translation,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        original: json["original"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "translation": translation,
      };
}
