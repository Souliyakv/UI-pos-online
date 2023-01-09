import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sell_product/color.dart';
import 'package:sell_product/screens/home_screen.dart';
import 'package:sell_product/screens/register_screen.dart';
import 'package:sell_product/widgets/custom_input_fields.dart';
import 'package:sell_product/widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email;
  String? _password;
  final _formkey = GlobalKey<FormState>();
  late double _deviceHeight;
  late double _deviceWidth;
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _pageImage(),
                SizedBox(
                  height: _deviceHeight * 0.02,
                ),
                _loginForm(),
                SizedBox(
                  height: _deviceHeight * 0.01,
                ),
                _loginButton(),
                SizedBox(
                  height: _deviceHeight * 0.01,
                ),
                Text(
                  "----------ຫຼື----------",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                _registerAccountLink()
              ],
            ),
          ),
        ));
  }

  Widget _pageImage() {
    return Container(height: 150, child: Image.asset('assets/images/logo.png'));
  }

  Widget _loginForm() {
    return Container(
        padding: EdgeInsets.only(
            left: _deviceWidth * 0.02, right: _deviceWidth * 0.02),
        height: _deviceHeight * 0.24,
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomTextFormField(
                  autofocus: false,
                  onsave: (_value) {
                    setState(() {
                      _email = _value;
                    });
                  },
                  hintText: "ໃສ່ອີເມວຂອງເຈົ້າ",
                  labelText: "Email",
                  obscureText: false,
                  validator: MultiValidator([
                    EmailValidator(errorText: "ຮູບແບບອີເມວບໍ່ຖືກຕ້ອງ"),
                    RequiredValidator(errorText: "ໃສ່ອີເມວຂອງເຈົ້າ")
                  ]),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  autofocus: false,
                  onsave: (_value) {
                    setState(() {
                      _password = _value;
                    });
                  },
                  validator: RequiredValidator(
                      errorText: "ກະລຸນາໃສ່ລະຫັດຜ່ານຂອງເຈົ້າ"),
                  keyboardType: TextInputType.text,
                  hintText: "ໃສ່ລະຫັດຜ່ານຂອງເຈົ້າ",
                  obscureText: true,
                  labelText: "Password",
                  textInputAction: TextInputAction.done,
                ),
              ),
            ],
          ),
        ));
  }

  Widget _loginButton() {
    return RoundedButton(
        name: "ເຂົ້າສູ່ລະບົບ",
        height: _deviceHeight * 0.08,
        width: _deviceWidth * 0.65,
        onPressed: () {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return HomeScreen();
          }), (route) => false);
        });
  }

  Widget _registerAccountLink() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return RegisterScreen();
        }));
      },
      child: Container(
        child: Text(
          "ສ້າງບັນຊີຜູ້ໃຊ້",
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
