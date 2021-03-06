import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';
import 'package:gun_management/shared/style/color.dart';

class EditDataInformation extends StatefulWidget {
  String? permissionNumber;
  String? kinds;
  String? gunNumber;
  String? productAndName;
  String? standardCartridge;
  int? id;

  EditDataInformation(
      {this.permissionNumber,
        this.kinds,
        this.gunNumber,
        this.productAndName,
        this.standardCartridge,
        this.id});

  @override
  _EditDataInformationState createState() => _EditDataInformationState();
}

class _EditDataInformationState extends State<EditDataInformation> {
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
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AppUpdateDatabaseState) {
        Navigator.pop(context);
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
        body: Center(child: Icon(Icons.person,color: primaryColor,size: 120,)),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.only(topRight: Radius.circular(45),topLeft: Radius.circular(45)),
          ),
          height: 580,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
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
                                  Expanded(flex: 1, child: Text('????????????')),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      controller: editPermissionNumber,
                                      keyboardType: TextInputType.text,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return '???????????? ????????????????????????????????? ';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(flex: 1, child: Text('??????')),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      controller: editKinds,
                                      keyboardType: TextInputType.text,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return '?????? ????????????????????????????????? ';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(flex: 1, child: Text('Title')),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      controller: editGunNumber,
                                      keyboardType: TextInputType.text,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Title ????????????????????????????????? ';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(flex: 1, child: Text('????????????')),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      controller: editProductAndName,
                                      keyboardType: TextInputType.text,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return '???????????? ????????????????????????????????? ';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(flex: 1, child: Text('??????')),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      controller: editStandardCartridge,
                                      keyboardType: TextInputType.text,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return '?????? ????????????????????????????????? ';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        AppCubit.get(context).updateDataInformation(
                          id: widget.id!,
                          user: editPermissionNumber.text,
                          fullName: editGunNumber.text,
                          title: editKinds.text,
                          telephoneNumber: editProductAndName.text,
                          addressUser: editStandardCartridge.text,
                        );
                      }
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
