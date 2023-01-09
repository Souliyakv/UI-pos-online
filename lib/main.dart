import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell_product/providers/addproducttocatalog_provider.dart';
import 'package:sell_product/screens/login_screen.dart';
import 'package:sell_product/widgets/big_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return AddProductToCatalogProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return AddDataShopperToBillingProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return TotalPriceProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginScreen(),
      ),
    );
  }
}
