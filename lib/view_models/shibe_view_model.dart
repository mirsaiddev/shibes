import 'package:shibas_mvvm_provider/models/shibe.dart';

class ShibeViewModel {
  Shibe _shibe;

  ShibeViewModel({Shibe shibe}) : _shibe = shibe;

  String get url {
    return _shibe.imageUrl;
  }
}
