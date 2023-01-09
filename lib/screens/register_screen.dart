import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sell_product/color.dart';
import 'package:sell_product/widgets/custom_input_fields.dart';
import 'package:sell_product/widgets/rounded_button.dart';
import 'package:sell_product/widgets/rounded_image.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late double _deviceHeight;
  late double _deviceWidth;
  String? _name;
  String? _phoneNumber;
  String? _email;
  String? _password;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
        backgroundColor: AppColor.mainColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _imageProfile(),
                SizedBox(
                  height: _deviceHeight * 0.01,
                ),
                _registerForm(),
                SizedBox(
                  height: _deviceHeight * 0.01,
                ),
                _registerButton()
              ],
            ),
          ),
        ));
  }

  Widget _imageProfile() {
    return GestureDetector(
      onTap: () {},
      child: RoundedImage(
          imagePath:
              'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png',
          size: _deviceHeight * 0.14),
    );
  }

  Widget _registerForm() {
    return Container(
      padding: EdgeInsets.only(
          left: _deviceHeight * 0.02, right: _deviceHeight * 0.02),
      height: _deviceHeight * 0.45,
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
                    autofocus: false,
                    onsave: (_value) {
                      setState(() {
                        _name = _value;
                      });
                    },
                    hintText: "ໃສ່ຊື່ຂອງເຈົ້າ",
                    labelText: 'ຊື່',
                    validator:
                        RequiredValidator(errorText: "ກະລຸນາໃສ່ຊື່ຂອງເຈົ້າ"),
                    keyboardType: TextInputType.text,
                    obscureText: false),
              ),
              SizedBox(
                height: _deviceHeight * 0.01,
              ),
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    autofocus: false,
                    onsave: (_value) {
                      setState(() {
                        _phoneNumber = _value;
                      });
                    },
                    hintText: "ໃສ່ເບີໂທລະສັບຂອງເຈົ້າ",
                    labelText: 'ເບິໂທລະສັບ',
                    validator: RequiredValidator(
                        errorText: "ກະລຸນາໃສ່ເບີໂທລະສັບຂອງເຈົ້າ"),
                    keyboardType: TextInputType.number,
                    obscureText: false),
              ),
              SizedBox(
                height: _deviceHeight * 0.01,
              ),
              Expanded(
                child: CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    autofocus: false,
                    onsave: (_value) {
                      setState(() {
                        _email = _value;
                      });
                    },
                    hintText: 'ໃສ່ອີເມວຂອງເຈົ້າ',
                    labelText: 'ອີເມວ',
                    validator: MultiValidator([
                      RequiredValidator(errorText: "ກະລຸນາໃສ່ອີເມວຂອງເຈົ້າ"),
                      EmailValidator(errorText: 'ຮູບແບບອີເມວຂອງທ່ານບໍ່ຖືກຕ້ອງ')
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false),
              ),
              SizedBox(
                height: _deviceHeight * 0.01,
              ),
              Expanded(
                child: CustomTextFormField(
                  textInputAction: TextInputAction.done,
                  autofocus: false,
                  onsave: (_value) {
                    setState(() {
                      _password = _value;
                    });
                  },
                  hintText: 'ໃສ່ລະຫັດຜ່ານຂອງເຈົ້າ',
                  labelText: 'ລະຫັດຜ່ານ',
                  validator: RequiredValidator(errorText: 'ກະລຸນາໃສ່ລະຫັດຜ່ານ'),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
              )
            ],
          )),
    );
  }

  Widget _registerButton() {
    return RoundedButton(
        name: "ສ້າງບັນຊີ",
        height: _deviceHeight * 0.08,
        width: _deviceWidth * 0.65,
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState!.save();

            print(_name);
            // _formkey.currentState!.reset();
          }
        });
  }
}
