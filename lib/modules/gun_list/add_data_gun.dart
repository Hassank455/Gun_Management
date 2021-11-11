import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';

class AddDataGun extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var permissionNumber = TextEditingController();
  var kinds = TextEditingController();
  var gunNumber = TextEditingController();
  var productAndName = TextEditingController();
  var standardCartridge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppInsertDatabaseState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
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
            //width: double.infinity,
            height: 580,
            //height: 680,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(45),
            ),

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
                      //  crossAxisAlignment: CrossAxisAlignment.start,
                      //  mainAxisAlignment: MainAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(flex: 1, child: Text('許可番号')),
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        controller: permissionNumber,
                                        keyboardType: TextInputType.text,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return '許可番号 空であってはなりません ';
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(flex: 1, child: Text('種類')),
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        controller: kinds,
                                        keyboardType: TextInputType.text,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return '種類 空であってはなりません ';
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(flex: 1, child: Text('銃番号')),
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        controller: gunNumber,
                                        keyboardType: TextInputType.text,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return '銃番号 空であってはなりません ';
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(flex: 1, child: Text('商品名等')),
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        controller: productAndName,
                                        keyboardType: TextInputType.text,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return '商品名等 空であってはなりません ';
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(flex: 1, child: Text('定号実包')),
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        controller: standardCartridge,
                                        keyboardType: TextInputType.text,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return '定号実包 空であってはなりません ';
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
                          AppCubit.get(context).insertToDatabase(
                            permissionNumber: permissionNumber.text,
                            kinds: kinds.text,
                            gunNumber: gunNumber.text,
                            productAndName: productAndName.text,
                            standardCartridge: standardCartridge.text,
                          );
                        }
                      },
                      child: Image.asset('assets/images/image_true.png')),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
