import 'package:flutter/material.dart';
import 'package:slivers_ecomm_demo/app/fakeStoreResponsePojo.dart';

class TopTrendingSliverBoxAdapter extends StatelessWidget {
  // final FakeStoreResponsePojo objFakeStoreResPojo;
  List<FakeStoreResponsePojo> objFSRList;
  TopTrendingSliverBoxAdapter({@required this.objFSRList});

  @override
  Widget build(BuildContext context) {
    if (objFSRList == null) objFSRList = <FakeStoreResponsePojo>[];
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Text('Top Trending',
              style: TextStyle(color: Colors.black, fontSize: 22.0)),
          Container(
            height: 170.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: objFSRList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 100, // manages card width
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(objFSRList[index].image),
                                    // image: NetworkImage(
                                    //     'https://freepngimg.com/thumb/headphones/5-blue-headphones-png-image.png'),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 2),
                              child: Text("Item Name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text("Price",
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 14.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
