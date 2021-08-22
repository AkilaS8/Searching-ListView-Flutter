class User {
  String id ="";
  String firstName ="";
  String lastName ="";
  String email ="";
  String gender ="";
  String image ="";
  String profile ="";
  String job ="";


  User(this.id, this.firstName, this.lastName, this.email, this.gender,
      this.image, this.profile, this.job);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    image = json['image'];
    profile = json['profile'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['profile'] = this.profile;
    data['job'] = this.job;
    return data;
  }
}