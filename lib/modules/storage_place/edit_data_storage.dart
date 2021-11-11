import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';

class EditDataStorage extends StatefulWidget {
  String? permissionNumber;
  String? kinds;
  int? id;

  EditDataStorage({this.permissionNumber, this.kinds, this.id});

  @override
  _EditDataStorageState createState() => _EditDataStorageState();
}

class _EditDataStorageState extends State<EditDataStorage> {
  var editPermissionNumber = TextEditingController();
  var editKinds = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    editPermissionNumber.text = widget.permissionNumber!;
    editKinds.text = widget.kinds!;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    editPermissionNumber.dispose();
    editKinds.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('############');
    print(widget.permissionNumber);
    print(widget.id);

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
            borderRadius: BorderRadius.circular(45),
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
                              TextFormField(
                                autofocus: true,
                                controller: editPermissionNumber,
                                keyboardType: TextInputType.text,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'title must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText:
                                      '許可番号               第                       号',
                                ),
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                autofocus: true,
                                controller: editKinds,
                                keyboardType: TextInputType.text,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'kinds must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: '種類',
                                ),
                              ),
                              SizedBox(height: 15),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        AppCubit.get(context).updateDataMap(
                          id: widget.id!,
                          permissionNumber: editPermissionNumber.text,
                          kinds: editKinds.text,
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
