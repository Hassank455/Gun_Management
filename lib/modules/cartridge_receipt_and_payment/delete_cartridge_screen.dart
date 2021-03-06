import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';
import 'package:gun_management/shared/style/color.dart';
import 'package:intl/intl.dart';

import 'cartridge_receipt_and_payment.dart';

class DeleteCartridgeScreen extends StatefulWidget {
  int? id;
  String? address1;
  String? address2;
  String? gunProduct;
  String? compatibleCartridge;
  String? price;


  DeleteCartridgeScreen({
    this.id,
    this.address1,
    this.address2,
    this.gunProduct,
    this.compatibleCartridge,
    this.price,

  });

  @override
  _DeleteCartridgeScreenState createState() => _DeleteCartridgeScreenState();
}



class _DeleteCartridgeScreenState extends State<DeleteCartridgeScreen> {
  bool isClicked = true;
  Color color = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color textColor = Colors.black;
  Color textColor2 = Colors.black;
  Color textColor3 = Colors.black;

  TextEditingController number = TextEditingController();

  /*String? storageName2;
  String? address2;

  _PaymentEditingState(this.storageName2, this.address2);*/

  String? value1;
  String? value2;
  String? value3;

  List item = [];
  List itemAddress = [];

  List gunProductName = [];
  List compatibleCartridge = [];

  int x = 0;
  int y = 0;

  @override
  void initState() {
    var tasks = AppCubit.get(context).newTasks;
    var tasksMap = AppCubit.get(context).archivedTasks;
    tasksMap.forEach((element) {
      item.add(element['storageName'] ?? 'null');
    });
    tasksMap.forEach((element) {
      itemAddress.add(element['address'] ?? 'null');
    });
    tasks.forEach((element) {
      gunProductName.add(element['productAndName'] ?? 'null');
    });
    tasks.forEach((element) {
      compatibleCartridge.add(element['standardCartridge'] ?? 'null');
    });

    if(item.isNotEmpty){
      //value1 = widget.address1;
      value1 = item[0];
    }

    number.text = widget.price.toString();

    if(gunProductName.isNotEmpty){
      //value2 = widget.gunProduct;
      value2 = gunProductName[0];
    }
    if(compatibleCartridge.isNotEmpty){
      //value2 = widget.gunProduct;
      value3 = compatibleCartridge[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* print(gunProductName);
    print(compatibleCartridge);*/

    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AppDeleteDatabaseState) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => CartridgeReceiptAndPayment()),
            ModalRoute.withName('/'));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('??????????????????', style: TextStyle(color: Colors.black)),
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
                        '??????',
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
                        '??????',
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
                        '??????',
                        (item.isNotEmpty) ?
                        DropdownButton<String?>(
                          iconEnabledColor: Colors.white,
                          value: value1,
                          dropdownColor: Colors.grey[600],
                          onChanged: (value) {
                            setState(() {
                              this.value1 = value ?? '';
                              print(value1);
                              x = item.indexOf(value);
                              print(itemAddress[x]);
                            });
                          },
                          items: item.map<DropdownMenuItem<String?>>((value) {
                            return DropdownMenuItem(
                              child: Text(
                                value ?? 'null',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: value,
                            );
                          }).toList(),
                        ) : Container(),
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
                        '?????????',
                        Text(
                          //  widget.address ?? '',
                          (itemAddress.isNotEmpty) ? itemAddress[x] ?? 'null' : 'null',
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
                            text: '??????',
                          ),
                          Tab(
                            text: '??????',
                          ),
                          Tab(
                            text: '?????????(???)',
                          ),
                          Tab(
                            text: '?????????(???)',
                          ),
                        ]),
                  ),
                ),
                Container(
                  height: 400,
                  child: TabBarView(
                    children: [
                      widget7(),
                      widget7(visable: false,visable2: false),
                      widget7(),
                      widget7(),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: GestureDetector(
                    onTap: (){
                     // AppCubit.get(context).deleteData2(id: widget.id!);

                      showDialog<void>(
                        context: context,
                        //  barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                           // title: const Text('???????????????'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const <Widget>[
                                  SizedBox(height: 10),
                                  Text('??????????????????????????????????????? '),
                                  //Text('Would you like to approve of this message?'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      primaryColor),
                                ),
                                child: const Text('??????',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  AppCubit.get(context).deleteData2(id: widget.id!);
                                },
                              ),
                              TextButton(
                                child: const Text('???????????????',style: TextStyle(color: Colors.black)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(child: Text('??????????????????',style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                        Expanded(
                            flex: 1,child: Image.asset('assets/images/Trash.png')),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    });
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

  Widget widget7({bool? visable = true,bool? visable2 = true}) {
    return Padding(
      padding: const EdgeInsets.only(left: 42, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (visable == true)
              ? Row(
            children: [
              Expanded(flex: 1, child: Text('???')),
              // SizedBox(width: 70),
              Expanded(
                flex: 2,
                child: (gunProductName.isNotEmpty) ? DropdownButton<String?>(
                  iconEnabledColor: Colors.black,
                  value: value2 ?? '',
                  dropdownColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      this.value2 = value ?? '';
                      y = gunProductName.indexOf(value);
                    });
                  },
                  items: gunProductName
                      .map<DropdownMenuItem<String?>>((value) {
                    return DropdownMenuItem(
                      child: Text(
                        value ?? '',
                        style: TextStyle(color: Colors.black),
                      ),
                      value: value,
                    );
                  }).toList(),
                ) : Container(),
              ),
            ],
          )
              : Container(),
          (visable == true)
              ? Divider(color: Colors.grey[400], thickness: 2, height: 30)
              : Container(),
          // SizedBox(height: 10),

          Row(
            children: [
              Expanded(flex: 1, child: Text('??????')),
              //SizedBox(width: 70),
              (visable2 == true) ? Expanded(flex: 2,
                  child: Text(
                      (compatibleCartridge.isNotEmpty) ? compatibleCartridge[y] ?? 'null' : 'null')
              ) : Expanded(flex: 2,
                child: DropdownButton<String?>(
                  iconEnabledColor: Colors.black,
                  value: value3 ?? '',
                  dropdownColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      this.value3 = value ?? '';
                      y = compatibleCartridge.indexOf(value);
                    });
                  },
                  items: compatibleCartridge
                      .map<DropdownMenuItem<String?>>((value) {
                    return DropdownMenuItem(
                      child: Text(
                        value ?? '',
                        style: TextStyle(color: Colors.black),
                      ),
                      value: value,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[400], thickness: 2, height: 30),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(flex: 1, child: Text('?????????')),
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
                                      '??????',
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
                                  '?????????',
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
                                      '????????????',
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
          //  SizedBox(height: 10),
          Row(
            children: [
              Expanded(flex: 1, child: Text('??????')),
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
          // SizedBox(height: 10),
          Row(
            children: [
              Expanded(flex: 1, child: Text('??????')),
              // SizedBox(width: 70),
              Expanded(
                flex: 2,
                child: Container(
                  // width: 210,
                  child: TextFormField(
                    // controller: number,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: '?????? ?????????????????????????????????????????????????????????, ?????????????????????????????????', border: InputBorder.none),
                  ),),
              ),
            ],
          ),
          Divider(color: Colors.grey[400], thickness: 2, height: 30),
        ],
      ),
    );
  }


}
