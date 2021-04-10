import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:slivers_ecomm_demo/app/ItemColumnWidget.dart';
import 'package:slivers_ecomm_demo/app/ItemRowWidget.dart';
import 'package:slivers_ecomm_demo/app/PageViewHeader.dart';
import 'package:slivers_ecomm_demo/app/TopTrendingSliverBoxAdapter.dart';
import 'package:slivers_ecomm_demo/app/fakeStoreResponse.dart';
import 'package:slivers_ecomm_demo/app/fakeStoreResponsePojo.dart';
import 'package:http/http.dart' show get;

final String fakeStoreUrl = "https://fakestoreapi.com/products";

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int firstIndex = 0;

  FakeStoreResponsePojo objFSR;

  FakeStoreResponse objFakeStoreResponse;
  List<FakeStoreResponsePojo> objFSRList;

  @override
  void initState() {
    super.initState();
    fetchData(firstIndex);
  }

  void fetchData(int itemIndex) async {
    // Future.value(objFakeStoreResponse);
    var receivedStoreResponse = await get(Uri.parse(fakeStoreUrl));
    if (receivedStoreResponse.statusCode == 200) {
      objFakeStoreResponse =
          FakeStoreResponse.fromJson(json.decode(receivedStoreResponse.body));

      objFSR = FakeStoreResponsePojo();
      if (objFSRList == null) objFSRList = <FakeStoreResponsePojo>[];
      for (int i = 0; i < objFakeStoreResponse.fakeStoreList.length; i++) {
        objFSR = objFakeStoreResponse.fakeStoreList[i];
        objFSRList.add(objFSR);
      }

      print(receivedStoreResponse.body);
      print(objFakeStoreResponse.fakeStoreList[0].id);
      print(objFakeStoreResponse.fakeStoreList[0].category);
      print('Product title: ${objFakeStoreResponse.fakeStoreList[0].title}');
      print(
          'Product category: ${objFakeStoreResponse.fakeStoreList[0].category}');
      print(
          'Product description: ${objFakeStoreResponse.fakeStoreList[0].description}');
    } else {
      throw Exception('Failed to load album');
    }
    setState(() {
      print("Set state from fetchData");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (objFSRList == null)
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverAppBar(title: Text('Slivers E-commerce App')),
                SliverFixedExtentList(
                  itemExtent: 150,
                  delegate: SliverChildListDelegate(
                      [PageViewHeader(objFSRList: objFSRList)]),
                ),

                SliverPadding(padding: EdgeInsets.all(5)),

                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      ItemRowWidget(objFakeStoreResPojo: objFSRList[3]),
                      ItemRowWidget(objFakeStoreResPojo: objFSRList[19]),
                      ItemRowWidget(objFakeStoreResPojo: objFSRList[11])
                    ],
                  ),
                ),

                SliverPadding(padding: EdgeInsets.all(5)),

                SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      // height of item is passed in maxCrossAxisExtent
                      maxCrossAxisExtent: 200),

                  ///Lazy building of list
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      /// To convert infinite list to a list with "n" no of items,
                      /// uncomment the following line:
                      /// if (index > n) return null;

                      return ItemColumnWidget(
                        objFakeStoreResPojo: objFSRList[index],
                        itemImageHeight: 120,
                      );
                    },

                    /// or set childCount to limit no.of items
                    childCount: 4,
                  ),
                ),

                SliverPadding(padding: EdgeInsets.all(5)),

                SliverToBoxAdapter(
                  child: TopTrendingSliverBoxAdapter(objFSRList: objFSRList),
                ),

                SliverPadding(padding: EdgeInsets.all(5)),

                // This builds an infinite scrollable list of differently colored Containers.
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      // To convert infinite list to a list with three items, uncomment the following line:
                      // if (index > 3) return null;
                      // return Container(color: getRandomColor(), height: 150.0);

                      return ItemRowWidget(
                          objFakeStoreResPojo: objFSRList[index]);
                    },
                    // Or, uncomment the following line:
                    childCount: 4,
                  ),
                ),

                SliverPadding(padding: EdgeInsets.all(5)),

                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    ///no.of items in the horizontal axis
                    crossAxisCount: 3,
                  ),

                  ///Lazy building of list
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      /// To convert infinite list to a list with "n" no of items,
                      /// uncomment the following line:
                      /// if (index > n) return null;

                      return ItemColumnWidget(
                        objFakeStoreResPojo: objFSRList[index],
                        itemImageHeight: 60,
                      );
                    },

                    /// or set childCount to limit no.of items
                    childCount: 10,
                  ),
                ),
              ],
            ),
    );
  }
}
