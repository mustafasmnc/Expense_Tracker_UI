import 'package:expense_tracker1/json/create_budget_json.dart';
import 'package:expense_tracker1/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CreateBudgetPage extends StatefulWidget {
  const CreateBudgetPage({Key? key}) : super(key: key);

  @override
  State<CreateBudgetPage> createState() => _CreateBudgetPageState();
}

class _CreateBudgetPageState extends State<CreateBudgetPage> {
  int activeCategory = 0;
  TextEditingController _budgetName = TextEditingController(text: 'Shopping');
  TextEditingController _budgetCost = TextEditingController(text: '100.50');
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
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.4),
                spreadRadius: 1,
                offset: Offset(0, 8),
                blurRadius: 3,
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 15, right: 15, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create Budget',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  Icon(AntDesign.search1)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Choose Category',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: black.withOpacity(0.5)),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(categories.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activeCategory = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          width: size.width * 0.3,
                          height: size.width * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: activeCategory == index ? 3 : 0,
                                  color: activeCategory == index
                                      ? primary.withOpacity(0.6)
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  offset: Offset(8, 8),
                                  blurRadius: 3,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey.withOpacity(0.2)),
                                  child: Image.asset(
                                    categories[index]['icon'],
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  categories[index]['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
                ),
                SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Budget Name',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: grey),
                    ),
                    TextField(
                      controller: _budgetName,
                      cursorColor: black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Input Budget Name'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Budget Cost',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: grey),
                    ),
                    Container(
                      width: 100,
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _budgetCost,
                            cursorColor: black,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: black),
                            decoration: InputDecoration(
                                suffixText: '\$',
                                border: InputBorder.none,
                                hintText: 'Input Budget Cost'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: size.width - 100,
                            height: 1,
                            color: grey,
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: primary),
                            child: Center(
                              child: Icon(Icons.arrow_forward,
                                  color: Colors.white, size: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
