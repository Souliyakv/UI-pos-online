import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_product/screens/edit_data_product_screen.dart';
import 'package:sell_product/screens/import_product_screen.dart';
import 'package:sell_product/widgets/big_text.dart';
import 'package:sell_product/widgets/custom_list_view_tiles.dart';

class DataProductScreen extends StatefulWidget {
  const DataProductScreen({Key? key}) : super(key: key);

  @override
  State<DataProductScreen> createState() => _DataProductScreenState();
}

class _DataProductScreenState extends State<DataProductScreen> {
  late double _deviceHeight;
  late double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, index) {
              return SingleChildScrollView(
                child: CustomListViewTilesDataProduct(
                    title: "ຢາສະຜົມ",
                    subtitle: '20000',
                    amoutn: '100',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return EditDataProductScreen();
                      }));
                    }),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return ImportProductScreen();
            }));
          },
          child: Text(
            'ນຳເຂົ້າ',
            style: TextStyle(color: Colors.white, fontFamily: 'Roboto'),
          ),
        ));
  }
}
