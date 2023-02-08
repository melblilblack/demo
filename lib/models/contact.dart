import 'dart:convert';

import 'package:flutter/material.dart';

class Contact{
  int id;
  String name;
  String number;

  Contact(this.id, this.name, this.number);

  factory Contact.fromJson(Map<String, dynamic> jsonData) =>
      Contact(jsonData['id'], jsonData['name'], jsonData['number'],
      );

  static Map<String, dynamic> toMap(Contact model) =>
      <String, dynamic> {
        'id': model.id,
        'name': model.name,
        'number': model.number,
      };

  static String serialize(Contact model) => json.encode(Contact.toMap(model));

  static Contact deserialize(String json) => Contact.fromJson(jsonDecode(json));

}