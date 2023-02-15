import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/models/contact.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@lazySingleton
class ContactViewModel extends ChangeNotifier {

  final _storage = const FlutterSecureStorage();

  final List<Contact> _contactList = [];

  List<Contact> get contacts => _contactList;

  ContactViewModel() {
    Future.delayed(const Duration(seconds: 1)).then((_) async {
      Map<String, String> contactsMap = await _storage.readAll();
      for (String key in contactsMap.keys){
        _contactList.add(Contact.deserialize(contactsMap[key]!));
      }
      notifyListeners();
    });

  }

  void addContact(Contact contact) {
    _contactList.add(contact);
    _storage.write(key: contact.id.toString(), value: Contact.serialize(contact));
    notifyListeners();
  }

  void updateContact(Contact contact) {
    final index = _contactList.indexOf(
      _contactList.where((element) => element.id == contact.id).first
    );
    _contactList[index] = contact;
    _storage.write(key: contact.id.toString(), value: Contact.serialize(contact));
    notifyListeners();
  }

  void removeContact(int id) {
    _contactList.removeWhere((element) => element.id == id);
    _storage.delete(key: id.toString());
    notifyListeners();
  }

}