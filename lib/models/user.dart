class User {
  String email;
  String uid;
  String name;

  User({this.email = "", this.uid = "", this.name = ""});

  void setEmailUid(String email, String uid) {
    this.email = email;
    this.uid = uid;
  }

  void setName(String name) {
    this.name = name;
  }
}
