import 'dart:ui';

import 'package:expense_tracker1/json/profile_json.dart';
import 'package:expense_tracker1/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _emailController =
      TextEditingController(text: profile[0]['email']);
  TextEditingController _dateOfBirthController =
      TextEditingController(text: profile[0]['dateOfBirth']);
  TextEditingController _passwordController =
      TextEditingController(text: profile[0]['password']);
  TextEditingController _bankNameController =
      TextEditingController(text: bankandAmount[0]['bankName']);
  TextEditingController _amountController =
      TextEditingController(text: bankandAmount[0]['amount']);
  bool hidePassword = true;

  var activeGradient = 0;

  final _formKey = GlobalKey<FormState>();

  int day = 0;
  int month = 0;
  int year = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    day = int.parse(profile[0]['dateOfBirth'].split('.')[0]);
    month = int.parse(profile[0]['dateOfBirth'].split('.')[1]);
    year = int.parse(profile[0]['dateOfBirth'].split('.')[2]);
    activeGradient = bankandAmount[0]['color'] == sky
        ? 0
        : bankandAmount[0]['color'] == sunset
            ? 1
            : bankandAmount[0]['color'] == sea
                ? 2
                : bankandAmount[0]['color'] == mango
                    ? 3
                    : 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.4),
                  spreadRadius: 1,
                  offset: Offset(0, 8),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(AntDesign.setting)
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Container(
                        width: (size.width) * 0.3,
                        height: (size.width) * 0.3,
                        child: Container(
                          child: Stack(
                            children: [
                              CircularPercentIndicator(
                                animation: true,
                                radius: (size.width) * 0.15,
                                circularStrokeCap: CircularStrokeCap.round,
                                backgroundColor: grey.withOpacity(0.5),
                                lineWidth: 6,
                                percent: 0.65,
                                reverse: true,
                                progressColor: primary,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: (size.width) * 0.24,
                                  height: (size.width) * 0.24,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              profile[0]['profileUrl']),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: (size.width) * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile[0]['name'],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: black),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Credit Score: ${profile[0]['credit']}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: bankandAmount[0]['color'],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      //color: bankandAmount[0]['color'],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.4),
                          spreadRadius: 1,
                          offset: Offset(6, 6),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bankandAmount[0]['bankName'],
                                style: TextStyle(
                                    fontSize: 14,
                                    color: white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 20),
                              Text(
                                bankandAmount[0]['amount'],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () => _dialogBankAmount(),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: white, width: 1.5),
                              ),
                              child: Text(
                                'Update',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email",
                    style: TextStyle(
                        fontSize: 14,
                        color: grey,
                        fontWeight: FontWeight.w600)),
                TextField(
                  controller: _emailController,
                  cursorColor: black,
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Email'),
                ),
                SizedBox(height: 10),
                Text("Date Of Birth",
                    style: TextStyle(
                        fontSize: 14,
                        color: grey,
                        fontWeight: FontWeight.w600)),
                // TextField(
                //   controller: _dateOfBirthController,
                //   cursorColor: black,
                //   keyboardType: TextInputType.datetime,
                //   style: TextStyle(
                //       fontSize: 17, fontWeight: FontWeight.bold, color: black),
                //   decoration: InputDecoration(
                //       border: InputBorder.none, hintText: 'Date of birth'),
                // ),
                Container(
                  height: 150,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    dateOrder: DatePickerDateOrder.dmy,
                    initialDateTime: DateTime(year, month, day),
                    onDateTimeChanged: (DateTime newDateTime) {
                      String dateTimeString = newDateTime.toString();
                      var newDateofBirth = dateTimeString.split(' ');

                      print(newDateofBirth[0].replaceAll('-', '.'));
                      // Do something
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text("Password",
                    style: TextStyle(
                        fontSize: 14,
                        color: grey,
                        fontWeight: FontWeight.w600)),
                Container(
                  width: size.width * 0.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: TextField(
                          controller: _passwordController,
                          obscureText: hidePassword,
                          cursorColor: black,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: black),
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Password'),
                        ),
                      ),
                      IconButton(
                          onPressed: () =>
                              setState(() => hidePassword = !hidePassword),
                          icon: Icon(Icons.remove_red_eye)),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _dialogBankAmount() {
    showDialog(
        //barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return AlertDialog(
              title: Text('Update Bank and Amount'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Bank name',
                                  ),
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Enter bank name!';
                                    }
                                    return null;
                                  },
                                  controller: _bankNameController,
                                )))
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Amount',
                          ),
                          validator: (amount) {
                            if (amount == null || amount.isEmpty) {
                              return 'Enter amount!';
                            }
                            return null;
                          },
                          controller: _amountController,
                        ))
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                        children: List.generate(gradients.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: GestureDetector(
                            onTap: () {
                              setState(() => activeGradient = index);
                            },
                            child: Container(
                              height: activeGradient == index ? 30 : 25,
                              width: activeGradient == index ? 30 : 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    colors: gradients[index],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                              ),
                              child: activeGradient == index
                                  ? Icon(
                                      Icons.check,
                                      color: white,
                                    )
                                  : null,
                            )),
                      );
                    })),
                  ],
                ),
              ),
              actions: [
                MaterialButton(
                    color: Colors.grey[600],
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                MaterialButton(
                    color: Colors.green[600],
                    child: Text(
                      'Enter',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _updateBankandAmount();
                        Navigator.of(context).pop();
                      }
                    })
              ],
            );
          });
        });
  }

  void _updateBankandAmount() {
    bankandAmount[0]['bankName'] = _bankNameController.text.toString();
    bankandAmount[0]['amount'] = _amountController.text.toString();
    bankandAmount[0]['color'] = activeGradient == 0
        ? sky
        : activeGradient == 1
            ? sunset
            : activeGradient == 2
                ? sea
                : activeGradient == 3
                    ? mango
                    : fire;

    // _bankNameController.clear();
    // _amountController.clear();
    setState(() {});
  }
}
