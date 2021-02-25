import 'class/userdetails.dart';
import 'global.dart';

Future<List<userdetails>>userinfom() async {
  String url = "b/7S20";
  List _list = new List();
  List<userdetails> _ulist = new List();
  _list = await PostApi(url);
  print("hello list :::::::::::" + _list.toString());
  for (var i in _list) {
    _ulist.add(userdetails.fromJson(i));
  }
  print("           ++  ++++" + _ulist.length.toString());
  return _ulist;
}
