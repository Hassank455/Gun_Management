import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';

class ShowContractManagement extends StatelessWidget {
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
  Widget build(BuildContext context) {
    print(id);
    print(permissionNumber);
    print(storageName);
    print(title);
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
              title: Text('実包管理帳簿', style: TextStyle(color: Colors.black)),
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
                        Text('平成30年10月1日～令和３年10月26日'),
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
                        Text('○○○○'),
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
                        Text('○○○ ○○○○'),
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
                        Text('○○○ ○○○○'),
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
              Text('○○○○'),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            children: [
              Text('銃番号：'),
              Text('○○○○'),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            children: [
              Text('商品名等：'),
              Text('○○○○'),
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
                  Text('名称'),
                  SizedBox(width: 10),
                  Text('所在地'),
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
                      Text('○○銃砲店'),
                      SizedBox(height: 15),
                      Text('東京都中央区'),
                      SizedBox(height: 15),
                      Text('○○銃砲店'),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('東京都中央区'),
                      SizedBox(height: 15),
                      Text('千葉県成田市酒井'),
                      SizedBox(height: 15),
                      Text('東京都中央区'),
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
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('許可'),
                  Text('無許可'),
                  Text('有害駆除'),
                ],
              ),
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
                    Container(
                      height: 150,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('令和3年10月２９日'),
                            SizedBox(height: 10),
                            Text('許可'),
                            SizedBox(height: 10),
                            Text('○○銃砲店'),
                            SizedBox(height: 10),
                            Text('○○銃砲店'),
                          ],
                        ),
                      ),
                    ),
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
                    Container(
                      height: 150,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('令和3年10月２９日'),
                            SizedBox(height: 10),
                            Text('許可'),
                            SizedBox(height: 10),
                            Text('○○銃砲店'),
                            SizedBox(height: 10),
                            Text('○○銃砲店'),
                          ],
                        ),
                      ),
                    ),
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
                    Container(
                      height: 150,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('令和3年10月２９日'),
                            SizedBox(height: 10),
                            Text('許可'),
                            SizedBox(height: 10),
                            Text('○○銃砲店'),
                            SizedBox(height: 10),
                            Text('○○銃砲店'),
                          ],
                        ),
                      ),
                    ),
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
                    Container(
                      height: 150,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('令和3年10月２９日'),
                            SizedBox(height: 10),
                            Text('許可'),
                            SizedBox(height: 10),
                            Text('○○銃砲店'),
                            SizedBox(height: 10),
                            Text('○○銃砲店'),
                          ],
                        ),
                      ),
                    ),
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
                    Container(
                      height: 150,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('令和3年10月２９日'),
                            SizedBox(height: 10),
                            Text('許可'),
                            SizedBox(height: 10),
                            Text('○○銃砲店'),
                            SizedBox(height: 10),
                            Text('○○銃砲店'),
                          ],
                        ),
                      ),
                    ),
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
}
