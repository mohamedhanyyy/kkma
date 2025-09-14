class StoreItemsModel {
  List<StoreItemDetails>? storeItems;
  int? status;
  String? message;

  StoreItemsModel({this.storeItems, this.status, this.message});

  StoreItemsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      storeItems = <StoreItemDetails>[];
      json['data'].forEach((v) {
        storeItems!.add(StoreItemDetails.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (storeItems != null) {
      data['data'] = storeItems!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class StoreItemDetails {
  int? id;
  String? code;
  String? barcode;
  String? name;
  int? amount;

  StoreItemDetails({this.id, this.code, this.barcode, this.name, this.amount});

  StoreItemDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    barcode = json['barcode'];
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['barcode'] = barcode;
    data['name'] = name;
    data['amount'] = amount;
    return data;
  }
}
