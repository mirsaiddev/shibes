import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shibas_mvvm_provider/screens/main_page.dart';
import 'package:shibas_mvvm_provider/utils/constants.dart';
import 'package:shibas_mvvm_provider/view_models/shibe_list_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constants.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => ShibeListViewModel(),
        child: MainPage(),
      ),
    );
  }
}
