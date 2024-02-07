import 'package:flutter/material.dart';
import 'package:sample_for_totinsot/model/post_model.dart';
import 'package:sample_for_totinsot/services/provider_service.dart';

class ProviderOperation extends ChangeNotifier{
  final service = ProviderService();
  bool isLoading = false;
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  getAllPosts() async {
    isLoading = true;
    notifyListeners();
    final res = await service.getAll();
    _posts = res;
    isLoading = false;
    notifyListeners();
  }
}