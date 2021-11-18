import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';
import 'package:gun_management/shared/style/color.dart';

class AddDataInformation extends StatelessWidget {

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
        title: Text('ユーザー情報', style: TextStyle(color: Colors.black)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: Center(child: Icon(Icons.person,color: primaryColor,size: 120,)),
      bottomNavigationBar: Container(
        //width: double.infinity,
        height: 580,
        //height: 680,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.only(topRight: Radius.circular(45),topLeft: Radius.circular(45)),
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /*Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),*/
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
                                Expanded(flex: 1, child: Text('ユーザー')),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: permissionNumber,
                                    keyboardType: TextInputType.text,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'ユーザー 空であってはなりません ';
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
                                Expanded(flex: 1, child: Text('氏名')),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: kinds,
                                    keyboardType: TextInputType.text,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return '氏名 空であってはなりません ';
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
                                    controller: gunNumber,
                                    keyboardType: TextInputType.text,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Title 空であってはなりません ';
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
                                Expanded(flex: 1, child: Text('電話番号')),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: productAndName,
                                    keyboardType: TextInputType.text,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return '電話番号 空であってはなりません ';
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
                                Expanded(flex: 1, child: Text('住所')),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: standardCartridge,
                                    keyboardType: TextInputType.text,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return '住所 空であってはなりません ';
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
                      AppCubit.get(context).insertToDatabaseInfromation(
                        user: permissionNumber.text,
                        fullName: kinds.text,
                        title: gunNumber.text,
                        telephoneNumber: productAndName.text,
                        addressUser: standardCartridge.text,
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
    );});
  }
}
