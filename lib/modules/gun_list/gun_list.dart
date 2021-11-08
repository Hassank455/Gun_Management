import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/shared/comonenets/comonenets.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:gun_management/shared/cubit/states.dart';

import 'add_data_gun.dart';

class GunList extends StatelessWidget {
  const GunList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state){
        var tasks = AppCubit.get(context).newTasks;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text('実包管理', style: TextStyle(color: Colors.black)),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>AddDataGun()));
            },
            child: Icon(
              Icons.add,
              color: Colors.blue,
              size: 50,
            ),
            backgroundColor: Colors.white,
          ),
          body: tasksBuilder(
            tasks: tasks,
          ),

        );
      }

    );
  }
}
