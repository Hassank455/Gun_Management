import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/modules/contract_management_account_book/contract_management_account_book.dart';
import 'package:gun_management/modules/gun_list/gun_list.dart';
import 'package:gun_management/modules/information/informatio.dart';
import 'package:gun_management/modules/storage_place/storage_place.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';
import 'package:gun_management/shared/style/color.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/app_bar_icon.png'),
                  SizedBox(width: 10),
                  Text('実包管理', style: TextStyle(color: Colors.black))
                ],
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 123,
                    margin: EdgeInsets.only(left: 30, right: 30),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Image1.png'),
                        SizedBox(height: 10),
                        Text('実包受払', style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => GunList()));
                        },
                        child: Container(
                          width: 140,
                          height: 129,
                          // margin: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/image3.png'),
                              SizedBox(height: 10),
                              Text('銃',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => StoragePlace()));
                        },
                        child: Container(
                          width: 140,
                          height: 129,
                          //  margin: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/image5.png'),
                              SizedBox(width: 10),
                              Text('場所',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ContractManagementAccountBook()));
                        },
                        child: Container(
                          width: 140,
                          height: 129,
                          // margin: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/image2.png'),
                              SizedBox(height: 10),
                              Text('実包管理帳簿',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      Information()));
                        },
                        child: Container(
                          width: 140,
                          height: 129,
                          //  margin: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/image4.png'),
                              SizedBox(width: 10),
                              Text('ユーザー',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 70),
              ],
            ),
          );
        });
  }
}
