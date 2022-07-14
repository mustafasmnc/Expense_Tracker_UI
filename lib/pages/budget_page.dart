import 'package:expense_tracker1/json/budget_json.dart';
import 'package:expense_tracker1/json/day_month.dart';
import 'package:expense_tracker1/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int activeMonth = 4;
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
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.4),
                spreadRadius: 1,
                offset: Offset(0, 8),
                blurRadius: 3,
              ),
            ]),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Budgets',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Row(
                        children: [
                          Icon(AntDesign.search1),
                          SizedBox(width: 15),
                          Icon(AntDesign.plus)
                        ],
                      )
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
          Column(
            children: List.generate(budget_json.length, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.4),
                          spreadRadius: 1,
                          offset: Offset(0, 8),
                          blurRadius: 3,
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        budget_json[index]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                budget_json[index]['price'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: black,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                budget_json[index]['label_percentage'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "\$5000.00",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Stack(
                        children: [
                          Container(
                            width: size.width - 40,
                            height: 5,
                            decoration: BoxDecoration(
                                color: grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          Container(
                            width: (size.width *
                                    budget_json[index]['percentage']) -
                                40,
                            height: 5,
                            decoration: BoxDecoration(
                                color: budget_json[index]['color'],
                                borderRadius: BorderRadius.circular(5)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
