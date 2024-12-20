import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import '../model/firebase/firebase_authencation.dart';
class ProfileViewModel extends GetxController{
  late TextEditingController searchController = TextEditingController();
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final _userData = {}.obs;
  String _userId = '';
  RxMap get userData => _userData;

  @override
  void onInit() {
    super.onInit();
    _initializeUserId();
  }
}