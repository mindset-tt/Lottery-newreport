
// ignore_for_file: file_names, constant_identifier_names
// To parse this JSON data, do
//
//     final loginMd = loginMdFromJson(jsonString);

import 'dart:convert';

LoginMd loginMdFromJson(String str) => LoginMd.fromJson(json.decode(str));

String loginMdToJson(LoginMd data) => json.encode(data.toJson());

class LoginMd {
    LoginMd({
        this.auth,
        this.token,
        this.results,
    });

    bool auth;
    String token;
    List<Result> results;

    factory LoginMd.fromJson(Map<String, dynamic> json) => LoginMd(
        auth: json["auth"],
        token: json["token"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "auth": auth,
        "token": token,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.userid,
        this.firstName,
        this.lastName,
        this.userEmail,
        this.userPassword,
        this.branchId,
        this.unitId,
        this.rolesId,
        this.userStatus,
        this.dateRegister,
        this.typeCodeFk,
    });

    int userid;
    String firstName;
    String lastName;
    String userEmail;
    String userPassword;
    int branchId;
    int unitId;
    dynamic rolesId;
    int userStatus;
    DateTime dateRegister;
    String typeCodeFk;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        userid: json["userid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        branchId: json["branch_id"],
        unitId: json["unit_id"],
        rolesId: json["roles_id"],
        userStatus: json["user_status"],
        dateRegister: DateTime.parse(json["date_register"]),
        typeCodeFk: json["type_code_fk"],
    );

    Map<String, dynamic> toJson() => {
        "userid": userid,
        "first_name": firstName,
        "last_name": lastName,
        "user_email": userEmail,
        "user_password": userPassword,
        "branch_id": branchId,
        "unit_id": unitId,
        "roles_id": rolesId,
        "user_status": userStatus,
        "date_register": dateRegister.toIso8601String(),
        "type_code_fk": typeCodeFk,
    };
}
