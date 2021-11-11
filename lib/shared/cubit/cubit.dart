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
        // id integer
        // title String
        // date String
        // time String
        // status String

        print('database created');
        database
            .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, permissionNumber TEXT, kinds TEXT, gunNumber TEXT, productAndName TEXT, standardCartridge TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getDataFromDatabase(database);
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
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

    //  return null;
    });
  }

  Future insertToDatabaseMap({
    String? permissionNumber,
    String? kinds,
  }) async {
    await database!.transaction((txn)async {
      await txn
          .rawInsert(
        'INSERT INTO tasks(permissionNumber, kinds, status) VALUES("$permissionNumber", "$kinds", "done")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      //  return null;
    });
  }


  Future insertToDatabaseInfromation({
    String? permissionNumber,
    String? kinds,
    String? gunNumber,
    String? productAndName,
    String? standardCartridge,
  }) async {
    await database!.transaction((txn)async {
      await txn
          .rawInsert(
        'INSERT INTO tasks(permissionNumber, kinds, gunNumber, productAndName, standardCartridge, status) VALUES("$permissionNumber", "$kinds", "$gunNumber", "$productAndName", "$standardCartridge", "information")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
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
    informationTasks = [];
    archivedTasks = [];

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
      emit(AppUpdateDatabaseState());
    });
  }

  void updateDataMap({
    String? permissionNumber,
    String? kinds,

    required int id,
  }) async
  {
    database!.rawUpdate(
      'UPDATE tasks SET permissionNumber = ?, kinds = ? WHERE id = ?',
      ['$permissionNumber', '$kinds', id],
    ).then((value)
    {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void updateDataInformation({
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
      emit(AppUpdateDatabaseState());
    });
  }
/*
  void deleteData({
    required int id,
  }) async
  {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id])
        .then((value)
    {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

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