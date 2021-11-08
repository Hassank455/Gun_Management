import 'package:flutter/material.dart';
import 'package:gun_management/shared/cubit/cubit.dart';

class AddDataGun extends StatelessWidget {
  const AddDataGun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var permissionNumber = TextEditingController();
    var kinds = TextEditingController();
    var gunNumber = TextEditingController();
    var productAndName = TextEditingController();
    var standardCartridge = TextEditingController();

    var formKey = GlobalKey<FormState>();

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
                      child: Column(
                        children: [
                          TextFormField(
                            controller: permissionNumber,
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
                            controller: kinds,
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
                          TextFormField(
                            controller: gunNumber,
                            keyboardType: TextInputType.text,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Gun number must not be empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: '銃番号',
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: productAndName,
                            keyboardType: TextInputType.text,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Product name, etc. must not be empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: '商品名等',
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: standardCartridge,
                            keyboardType: TextInputType.text,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Standard cartridge must not be empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: '定号実包',
                            ),
                          ),
                        ],
                      )
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                    AppCubit.get(context).insertToDatabase(
                        permissionNumber: permissionNumber.text,
                        kinds: kinds.text,
                        gunNumber: gunNumber.text,
                      productAndName: productAndName.text,
                      standardCartridge: standardCartridge.text,
                    );
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
  }
}
