import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:nock/nock.dart';
import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/external/datasources/http/post_add_tasks_datasources.dart';
import 'package:project_list_fliutter/src/modules/task/infra/comm_packages/proto/pb/tasks.pb.dart';

void main() {
  late PostAddTasksDatasource addTaskDatasourceExternal;

  setUpAll(() {
    nock.init();
  });

  setUp(() {
    addTaskDatasourceExternal = PostAddTasksDatasource(http.Client());
    nock.cleanAll();
  });

  dynamic interceptorSectorNames(int statusCode, String body) {
    final interceptor = nock('http://127.0.0.1:10100').get('/add_task')
      ..reply(
        statusCode,
        'body',
      );
    return interceptor;
  }

  // test('Erro 400', () async {
  //   interceptorSectorNames(400, 'body');

  //   final task = Task();

  //   try {
  //     await getTaskDatasourceExternal.getAllTasks(task.userId);
  //   } catch (e) {
  //     expect(e, isA<ExternalError>);
  //   }
  // });

  // test('Sucesso', () async {
  //   interceptorSectorNames(200, 'body');

  //   final task = Task();

  //   final result = await addTaskDatasourceExternal.saveTask();
  //   expect(result, isA<List<Task>>());
    
  // });
}
