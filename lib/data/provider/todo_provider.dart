import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_app_bloc_api/constants/base_url.dart';
import 'package:todo_app_bloc_api/data/models/todo_model.dart';

class TodoProvider {
  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await http.get(
        Uri.parse('$kBaseurl?page=1&limit=10'),
      );
      // print(response.body);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body)['items'] as List;
        return decodedData
            .map((data) => TodoModel.fromJson(json: data))
            .toList();
      }else{
        print('Failed to load todos. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print("GET ERROR::: $e");
    }
    return [];
  }

  Future<int> addTodo({
  required TodoModel todoModel,
}) async {
  try {
    TodoModel updatedTodoModel = todoModel.copyWith(
      isCompleted: false,
    );

    final response = await http.post(
      Uri.parse(kBaseurl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedTodoModel.toJson()),
    );
    print(response.statusCode);
    print(response.body);
    return response.statusCode;
  } catch (e) {
    print(e);
  }
  return 0;
}


  //delete
  Future<int> deleteById({required String id}) async {
    try {
      final response = await http.delete(Uri.parse('$kBaseurl/$id'));
      print(response.statusCode);
      return response.statusCode;
    } catch (e) {
      print(e);
    }
    return 0;
  }

  Future<int> editTodo({required TodoModel todoModel}) async {
    try {
      final response = await http.put(
        Uri.parse('$kBaseurl/${todoModel.todoId}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(todoModel.toJson()),
      );
      return response.statusCode;
    } catch (e) {
      print(e);
    }
    return 0;
  }
}
