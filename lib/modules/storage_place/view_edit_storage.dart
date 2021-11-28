import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/modules/storage_place/delete_storage_screen.dart';
import 'package:gun_management/modules/storage_place/edit_data_storage.dart';
import 'package:gun_management/modules/storage_place/storage_place.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';
import 'package:gun_management/shared/style/color.dart';

class ViewDataStorage extends StatefulWidget {
  String? permissionNumber;
  String? kinds;
  int? id;

  ViewDataStorage({this.permissionNumber, this.kinds, this.id});

  @override
  _ViewDataStorageState createState() => _ViewDataStorageState();
}

class _ViewDataStorageState extends State<ViewDataStorage> {
  var editStorageName = TextEditingController();
  var editAddress = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    editStorageName.text = widget.permissionNumber ?? 'null';
    editAddress.text = widget.kinds ?? 'null';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    editStorageName.dispose();
    editAddress.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AppDeleteDatabaseState) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => StoragePlace()),
            ModalRoute.withName('/'));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('銃追加', style: TextStyle(color: Colors.black)),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
        ),
        body: Center(child: Image.asset('assets/images/image7.png')),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(45), topLeft: Radius.circular(45)),
          ),
          height: 580,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  '追加',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      SizedBox(height: 40),
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('保管庫名称'),
                                  Container(
                                    width: 200,
                                    child: Text(editStorageName.text),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('住所'),
                                  Container(
                                    width: 200,
                                    child: Text(editAddress.text),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            /*Navigator.push(context,
                              MaterialPageRoute(builder: (_) => DeleteStorageScreen(
                                permissionNumber: widget.permissionNumber,
                                kinds: widget.kinds,
                                id: widget.id,
                              )));*/
                            showDialog<void>(
                              context: context,
                              //  barrierDismissible: false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  //   title: const Text('警告の手紙'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        SizedBox(height: 10),
                                        Text('消去してもよろしいですか？ '),
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
                                      child: const Text('はい',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        AppCubit.get(context)
                                            .deleteDataMap(id: widget.id!);
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('キャンセル',
                                          style:
                                              TextStyle(color: Colors.black)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Image.asset('assets/images/Trash.png')),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditDataStorage(
                                    id: widget.id,
                                    kinds: widget.kinds,
                                    permissionNumber: widget.permissionNumber,
                                  )));
                      /*if (formKey.currentState!.validate()) {
                      AppCubit.get(context).updateDataMap(
                        id: widget.id!,
                        storageName: editStorageName.text,
                        address: editAddress.text,
                      );
                    }*/
                    },
                    child: Image.asset('assets/images/image_edit.png')),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
