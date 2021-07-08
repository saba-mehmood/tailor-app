
class OrderDetailModel {

  int Id;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;
  DateTime latestEditDateTime;

  OrderDetailModel({this.Id, this.noteTitle, this.noteContent, this.createDateTime, this.latestEditDateTime});

  factory OrderDetailModel.fromJson(Map<String, dynamic> item) {
    return OrderDetailModel(
      Id: item['Id'],
      noteTitle: item['noteTitle'],
      noteContent: item['noteContent'],
      createDateTime: DateTime.parse(item['createDateTime']),
      latestEditDateTime: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }
}
