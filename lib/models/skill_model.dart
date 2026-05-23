import 'package:flutter/widgets.dart';

class SkillModel {

  const SkillModel({required this.name, required this.category, this.icon});
  final String name;
  final IconData? icon;
  final String category;
}
