import 'package:slivers_ecomm_demo/app/fakeStoreResponsePojo.dart';

class FakeStoreResponse {
  List<FakeStoreResponsePojo> fakeStoreList = [];

  FakeStoreResponse({
    this.fakeStoreList,
  });

  FakeStoreResponse.fromJson(List<dynamic> json) {
    json.forEach((element) {
      // if(fakeStoreList == null) fakeStoreList = <FakeStoreResponsePojo>[];
      print('element $element');
      fakeStoreList.add(FakeStoreResponsePojo.fromJson(element));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fakeStoreList'] = this.fakeStoreList.map((v) => v.toJson()).toList();
    return data;
  }
}
