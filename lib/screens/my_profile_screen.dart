import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:sell_product/color.dart';
import 'package:sell_product/screens/login_screen.dart';
import 'package:sell_product/widgets/big_text.dart';
import 'package:sell_product/widgets/custom_input_fields.dart';
import 'package:sell_product/widgets/rounded_image.dart';
import 'package:sell_product/widgets/small_text.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String? _changeNewName;
  String? _changeNewPhoneNumber;
  String _name = 'mee';
  String _phone = '+856 20 99 888 777';

  final _formkey = GlobalKey<FormState>();
  final _formkey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: 'ໂປຣຟາຍ',
          color: AppColor.textColorwhite,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return LoginScreen();
                }), (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _myProfileImage(),
          SizedBox(
            height: 15,
          ),
          _showMyName(),
          _showMyPhoneNumber()
        ],
      )),
    );
  }

  Widget _myProfileImage() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: () {
            print('object');
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return _showImageProfile();
            }));
          },
          child: RoundedImageProfile(
            imagePath:
                'https://static.thairath.co.th/media/00_A5B2426030C6E1280.jpg',
            size: 150,
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            print('5');
          },
          child: Icon(Icons.camera_alt),
        )
      ],
    );
  }

  Widget _showImageProfile() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: BigText(
            text: 'ຮູບໂປຣຟາຍ',
            color: AppColor.textColorwhite,
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRect(
            child: InteractiveViewer(
              maxScale: 20,
              child: Image.network(
                  'https://static.thairath.co.th/media/00_A5B2426030C6E1280.jpg'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showMyName() {
    return Card(
      child: ListTile(
        onTap: () {
          _showModalBottomSheetName();
        },
        title: BigText(text: 'ຊື່'),
        subtitle: SmallText(
          text: '$_name',
          color: Colors.black,
        ),
        trailing: Icon(Icons.edit),
        leading: Icon(Icons.person),
      ),
    );
  }

  Widget _showMyPhoneNumber() {
    return Card(
      child: ListTile(
        onTap: () {
          _showModalBottomSheetPhoneNumber();
        },
        title: BigText(
          text: 'ເບີໂທລະສັບ',
        ),
        subtitle: SmallText(text: '$_phone', color: Colors.black),
        trailing: Icon(Icons.edit),
        leading: Icon(Icons.phone),
      ),
    );
  }

  void _showModalBottomSheetName() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formkey,
                  child: CustomTextFormFieldDefault(
                      initialValue: _name,
                      onsave: (_valeu) {
                        setState(() {
                          _changeNewName = _valeu;
                        });
                      },
                      hintText: 'ໃສ່ຊື່ໃໝ່ຂອງເຈົ້າ',
                      labelText: 'ຊື່ໃໝ່',
                      validator: RequiredValidator(
                          errorText: "ກະລຸນາໃສ່ຊື່ໃໝ່ຂອງເຈົ້າ"),
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      obscureText: false),
                ),
                Container(
                  height: 70,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: SmallText(
                            text: 'ຍົກເລີກ',
                            color: Colors.black,
                          )),
                      TextButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              print(_changeNewName);
                              setState(() {
                                _name = _changeNewName!;
                              });
                            }
                            Navigator.pop(context);
                          },
                          child: SmallText(
                            text: 'ບັນທຶກ',
                            color: Colors.black,
                          ))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  void _showModalBottomSheetPhoneNumber() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formkey1,
                  child: CustomTextFormFieldDefault(
                      initialValue: _phone,
                      onsave: (_valeu) {
                        setState(() {
                          _changeNewPhoneNumber = _valeu;
                        });
                      },
                      hintText: 'ໃສ່ເບີຂອງເຈົ້າ',
                      labelText: 'ເບິໃໝ່',
                      validator: RequiredValidator(
                          errorText: "ກະລຸນາໃສ່ເບີໃໝ່ຂອງເຈົ້າ"),
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      obscureText: false),
                ),
                Container(
                  height: 70,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: SmallText(
                            text: 'ຍົກເລີກ',
                            color: Colors.black,
                          )),
                      TextButton(
                          onPressed: () {
                            if (_formkey1.currentState!.validate()) {
                              _formkey1.currentState!.save();
                              print(_changeNewPhoneNumber);
                              setState(() {
                                _phone = _changeNewPhoneNumber!;
                              });
                            }
                            Navigator.pop(context);
                          },
                          child: SmallText(
                            text: 'ບັນທຶກ',
                            color: Colors.black,
                          ))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
