import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/modules/cartridge_receipt_and_payment/payment_editing.dart';
import 'package:gun_management/shared/comonenets/comonenets.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';

import 'add_cartridge_receipt.dart';

class CartridgeReceiptAndPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var tasks = AppCubit.get(context).doneTasks;
          print(tasks);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text('実包受払', style: TextStyle(color: Colors.black)),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (_)=> AddCartridgeReceipt()));
              },
              child: Icon(
                Icons.add,
                color: Colors.blue,
                size: 50,
              ),
              backgroundColor: Colors.white,
            ),
            body: tasksBuilderCartidge(
              tasks: tasks,
            ),


          );
        }
    );
  }


}
