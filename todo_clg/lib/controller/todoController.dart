import 'package:get/get.dart';
import 'package:todo_clg/model/todo.dart';

class TodoController extends GetxController {
  var todo = List<Todo>.empty(growable: true).obs;
}
