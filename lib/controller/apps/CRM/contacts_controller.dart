import 'package:flutter/material.dart';
import '../../../controller/my_controller.dart';
import '../../../helper/widgets/my_text_utils.dart';
import '../../../models/contects_data.dart';
import '../../../views/apps/CRM/contacts_page.dart';

class ContactsController extends MyController {
  List<Contacts> contacts = [];
  DataTableSource? data;

  ContactsController();

  List<String> dummyTexts = List.generate(12, (index) => MyTextUtils.getDummyText(60));

  @override
  void onInit() {
    super.onInit();
    Contacts.dummyList.then((value) {
      contacts = value.sublist(0, 20);
      data = ContactsData(contacts);
      update();
    });
  }
}
