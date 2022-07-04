import 'package:expense_tracker1/json/day_month.dart';
import 'package:expense_tracker1/theme/colors.dart';
import 'package:expense_tracker1/widgets/chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int activeMonth = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List expense = [
      {
        "icon": Icons.arrow_back,
        "color": blue,
        "label": "Income",
        "cost": "\$2567.80"
      },
      {
        "icon": Icons.arrow_forward,
        "color": red,
        "label": "Expense",
        "cost": "\$949.80"
      }
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 3,
              )
            ]),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stats',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(AntDesign.search1)
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(months.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeMonth = index;
                            });
                          },
                          child: Container(
                            width: (size.width - 40) / 7,
                            child: Column(
                              children: [
                                Text(months[index]['label'],
                                    style: TextStyle(fontSize: 10)),
                                SizedBox(height: 10),
                                Container(
                                  // width: 30,
                                  // height: 30,
                                  decoration: BoxDecoration(
                                    color: activeMonth == index
                                        ? primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: activeMonth == index
                                            ? primary
                                            : black.withOpacity(0.1)),
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 7),
                                    child: Text(months[index]['day'],
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: activeMonth == index
                                                ? white
                                                : black)),
                                  )),
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
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: size.height * 0.32,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 3,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Net Balance',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: black.withOpacity(0.5)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '\$2551.56',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: black.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: size.width - 20,
                        height: size.height * 0.2,
                        child: LineChartSample2(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 20,
            children: List.generate(expense.length, (index) {
              return Container(
                width: (size.width - 60) / 2,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.1),
                        spreadRadius: 10,
                        blurRadius: 3,
                      )
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: expense[index]['color'],
                            shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            expense[index]['icon'],
                            color: white,
                          ),
                        ),
                      ),
                      //Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expense[index]['label'],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: black.withOpacity(0.5)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            expense[index]['cost'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: black.withOpacity(0.8)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
