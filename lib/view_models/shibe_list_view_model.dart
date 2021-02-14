import 'package:shibas_mvvm_provider/models/shibe.dart';
import 'package:shibas_mvvm_provider/services/web_service.dart';
import 'package:shibas_mvvm_provider/view_models/shibe_view_model.dart';

import 'package:flutter/material.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class ShibeListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  var shibes = List<ShibeViewModel>();

  void fetchShibes() async {
    List<Shibe> newShibes = await WebService().fetchShibes();
    notifyListeners();

    this.shibes = newShibes.map((article) => ShibeViewModel(shibe: article)).toList();

    if (this.shibes.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
