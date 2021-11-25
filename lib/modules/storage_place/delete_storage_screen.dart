import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/modules/storage_place/storage_place.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';

class DeleteStorageScreen extends StatefulWidget {
  String? permissionNumber;
  String? kinds;
  int? id;

  DeleteStorageScreen({this.permissionNumber, this.kinds, this.id});

  @override
  _DeleteStorageScreenState createState() => _DeleteStorageScreenState();
}

class _DeleteStorageScreenState extends State<DeleteStorageScreen> {

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
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
      if (state is AppDeleteDatabaseState) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => StoragePlace()),
            ModalRoute.withName('/'));
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
      body: Center(child: Image.asset('assets/images/image7.png')),
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
                                Text('許可番号'),
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
                                Text('種類'),
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: GestureDetector(
                  onTap: (){
                    AppCubit.get(context).deleteDataMap(id: widget.id!);
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
                          child: Center(child: Text('削除します。',style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                      Expanded(
                          flex: 1,child: Image.asset('assets/images/Trash.png')),
                    ],
                  ),
                ),
              ),
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
