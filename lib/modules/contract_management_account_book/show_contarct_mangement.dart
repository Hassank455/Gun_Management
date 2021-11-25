import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';
import 'package:intl/intl.dart';

class ShowContractManagement extends StatefulWidget {
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


  ShowContractManagement({
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
  _ShowContractManagementState createState() => _ShowContractManagementState();
}

class _ShowContractManagementState extends State<ShowContractManagement> {
  bool isClicked = true;
  Color color = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color textColor = Colors.black;
  Color textColor2 = Colors.black;
  Color textColor3 = Colors.black;
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    print(widget.permissionNumber);
    print(widget.storageName);
    print(widget.title);
    print('#############');

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          /*var tasks = AppCubit.get(context).newTasks;
          var tasks2 = AppCubit.get(context).doneTasks;*/
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text('${widget.standardCartridge ?? ''} 番', style: TextStyle(color: Colors.black)),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 40),
                    child: Row(
                      children: [
                        Text('期間：'),
                        SizedBox(width: 5),
                        Text('${DateFormat("yyyy/MM/dd").format(DateTime.now())}'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Divider(
                      color: Colors.grey[400],
                      thickness: 2,
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Row(
                      children: [
                        Text('住所：'),
                        SizedBox(width: 5),
                        Text(widget.addressUser ?? ''),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 15),
                    child: Row(
                      children: [
                        Text('氏名：'),
                        SizedBox(width: 5),
                        Text(widget.fullName ?? ''),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 15),
                    child: Row(
                      children: [
                        Text('電話番号：'),
                        SizedBox(width: 5),
                        Text(widget.telephoneNumber ?? ''),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Divider(
                      color: Colors.grey[400],
                      thickness: 2,
                      height: 50,
                    ),
                  ),
                  widget1(),
                  SizedBox(height: 20),
                  widget3(),
                  SizedBox(height: 20),
                  widget3(),
                  SizedBox(height: 20),
                  widget4(),
                ],
              ),
            ),
          );
        });
  }

  Widget widget1() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 480,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text('銃'),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Divider(
                color: Colors.grey[400],
                thickness: 2,
                height: 50,
              ),
            ),
            widget2(),
            widget2(),
            widget2(),
          ],
        ),
      ),
    );
  }

  Widget widget2() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            children: [
              Text('許可番号：'),
              Text(widget.permissionNumber ?? ''),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            children: [
              Text('銃番号：'),
              Text(widget.gunNumber ?? ''),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            children: [
              Text('商品名等：'),
              Text(widget.productAndName ?? ''),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Divider(
            color: Colors.grey[400],
            thickness: 2,
            height: 30,
          ),
        ),
      ],
    );
  }

  Widget widget3() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text('受先一覧'),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Divider(
                color: Colors.grey[400],
                thickness: 2,
                height: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.fullName ?? ''),
                  SizedBox(width: 10),
                  Text(widget.addressUser ?? ''),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Divider(
                color: Colors.grey[400],
                thickness: 2,
                height: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.storageName ?? ''),
                      SizedBox(height: 15),
                      Text(widget.storageName ?? ''),
                      SizedBox(height: 15),
                      Text(widget.storageName ?? ''),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.address ?? ''),
                      SizedBox(height: 15),
                      Text(widget.address ?? ''),
                      SizedBox(height: 15),
                      Text(widget.address ?? ''),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Divider(
                color: Colors.grey[400],
                thickness: 2,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget widget4() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 920,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text('受払一覧'),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 240,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
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
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12)),
                                  color:
                                  (isClicked = true) ? color : Colors.white,
                                  border: Border.all(color: Colors.blue)),
                              width: 80,

                              child: Center(
                                  child: Text(
                                    '許可',
                                    style: TextStyle(
                                      color: (isClicked = true)
                                          ? textColor
                                          : Colors.black,
                                    ),
                                  )))),
                      GestureDetector(
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
                                color:
                                (isClicked = true) ? color2 : Colors.white,
                                border: Border.all(color: Colors.blue)),
                            width: 80,

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
                      GestureDetector(
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
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                  color: (isClicked = true)
                                      ? color3
                                      : Colors.white,
                                  border: Border.all(color: Colors.blue)),
                              width: 75,

                              child: Center(
                                  child: Text(
                                    '有害駆除',
                                    style: TextStyle(
                                        color: (isClicked = true)
                                            ? textColor3
                                            : Colors.black),
                                  )))),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: {
                  1: FlexColumnWidth(.25),
                  2: FlexColumnWidth(.25),
                  3: FlexColumnWidth(.25)
                },
                children: [
                  TableRow(children: [
                    Container(
                      height: 50,
                      width: 150,
                      child: Center(
                        child: Text('適用'),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Text('受'),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Text('払'),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Text('残'),
                      ),
                    ),
                  ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: {
                  1: FlexColumnWidth(.25),
                  2: FlexColumnWidth(.25),
                  3: FlexColumnWidth(.25)
                },
                children: [
                  TableRow(children: [
                    WidgetTable1(),
                    Container(
                      height: 150,
                      width: 150,
                      child: Center(child: Text('100')),
                    ),
                    Container(),
                    Container(
                      height: 150,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('125'),
                            SizedBox(height: 10),
                            Text('500'),
                          ],
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: {
                  1: FlexColumnWidth(.25),
                  2: FlexColumnWidth(.25),
                  3: FlexColumnWidth(.25)
                },
                children: [
                  TableRow(children: [
                  WidgetTable1(),
                    Container(
                      height: 150,
                      width: 150,
                    ),
                    Container(),
                    Container(
                      height: 150,
                      width: 150,
                    ),
                  ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: {
                  1: FlexColumnWidth(.25),
                  2: FlexColumnWidth(.25),
                  3: FlexColumnWidth(.25)
                },
                children: [
                  TableRow(children: [
                    WidgetTable1(),
                    Container(
                      height: 150,
                      width: 150,
                    ),
                    Container(),
                    Container(
                      height: 150,
                      width: 150,
                    ),
                  ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: {
                  1: FlexColumnWidth(.25),
                  2: FlexColumnWidth(.25),
                  3: FlexColumnWidth(.25)
                },
                children: [
                  TableRow(children: [
                    WidgetTable1(),
                    Container(
                      height: 150,
                      width: 150,
                    ),
                    Container(),
                    Container(
                      height: 150,
                      width: 150,
                    ),
                  ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: {
                  1: FlexColumnWidth(.25),
                  2: FlexColumnWidth(.25),
                  3: FlexColumnWidth(.25)
                },
                children: [
                  TableRow(children: [
                    WidgetTable1(),
                    Container(
                      height: 150,
                      width: 150,
                    ),
                    Container(),
                    Container(
                      height: 150,
                      width: 150,
                    ),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget WidgetTable1() {
    return Container(
      height: 150,
      width: 150,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${DateFormat("yyyy/MM/dd").format(DateTime.now())}'),
            SizedBox(height: 10),
            Text('許可'),
            SizedBox(height: 10),
            Text(widget.storageName ?? ''),
            SizedBox(height: 10),
            Text(widget.address ?? ''),
          ],
        ),
      ),
    );
  }
}
