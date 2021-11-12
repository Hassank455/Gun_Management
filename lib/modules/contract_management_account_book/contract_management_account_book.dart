import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/modules/contract_management_account_book/show_contarct_mangement.dart';
import 'package:gun_management/shared/comonenets/comonenets.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';

class ContractManagementAccountBook extends StatelessWidget {
  const ContractManagementAccountBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
    builder: (context, state){
    var tasks = AppCubit.get(context).newTasks;
    /*var tasks2 = AppCubit.get(context).informationTasks;*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('実包管理帳簿', style: TextStyle(color: Colors.black)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35,right: 35),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('適合実包リスト'),
                Divider(color: Colors.grey[400],thickness: 2),
              ],
            ),
          ),
          tasksBuilderScreen4(
            tasks: tasks,
          ),
        ],
      ),
    );});
  }
}
