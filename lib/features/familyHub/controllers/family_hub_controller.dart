import 'package:get/get.dart';
import 'package:home_star_app/features/familyHub/models/child_model.dart';
import 'package:uuid/uuid.dart';

class FamilyHubController extends GetxController {
  final children = <Child>[].obs;
  final _uuid = const Uuid();

  void addChild(Child child) {
    final newChild = Child(
      id: _uuid.v4(),
      name: child.name,
      age: child.age,
      points: child.points,
      imagePath: child.imagePath,
    );
    children.add(newChild);
  }

  void removeChild(int index) {
    if (index >= 0 && index < children.length) {
      children.removeAt(index);
    }
  }

  void updateChildPoints(Child updatedChild) {
    final index = children.indexWhere((child) => child.id == updatedChild.id);
    if (index != -1) {
      children[index] = updatedChild;
    }
  }
}
