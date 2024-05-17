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

  // addtodo
  Future<int> addTodo(
      {required String title, required String description}) async {
    try {
      TodoModel todoModel =
          TodoModel(todoTitle: title, todoDescription: description);
      final response = await http.post(
        Uri.parse(kBaseurl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(todoModel.toJson()),
      );
      print(response.statusCode);
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

  Future<int> editTodo({required String id,required String title, required String description}) async {
    TodoModel todoModel = TodoModel(todoTitle: title, todoDescription: description, todoId: id);
    try {
      final response = await http.put(
        Uri.parse('$kBaseurl/$id'),
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
