class MockDataList {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? lastSeen;
  String? avatar;
  String? status;
  int? messages;

  MockDataList(
      {this.id,
      this.firstName,
      this.lastName,
      this.username,
      this.lastSeen,
      this.avatar,
      this.status,
      this.messages});

  MockDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    lastSeen = json['last_seen_time'];
    avatar = json['avatar'];
    status = json['status'];
    messages = json['messages'];
  }
}
