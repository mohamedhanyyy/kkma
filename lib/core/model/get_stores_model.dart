class GetStoresModel {
  List<StoreModelItem>? stores;
  int? status;
  String? message;

  GetStoresModel({this.stores, this.status, this.message});

  GetStoresModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      stores = <StoreModelItem>[];
      json['data'].forEach((v) {
        stores!.add(StoreModelItem.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stores != null) {
      data['data'] = stores!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class StoreModelItem {
  int? id;
  String? name;

  StoreModelItem({this.id, this.name});

  StoreModelItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
