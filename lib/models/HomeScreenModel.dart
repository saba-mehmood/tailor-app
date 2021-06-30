class HomeScreenModel {
  int pending;
  int accepted;
  int completed;
  int canceled;
  int totalAmount;

  HomeScreenModel(
      {this.pending,
      this.accepted,
      this.completed,
      this.canceled,
      this.totalAmount});

  HomeScreenModel.fromJson(Map<String, dynamic> json) {
    pending = json['pending'];
    accepted = json['accepted'];
    completed = json['completed'];
    canceled = json['canceled'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pending'] = this.pending;
    data['accepted'] = this.accepted;
    data['completed'] = this.completed;
    data['canceled'] = this.canceled;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}
