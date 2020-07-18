class User {
  String email;
  String uid;
  String displayName;

  User({this.email = "", this.uid = "", this.displayName = ""});

  void setEmailUid(String email, String uid) {
    this.email = email;
    this.uid = uid;
  }

  void setName(String displayName) {
    this.displayName = displayName;
  }
}
