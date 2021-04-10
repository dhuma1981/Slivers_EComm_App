import 'package:flutter/material.dart';
import 'package:slivers_ecomm_demo/app/fakeStoreResponsePojo.dart';

class ItemColumnWidget extends StatelessWidget {
  // final double cardWidth;
  final double itemImageHeight;
  final FakeStoreResponsePojo objFakeStoreResPojo;

  ItemColumnWidget({@required this.objFakeStoreResPojo, this.itemImageHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Container(
          // width: cardWidth, // manages card width
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                    height: itemImageHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(objFakeStoreResPojo.image),
                        // image: NetworkImage(
                        //     'https://www.vhv.rs/dpng/d/450-4502807_iphone-12-pro-max-price-hd-png-download.png'),
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text("Item Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text("Price",
                    style: TextStyle(color: Colors.black45, fontSize: 10.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
