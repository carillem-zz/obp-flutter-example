class RoutingModel {
  String scheme;
  String address;

  RoutingModel({this.scheme, this.address});

  RoutingModel.fromJson(Map<String, dynamic> json)
      : scheme = json['authToken'],
        address = json['address'];
}