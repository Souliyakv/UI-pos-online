import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sell_product/color.dart';
import 'package:sell_product/widgets/big_text.dart';
import 'package:sell_product/widgets/custom_input_fields.dart';
import 'package:sell_product/widgets/rounded_button.dart';
import 'package:sell_product/widgets/rounded_image.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({Key? key}) : super(key: key);

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  String? _nameProduct;

  String? _buyPriceLAK;
  String? _sellProductLAK;
  String? _buyPriceTHB;
  String? _sellProductTHb;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      appBar: AppBar(
          title: BigText(
        text: 'ເພີ່ມສິນຄ້າໃໝ່',
        color: AppColor.textColorwhite,
      )),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _allDataProduct(),
              SizedBox(
                height: 15,
              ),
              _addNewProductButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _allDataProduct() {
    return Container(
      height: 450,
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    onsave: (_value) {
                      setState(() {
                        _nameProduct = _value;
                      });
                    },
                    hintText: 'ໃສ່ຊື່ສິນຄ້າຂອງເຈົ້າ',
                    labelText: 'ຊື່',
                    validator: RequiredValidator(
                        errorText: 'ກະລຸນາໃສ່ຊື່ສິນຄ້າຂອງເຈົ້າ'),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    obscureText: false),
              ),
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    onsave: (_value) {
                      setState(() {
                        _buyPriceLAK = _value;
                      });
                    },
                    hintText: 'ໃສ່ລາຄາຊື້ສິນຄ້າເງີນກີບ',
                    labelText: 'ລາຄາຊື້(ກີບ)',
                    validator: RequiredValidator(
                        errorText: 'ກະລຸນາໃສ່ລາຄາຊື້ສິນຄ້າຂອງເຈົ້າ(ກີບ)'),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    obscureText: false),
              ),
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    onsave: (_value) {
                      setState(() {
                        _buyPriceTHB = _value;
                      });
                    },
                    hintText: 'ໃສ່ລາຄາຊື້ເງິນບາດ',
                    labelText: 'ລາຄາຊື້(ບາດ)',
                    validator: RequiredValidator(
                        errorText: 'ກະລຸນາໃສ່ລາຄາຊື້ສິນຄ້າຂອງເຈົ້າ(ບາດ)'),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    obscureText: false),
              ),
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    onsave: (_value) {
                      setState(() {
                        _sellProductLAK = _value;
                      });
                    },
                    hintText: 'ໃສ່ລາຄາຂາຍເງີນກີບ',
                    labelText: 'ລາຄາຂາຍ(ກີບ)',
                    validator: RequiredValidator(
                        errorText: 'ກະລຸນາໃສ່ລາຄາຂາຍສິນຄ້າຂອງເຈົ້າ(ກີບ)'),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    obscureText: false),
              ),
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.done,
                    onsave: (_value) {
                      setState(() {
                        _sellProductTHb = _value;
                      });
                    },
                    hintText: 'ໃສ່ລາຄາຂາຍເງິນບາດ',
                    labelText: 'ລາຄາຂາຍ(ບາດ)',
                    validator: RequiredValidator(
                        errorText: 'ກະລຸນາໃສ່ລາຄາຂາຍສິນຄ້າຂອງເຈົ້າ(ບາດ)'),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    obscureText: false),
              )
            ],
          )),
    );
  }

  Widget _addNewProductButton() {
    return RoundedButton(
        name: 'ເພີ່ມສິນຄ້າໃໝ່',
        height: 60,
        width: 250,
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            Navigator.pop(context);
          }
        });
  }
}
