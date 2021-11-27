import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/modules/gun_list/gun_list.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';
import 'package:gun_management/shared/style/color.dart';

class DeleteGunScreen extends StatefulWidget {
  String? permissionNumber;
  String? kinds;
  String? gunNumber;
  String? productAndName;
  String? standardCartridge;
  int? id;

  DeleteGunScreen(
      {this.permissionNumber,
        this.kinds,
        this.gunNumber,
        this.productAndName,
        this.standardCartridge,
        this.id});

  @override
  _DeleteGunScreenState createState() => _DeleteGunScreenState();
}

class _DeleteGunScreenState extends State<DeleteGunScreen> {

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

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
      if (state is AppDeleteDatabaseState) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => GunList()),
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
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: GestureDetector(
                  onTap: (){
                   // AppCubit.get(context).deleteData(id: widget.id!);

                    showDialog<void>(
                      context: context,
                      //  barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                         // title: const Text('警告の手紙'),
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
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                AppCubit.get(context).deleteData(id: widget.id!);
                              },
                            ),
                            TextButton(
                              child: const Text('キャンセル',style: TextStyle(color: Colors.black)),
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
