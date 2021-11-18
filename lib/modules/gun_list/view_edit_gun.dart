import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/modules/gun_list/edit_data_gun.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';

class ViewEdit extends StatefulWidget {
  String? permissionNumber;
  String? kinds;
  String? gunNumber;
  String? productAndName;
  String? standardCartridge;
  int? id;

  ViewEdit(
      {this.permissionNumber,
      this.kinds,
      this.gunNumber,
      this.productAndName,
      this.standardCartridge,
      this.id});

  @override
  _ViewEditState createState() => _ViewEditState();
}

class _ViewEditState extends State<ViewEdit> {
  var editPermissionNumber = TextEditingController();

  var editKinds = TextEditingController();

  var editGunNumber = TextEditingController();

  var editProductAndName = TextEditingController();

  var editStandardCartridge = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    editPermissionNumber.text = widget.permissionNumber ?? 'null';
    editKinds.text = widget.kinds ?? 'null';
    editGunNumber.text = widget.gunNumber ?? 'null';
    editProductAndName.text = widget.productAndName ?? 'null';
    editStandardCartridge.text = widget.standardCartridge ?? 'null';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    editPermissionNumber.dispose();
    editKinds.dispose();
    editGunNumber.dispose();
    editProductAndName.dispose();
    editStandardCartridge.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('############');
    print(widget.permissionNumber);
    print(widget.id);

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
        body: Center(child: Image.asset('assets/images/image6.png')),
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
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(flex: 1, child: Text('許可番号')),
                                  Expanded(
                                    flex: 2,
                                    child: Text(editPermissionNumber.text),
                                    /*child: TextFormField(
                                      autofocus: true,
                                      controller: editPermissionNumber,
                                      keyboardType: TextInputType.text,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return '許可番号 空であってはなりません ';
                                        }
                                        return null;
                                      },
                                    ),*/
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(flex: 1, child: Text('種類')),
                                  Expanded(
                                    flex: 2,
                                    child: Text(editKinds.text),
                                   /* child: TextFormField(
                                      controller: editKinds,
                                      keyboardType: TextInputType.text,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return '種類 空であってはなりません ';
                                        }
                                        return null;
                                      },
                                    ),*/
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(flex: 1, child: Text('銃番号')),
                                  Expanded(
                                    flex: 2,
                                    child: Text(editGunNumber.text),
                                    /*child: TextFormField(
                                      controller: editGunNumber,
                                      keyboardType: TextInputType.text,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return '銃番号 空であってはなりません ';
                                        }
                                        return null;
                                      },
                                    ),*/
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(flex: 1, child: Text('商品名等')),
                                  Expanded(
                                    flex: 2,
                                    child: Text(editProductAndName.text),
                                    /*child: TextFormField(
                                      controller: editProductAndName,
                                      keyboardType: TextInputType.text,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return '商品名等 空であってはなりません ';
                                        }
                                        return null;
                                      },
                                    ),*/
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(flex: 1, child: Text('定号実包')),
                                  Expanded(
                                    flex: 2,
                                    child: Text(editStandardCartridge.text),
                                    /*child: TextFormField(
                                      controller: editStandardCartridge,
                                      keyboardType: TextInputType.text,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return '定号実包 空であってはなりません ';
                                        }
                                        return null;
                                      },
                                    ),*/
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 35),
                GestureDetector(
                    onTap: () {
                      /*if (formKey.currentState!.validate()) {
                        AppCubit.get(context).updateData(
                          id: id!,
                          permissionNumber: editPermissionNumber.text,
                          gunNumber: editGunNumber.text,
                          kinds: editKinds.text,
                          productAndName: editProductAndName.text,
                          standardCartridge: editStandardCartridge.text,
                        );
                      }*/
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => EditDataGun(
                            permissionNumber: widget.permissionNumber,
                            standardCartridge: widget.standardCartridge,
                            productAndName: widget.productAndName,
                            gunNumber: widget.gunNumber,
                            kinds: widget.kinds,
                            id: widget.id,
                          )));
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
  }
}
