import 'package:ratel/annotations/geral_annotations.dart';

@Json()
class Auth {
  @Column(name: 'id')
  late int? id;

  @Column(name: 'username')
  late String? userName;

  @Column(name: 'password')
  late String? password;

  Auth({this.id, this.userName, this.password});
}
