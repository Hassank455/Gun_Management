import 'package:flutter/material.dart';
import 'package:gun_management/modules/cartridge_receipt_and_payment/payment_editing.dart';
import 'package:gun_management/modules/contract_management_account_book/show_contarct_mangement.dart';
import 'package:gun_management/modules/gun_list/edit_data_gun.dart';
import 'package:gun_management/modules/gun_list/view_edit_gun.dart';
import 'package:gun_management/modules/information/edit_data_information.dart';
import 'package:gun_management/modules/storage_place/edit_data_storage.dart';
import 'package:gun_management/modules/storage_place/view_edit_storage.dart';
import 'package:gun_management/shared/cubit/cubit.dart';
import 'package:intl/intl.dart';

Widget buildTaskItem(Map model, context) => GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ViewEdit(
                      permissionNumber: model['permissionNumber'],
                      kinds: model['kinds'],
                      gunNumber: model['gunNumber'],
                      productAndName: model['productAndName'],
                      standardCartridge: model['standardCartridge'],
                      id: model['id'],
                    )));
        /*Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => EditDataGun(
                      permissionNumber: model['permissionNumber'],
                      kinds: model['kinds'],
                      gunNumber: model['gunNumber'],
                      productAndName: model['productAndName'],
                      standardCartridge: model['standardCartridge'],
                      id: model['id'],
                    )));*/
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
            context,
            MaterialPageRoute(
                builder: (_) => ViewDataStorage(
                      permissionNumber: model['storageName'],
                      kinds: model['address'],
                      id: model['id'],
                    )));
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
                      '${model['storageName']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${model['address']}',
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
            context,
            MaterialPageRoute(
                builder: (_) => EditDataInformation(
                      permissionNumber: model['user'],
                      kinds: model['title'],
                      gunNumber: model['fullName'],
                      productAndName: model['telephoneNumber'],
                      standardCartridge: model['addressUser'],
                      id: model['id'],
                    )));
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
                      '${model['user']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${model['title']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${model['fullName']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${model['telephoneNumber']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${model['addressUser']}',
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

Widget buildTaskItemScreen4(Map model, context) => GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ShowContractManagement(
                      id: model['id'],
                      permissionNumber: model['permissionNumber'],
                      kinds: model['kinds'],
                      gunNumber: model['gunNumber'],
                      productAndName: model['productAndName'],
                      standardCartridge: model['standardCartridge'],
                      address: model['address'],
                      title: model['title'],
                      addressUser: model['addressUser'],
                      fullName: model['fullName'],
                      storageName: model['storageName'],
                      telephoneNumber: model['telephoneNumber'],
                      user: model['user'],
                    )));
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
                    Row(
                      children: [
                        Text(
                          '${model['permissionNumber']}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '番',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    /*Text(
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
                ),*/
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

Widget tasksBuilderScreen4({
  required List<Map> tasks,
}) =>
    (tasks.length > 0)
        ? Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return buildTaskItemScreen4(tasks[index], context);
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
            ),
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

Widget buildTaskItemCartidge(Map? model, context) => GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PaymentEditing(
                      permissionNumber: model?['permissionNumber'] ?? 'null',
                      kinds: model?['kinds'] ?? 'null',
                      gunNumber: model?['gunNumber'] ?? 'null',
                      productAndName: model?['productAndName'] ?? 'null',
                      standardCartridge: model?['standardCartridge'] ?? 'null',
                      id: model?['id'] ?? 'null',
                      user: model?['user'] ?? 'null',
                      telephoneNumber: model?['telephoneNumber'] ?? 'null',
                      storageName: model?['storageName'] ?? 'null',
                      fullName: model?['fullName'] ?? 'null',
                      addressUser: model?['addressUser'] ?? 'null',
                      title: model?['title'] ?? 'null',
                      address: model?['address'] ?? 'null',
                    )));
      },
      child: Dismissible(
        key: Key(model?['id'].toString() ?? ''),
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
                      '${DateFormat("yyyy/MM/dd").format(DateTime.now())}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),SizedBox(height: 7),
                    Text(
                      '無許可 ',
                      style: TextStyle(
                      ),
                    ),SizedBox(height: 7),
                    Text(
                      '消費：${model?['productAndName']}',
                      style: TextStyle(
                       // color: Colors.grey,
                      ),
                    ),SizedBox(height: 7),
                    Text('保管場所：${model?['storageName']}'),
                    SizedBox(height: 7),
                    Text('備考：米国 個人消費支出（ＰＣＥコア・デフレーター\,四半期雇用コスト指数）'),
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

Widget tasksBuilderCartidge({
  required List<Map> tasks,
}) =>
    (tasks.length > 0)
        ? ListView.separated(
            itemBuilder: (context, index) {
              return buildTaskItemCartidge(tasks[index], context);
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
