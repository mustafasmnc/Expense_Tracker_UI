import 'package:expense_tracker1/json/daily_json.dart';
import 'package:expense_tracker1/json/day_month.dart';
import 'package:expense_tracker1/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeDay = 4;
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
        children: [
          Container(
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
                  EdgeInsets.only(top: 50, bottom: 25, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Daily Transaction',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black,
                          )),
                      Icon(AntDesign.search1)
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(days.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeDay = index;
                            });
                          },
                          child: Container(
                            width: (size.width - 40) / 7,
                            child: Column(
                              children: [
                                Text(days[index]['label'],
                                    style: TextStyle(fontSize: 10)),
                                SizedBox(height: 10),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: activeDay == index
                                        ? primary
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: activeDay == index
                                            ? primary
                                            : black.withOpacity(0.1)),
                                  ),
                                  child: Center(
                                      child: Text(days[index]['day'],
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: activeDay == index
                                                  ? white
                                                  : black))),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                children: List.generate(daily.length, (index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (size.width - 40) * 0.7,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: grey.withOpacity(0.1),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Image.asset(
                                  daily[index]['icon'],
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              width: (size.width - 90) * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    daily[index]['name'],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    daily[index]['date'],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: black.withOpacity(0.5),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: (size.width - 40) * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              daily[index]['price'],
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: green),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 65, top: 8),
                    child: Divider(thickness: 0.8),
                  ),
                ],
              );
            })),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 65),
                  width: (size.width - 40) * 0.7,
                  child: Text('Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black.withOpacity(0.4),
                      )),
                ),
                Container(
                  width: (size.width - 40) * 0.3,
                  child: Text('\$1780.00',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: black,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
