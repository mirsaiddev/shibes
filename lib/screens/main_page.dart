import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shibas_mvvm_provider/utils/constants.dart';
import 'package:shibas_mvvm_provider/view_models/shibe_list_view_model.dart';

import 'image_detail_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _buildList(ShibeListViewModel vs) {
    switch (vs.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return GridView.builder(
          itemCount: vs.shibes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Image.network(vs.shibes[index].url),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageDetailPage(
                            url: vs.shibes[index].url,
                          )),
                );
              },
            );
          },
        );
      case LoadingStatus.empty:
      default:
        return Center(
          child: Text("No results found"),
        );
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ShibeListViewModel>(context, listen: false).fetchShibes();
  }

  @override
  Widget build(BuildContext context) {
    var vs = Provider.of<ShibeListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shibes",
          style: TextStyles.h1,
        ),
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Constants.mWhite),
            onPressed: () {
              Provider.of<ShibeListViewModel>(context, listen: false).fetchShibes();
            },
          ),
        ],
      ),
      body: Container(
        child: _buildList(vs),
      ),
    );
  }
}
