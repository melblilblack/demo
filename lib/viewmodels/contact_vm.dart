import 'dart:async';

import 'package:untitled/models/contact.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ContactViewModel {
  StreamController<List<Contact>> _contactListController = StreamController.broadcast();
  Stream<List<Contact>> get outContactList => _contactListController.stream;
  Sink<List<Contact>> get _inContactList => _contactListController.sink;

  final _storage = const FlutterSecureStorage();

  List<Contact> _contactList = [];

  ContactViewModel() {
    outContactList.listen((data) {
      _contactList = data;
    });

    Future.delayed(Duration(seconds: 3)).then((_) async {
      List<Contact> contactList = await getContacts();
      _inContactList.add(contactList);
    });

  }

  Future<List<Contact>> getContacts() async {
    List<Contact> contactList = [];
    Map<String, String> contactsMap = await _storage.readAll();
    for (String key in contactsMap.keys){
      contactList.add(Contact.deserialize(contactsMap[key]!));
    }
    return contactList;
  }

  void addContact(Contact contact) {
    _contactList.add(contact);
    _inContactList.add(_contactList);
    _storage.write(key: contact.id.toString(), value: Contact.serialize(contact));
  }

  Future<bool> saveItem(Contact contact) async {
    await _storage.write(key: contact.id.toString(), value: Contact.serialize(contact));
    return Future(() => true);
  }

  void updateContact(Contact contact) {
    final index = _contactList.indexOf(
      _contactList.where((element) => element.id == contact.id).first
    );
    _contactList[index] = contact;
    _inContactList.add(_contactList);
  }

  void removeContact(int id) {
    _contactList.removeWhere((element) => element.id == id);
    _inContactList.add(_contactList);
  }

}