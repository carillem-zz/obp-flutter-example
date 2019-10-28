class ViewModel {
  String id;
  String shortName;
  String description;
  bool isPublic = false;

  ViewModel({this.id, this.shortName, this.description, this.isPublic});

  ViewModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        shortName = json['short_name'],
        description = json['description'],
        isPublic = json['is_public'];
}