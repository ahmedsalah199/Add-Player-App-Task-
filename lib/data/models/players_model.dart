class PlayersModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  String? image;

  PlayersModel(
      this.id, this.firstName, this.lastName, this.maidenName, this.image);

  PlayersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'image': image,
    };
  }
}
