import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/style/color.dart';
import 'package:intl/intl.dart';

class PaymentEditing extends StatefulWidget {
  int? id;
  String? permissionNumber;
  String? gunNumber;
  String? productAndName;
  String? kinds;
  String? standardCartridge;

  String? storageName;
  String? address;

  String? user;
  String? fullName;
  String? title;
  String? telephoneNumber;
  String? addressUser;

  PaymentEditing({
    this.permissionNumber,
    this.gunNumber,
    this.productAndName,
    this.id,
    this.kinds,
    this.standardCartridge,
    this.storageName,
    this.address,
    this.user,
    this.title,
    this.addressUser,
    this.fullName,
    this.telephoneNumber,
  });

  @override
  _PaymentEditingState createState() => _PaymentEditingState();
}

class _PaymentEditingState extends State<PaymentEditing> {
  bool isClicked = true;
  Color color = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color textColor = Colors.black;
  Color textColor2 = Colors.black;
  Color textColor3 = Colors.black;

  var number = TextEditingController();

  /*String? storageName2;
  String? address2;

  _PaymentEditingState(this.storageName2, this.address2);*/

  String? value1;

  List item = [];

  List itemAddress = [];

  int x = 0;


  @override
  void initState() {
    var tasks = AppCubit.get(context).newTasks;
    tasks.forEach((element) {
      item.add(element['storageName']);
    });
    tasks.forEach((element) {
      itemAddress.add(element['address']);
    });

    value1 = item[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('実包受払編集', style: TextStyle(color: Colors.black)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                color: primaryColor,
                height: 258,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    widget6(
                      '日付',
                      Text(
                        '${DateFormat("yyyy/MM/dd").format(DateTime.now())}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.black12,
                        thickness: 2,
                        height: 30,
                      ),
                    ),
                    widget6(
                      '時刻',
                      Text(
                        '${DateFormat("hh:mm").format(DateTime.now())}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.black12,
                        thickness: 2,
                        height: 30,
                      ),
                    ),
                    widget6(
                      '場所',
                      DropdownButton<String?>(
                        iconEnabledColor: Colors.white,
                        value: value1,
                        dropdownColor: Colors.grey[600],
                        onChanged: (value) {
                          setState(() {
                            this.value1 = value ?? '';
                            x = item.indexOf(value);
                          });
                        },
                        items: item.map<DropdownMenuItem<String?>>((value) {
                          return DropdownMenuItem(
                            child: Text(
                              value ?? '',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: value,
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.black12,
                        thickness: 2,
                        height: 30,
                      ),
                    ),

                    widget6(
                      '所在地',
                      Text(
                      //  widget.address ?? '',
                          itemAddress[x] ?? '',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.black12,
                        thickness: 2,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TabBar(
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(
                          text: '消費',
                        ),
                        Tab(
                          text: '譲受',
                        ),
                        Tab(
                          text: 'その他(受)',
                        ),
                        Tab(
                          text: 'その他(払)',
                        ),
                      ]),
                ),
              ),
              Container(
                height: 500,
                child: TabBarView(
                  children: [
                    widget7(),
                    widget7(visable: false),
                    widget7(),
                    widget7(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widget6(String text1, Widget widget) {
    return Padding(
      padding: const EdgeInsets.only(left: 42, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              text1,
              style: TextStyle(color: Colors.white),
            ),
          ),
          // SizedBox(width: 40),
          Expanded(
            flex: 2,
            child: widget,
          ),
        ],
      ),
    );
  }

  Widget widget7({bool? visable = true}) {
    return Padding(
      padding: const EdgeInsets.only(left: 42, top: 50, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (visable == true)
              ? Row(
                  children: [
                    Text('銃'),
                    SizedBox(width: 70),
                    Text(widget.productAndName ?? ''),
                  ],
                )
              : Container(),
          (visable == true)
              ? Divider(color: Colors.grey[400], thickness: 2, height: 30)
              : Container(),
          SizedBox(height: 20),
          Row(
            children: [
              Text('実包'),
              SizedBox(width: 70),
              Text(widget.standardCartridge ?? ''),
            ],
          ),
          Divider(color: Colors.grey[400], thickness: 2, height: 30),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(flex: 1, child: Text('譲受別')),
              Expanded(
                flex: 2,
                child: Container(
                  // width: 210,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.blue)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClicked = !isClicked;
                                color = Colors.blue;
                                color2 = Colors.white;
                                color3 = Colors.white;
                                textColor = Colors.white;
                                textColor2 = Colors.black;
                                textColor3 = Colors.black;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        bottomLeft: Radius.circular(7)),
                                    color: (isClicked = true)
                                        ? color
                                        : Colors.white,
                                    border: Border.all(color: Colors.blue)),
                                // width: 75,
                                child: Center(
                                    child: Text(
                                  '許可',
                                  style: TextStyle(
                                    color: (isClicked = true)
                                        ? textColor
                                        : Colors.black,
                                  ),
                                )))),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isClicked = !isClicked;
                              color2 = Colors.blue;
                              color = Colors.white;
                              color3 = Colors.white;
                              textColor = Colors.black;
                              textColor2 = Colors.white;
                              textColor3 = Colors.black;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: (isClicked = true)
                                      ? color2
                                      : Colors.white,
                                  border: Border.all(color: Colors.blue)),
                              // width: 75,
                              child: Center(
                                child: Text(
                                  '無許可',
                                  style: TextStyle(
                                    color: (isClicked = true)
                                        ? textColor2
                                        : Colors.black,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClicked = !isClicked;
                                color3 = Colors.blue;
                                color2 = Colors.white;
                                color = Colors.white;
                                textColor = Colors.black;
                                textColor2 = Colors.black;
                                textColor3 = Colors.white;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(7),
                                        bottomRight: Radius.circular(7)),
                                    color: (isClicked = true)
                                        ? color3
                                        : Colors.white,
                                    border: Border.all(color: Colors.blue)),
                                //width: 75,
                                child: Center(
                                    child: Text(
                                  '有害駆除',
                                  style: TextStyle(
                                      color: (isClicked = true)
                                          ? textColor3
                                          : Colors.black),
                                )))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[400], thickness: 2, height: 30),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(flex: 1, child: Text('数量')),
              //  SizedBox(width: 70),
              Expanded(
                flex: 2,
                child: Container(
                  child: TextFormField(
                    controller: number,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: '0', border: InputBorder.none),
                  ),
                ),
              )
            ],
          ),
          Divider(color: Colors.grey[400], thickness: 2, height: 30),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(flex: 1, child: Text('備考')),
              // SizedBox(width: 70),
              Expanded(
                flex: 2,
                child: Container(
                    // width: 210,
                    child: Text(
                  '米国 個人消費支出（ＰＣＥコア・デフレーター, 四半期雇用コスト指数）',
                )),
              ),
            ],
          ),
          Divider(color: Colors.grey[400], thickness: 2, height: 30),
        ],
      ),
    );
  }
}
