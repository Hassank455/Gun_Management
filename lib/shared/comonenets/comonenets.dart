import 'package:flutter/material.dart';
import 'package:gun_management/modules/gun_list/edit_data_gun.dart';
import 'package:gun_management/modules/information/edit_data_information.dart';
import 'package:gun_management/modules/storage_place/edit_data_storage.dart';
import 'package:gun_management/shared/cubit/cubit.dart';

Widget buildTaskItem(Map model, context) => GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => EditDataGun(
          permissionNumber: model['permissionNumber'],
          kinds: model['kinds'],
          gunNumber: model['gunNumber'],
          productAndName: model['productAndName'],
          standardCartridge: model['standardCartridge'],
          id: model['id'],)));
      },
      child: Dismissible(
        key: Key(model['id'].toString()),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model['permissionNumber']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${model['kinds']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              /*   IconButton(
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'done',
                    id: model['id'],
                  );
                },
                icon: Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'archive',
                    id: model['id'],
                  );
                },
                icon: Icon(
                  Icons.archive,
                  color: Colors.black45,
                ),
              ),*/
            ],
          ),
        ),

      ),
    );

Widget tasksBuilder({
  required List<Map> tasks,
}) =>
    (tasks.length > 0)
        ? ListView.separated(
            itemBuilder: (context, index) {
              return buildTaskItem(tasks[index], context);
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            itemCount: tasks.length,
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  size: 100.0,
                  color: Colors.grey,
                ),
                Text(
                  'No Note Yet, Please Add Some Note',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );

//////////////////////////////


Widget buildTaskItemMap(Map model, context) => GestureDetector(
  onTap: () {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => EditDataStorage(
      permissionNumber: model['permissionNumber'],
      kinds: model['kinds'],
      id: model['id'],)));
  },
  child: Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['permissionNumber']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['kinds']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          /*   IconButton(
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'done',
                    id: model['id'],
                  );
                },
                icon: Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'archive',
                    id: model['id'],
                  );
                },
                icon: Icon(
                  Icons.archive,
                  color: Colors.black45,
                ),
              ),*/
        ],
      ),
    ),

  ),
);

Widget tasksBuilderMap({
  required List<Map> tasks,
}) =>
    (tasks.length > 0)
        ? ListView.separated(
      itemBuilder: (context, index) {
        return buildTaskItemMap(tasks[index], context);
      },
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
        ),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        ),
      ),
      itemCount: tasks.length,
    )
        : Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            size: 100.0,
            color: Colors.grey,
          ),
          Text(
            'No Note Yet, Please Add Some Note',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );

Widget buildTaskItemInformation(Map model, context) => GestureDetector(
  onTap: () {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => EditDataInformation(
      permissionNumber: model['permissionNumber'],
      kinds: model['kinds'],
      gunNumber: model['gunNumber'],
      productAndName: model['productAndName'],
      standardCartridge: model['standardCartridge'],
      id: model['id'],)));
  },
  child: Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['permissionNumber']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['kinds']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['gunNumber']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['productAndName']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['standardCartridge']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          /*   IconButton(
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'done',
                    id: model['id'],
                  );
                },
                icon: Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'archive',
                    id: model['id'],
                  );
                },
                icon: Icon(
                  Icons.archive,
                  color: Colors.black45,
                ),
              ),*/
        ],
      ),
    ),

  ),
);

Widget tasksBuilderInformation({
  required List<Map> tasks,
}) =>
    (tasks.length > 0)
        ? ListView.separated(
      itemBuilder: (context, index) {
        return buildTaskItemInformation(tasks[index], context);
      },
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
        ),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        ),
      ),
      itemCount: tasks.length,
    )
        : Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            size: 100.0,
            color: Colors.grey,
          ),
          Text(
            'No Note Yet, Please Add Some Note',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );