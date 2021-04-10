import 'package:flutter/material.dart';
import 'package:slivers_ecomm_demo/app/fakeStoreResponsePojo.dart';

class ItemRowWidget extends StatelessWidget {
  final FakeStoreResponsePojo objFakeStoreResPojo;

  ItemRowWidget({@required this.objFakeStoreResPojo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(objFakeStoreResPojo.image),
                    // image: NetworkImage(
                    //     'https://www.vhv.rs/dpng/d/547-5478988_orange-color-on-headphones-in-ear-headphones-png.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Item Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500)),
                  Text("Price",
                      style: TextStyle(color: Colors.black, fontSize: 16.0)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
