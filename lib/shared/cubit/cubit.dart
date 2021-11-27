import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gun_management/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
/*

  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
*/

  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> informationTasks = [];
  List<Map> archivedTasks = [];

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {

        print('database created');
        // gun Table
        database
            .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, permissionNumber TEXT, kinds TEXT, gunNumber TEXT, productAndName TEXT, standardCartridge TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
        // Storage Table
        database
            .execute(
            'CREATE TABLE storage (id INTEGER PRIMARY KEY, storageName TEXT, address TEXT)')
            .then((value) {
          print('storage table created');
        }).catchError((error) {
          print('Error When Creating Table2 ${error.toString()}');
        });
        // Information Table
        database
            .execute(
            'CREATE TABLE information (id INTEGER PRIMARY KEY, user TEXT, fullName TEXT, title TEXT, telephoneNumber TEXT, addressUser TEXT)')
            .then((value) {
          print('Information table created');
        }).catchError((error) {
          print('Error When Creating Table2 ${error.toString()}');
        });
        // payment Table
        database
            .execute(
            'CREATE TABLE payment (id INTEGER PRIMARY KEY, address1 TEXT, address2 TEXT, gunProduct TEXT, compatibleCartridge TEXT, price TEXT, note TEXT)')
            .then((value) {
          print('table2 created');
        }).catchError((error) {
          print('Error When Creating Table2 ${error.toString()}');
        });

      },
      onOpen: (database)
      {
        getDataFromDatabase(database);
        getDataFromDatabase2(database);
        getDataFromDatabaseInformation(database);
        getDataFromDatabaseMap(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  Future insertToDatabase({
     String? permissionNumber,
     String? kinds,
     String? gunNumber,
     String? productAndName,
     String? standardCartridge,
  }) async {
     await database!.transaction((txn)async {
      await txn
          .rawInsert(
        'INSERT INTO tasks(permissionNumber, kinds, gunNumber, productAndName, standardCartridge, status) VALUES("$permissionNumber", "$kinds", "$gunNumber", "$productAndName", "$standardCartridge", "new")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
        getDataFromDatabase2(database);
        getDataFromDatabaseInformation(database);
        getDataFromDatabaseMap(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

    //  return null;
    });
  }


  Future insertToDatabaseTable2({
    String? address1,
    String? address2,
    String? gunProduct,
    String? compatibleCartridge,
    String? price,
    String? note,
  }) async {
    await database!.transaction((txn)async {
      await txn
          .rawInsert(
        'INSERT INTO payment(address1, address2, gunProduct, compatibleCartridge, price, note) VALUES("$address1", "$address2", "$gunProduct", "$compatibleCartridge", "$price", "$note")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
        getDataFromDatabase2(database);
        getDataFromDatabaseInformation(database);
        getDataFromDatabaseMap(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      //  return null;
    });
  }

  Future insertToDatabaseMap({
    String? storageName,
    String? address,
  }) async {
    await database!.transaction((txn)async {
      await txn
          .rawInsert(
        'INSERT INTO storage(storageName, address) VALUES("$storageName", "$address")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
        getDataFromDatabase2(database);
        getDataFromDatabaseInformation(database);
        getDataFromDatabaseMap(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      //  return null;
    });
  }

  Future insertToDatabaseInfromation({
    String? user,
    String? fullName,
    String? title,
    String? telephoneNumber,
    String? addressUser,
  }) async {
    await database!.transaction((txn)async {
      await txn
          .rawInsert(
        'INSERT INTO information(user, fullName, title, telephoneNumber, addressUser) VALUES("$user", "$fullName", "$title", "$telephoneNumber", "$addressUser")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
        getDataFromDatabase2(database);
        getDataFromDatabaseInformation(database);
        getDataFromDatabaseMap(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      //  return null;
    });
  }

  void getDataFromDatabase(database)
  {
    newTasks = [];
    doneTasks = [];
  //  informationTasks = [];
  //  archivedTasks = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element)
      {
        if(element['status'] == 'new')
          newTasks.add(element);
        else if(element['status'] == 'done')
          doneTasks.add(element);
        else if(element['status'] == 'information')
          informationTasks.add(element);
        else archivedTasks.add(element);
      });

      emit(AppGetDatabaseState());
    });
  }

  void getDataFromDatabase2(database)
  {

    doneTasks = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM payment').then((value) {

      value.forEach((element)
      {
          doneTasks.add(element);
      });

      emit(AppGetDatabaseState());
    });
  }

  void getDataFromDatabaseInformation(database)
  {

    informationTasks = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM information').then((value) {

      value.forEach((element)
      {
        informationTasks.add(element);
      });

      emit(AppGetDatabaseState());
    });
  }

  void getDataFromDatabaseMap(database)
  {

    archivedTasks = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM storage').then((value) {

      value.forEach((element)
      {
        archivedTasks.add(element);
      });

      emit(AppGetDatabaseState());
    });
  }

  void updateData({
    String? permissionNumber,
    String? kinds,
    String? gunNumber,
    String? productAndName,
    String? standardCartridge,
    required int id,
  }) async
  {
    database!.rawUpdate(
      'UPDATE tasks SET permissionNumber = ?, kinds = ?, gunNumber = ?, productAndName = ?, standardCartridge = ? WHERE id = ?',
      ['$permissionNumber', '$kinds', '$gunNumber', '$productAndName', '$standardCartridge', id],
    ).then((value)
    {
      getDataFromDatabase(database);
      getDataFromDatabase2(database);
      getDataFromDatabaseInformation(database);
      getDataFromDatabaseMap(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void updateData2({
    String? address1,
    String? address2,
    String? gunProduct,
    String? compatibleCartridge,
    String? price,
    String? note,
    required int id,
  }) async
  {
    database!.rawUpdate(
      'UPDATE payment SET address1 = ?, address2 = ?, gunProduct = ?, compatibleCartridge = ?, price = ?, note = ? WHERE id = ?',
      ['$address1', '$address2', '$gunProduct', '$compatibleCartridge', '$price', '$note', id],
    ).then((value)
    {
      getDataFromDatabase(database);
      getDataFromDatabase2(database);
      getDataFromDatabaseInformation(database);
      getDataFromDatabaseMap(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void updateDataMap({
    String? storageName,
    String? address,
    required int id,
  }) async
  {
    database!.rawUpdate(
      'UPDATE storage SET storageName = ?, address = ? WHERE id = ?',
      ['$storageName', '$address', id],
    ).then((value)
    {
      getDataFromDatabase(database);
      getDataFromDatabase2(database);
      getDataFromDatabaseInformation(database);
      getDataFromDatabaseMap(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void updateDataInformation({
    String? user,
    String? fullName,
    String? title,
    String? telephoneNumber,
    String? addressUser,
    required int id,
  }) async
  {
    database!.rawUpdate(
      'UPDATE information SET user = ?, fullName = ?, title = ?, telephoneNumber = ?, addressUser = ? WHERE id = ?',
      ['$user', '$fullName', '$title', '$telephoneNumber', '$addressUser', id],
    ).then((value)
    {
      getDataFromDatabase(database);
      getDataFromDatabase2(database);
      getDataFromDatabaseInformation(database);
      getDataFromDatabaseMap(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({
    required int id,
  }) async
  {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id])
        .then((value)
    {
      getDataFromDatabase(database);
      getDataFromDatabase2(database);
      getDataFromDatabaseInformation(database);
      getDataFromDatabaseMap(database);
      emit(AppDeleteDatabaseState());
    });
  }


  void deleteData2({
    required int id,
  }) async
  {
    database!.rawDelete('DELETE FROM payment WHERE id = ?', [id])
        .then((value)
    {
      getDataFromDatabase(database);
      getDataFromDatabase2(database);
      getDataFromDatabaseInformation(database);
      getDataFromDatabaseMap(database);
      emit(AppDeleteDatabaseState());
    });
  }

  void deleteDataInformation({
    required int id,
  }) async
  {
    database!.rawDelete('DELETE FROM information WHERE id = ?', [id])
        .then((value)
    {
      getDataFromDatabase(database);
      getDataFromDatabase2(database);
      getDataFromDatabaseInformation(database);
      getDataFromDatabaseMap(database);
      emit(AppDeleteDatabaseState());
    });
  }

  void deleteDataMap({
    required int id,
  }) async
  {
    database!.rawDelete('DELETE FROM storage WHERE id = ?', [id])
        .then((value)
    {
      getDataFromDatabase(database);
      getDataFromDatabase2(database);
      getDataFromDatabaseInformation(database);
      getDataFromDatabaseMap(database);
      emit(AppDeleteDatabaseState());
    });
  }
/*
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;

    emit(AppChangeBottomSheetState());
  }*/
}