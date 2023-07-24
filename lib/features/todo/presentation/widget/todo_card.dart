import 'package:flutter/material.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/features/todo/domain/entity/todo_item.dart';

class TodoCard extends StatelessWidget {
  final TodoItem todoItem;

  const TodoCard({super.key, required this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: foregroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10,
            color: shadowColor,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(todoItem.title, style: formTextSyle),
          Checkbox.adaptive(value: false, onChanged: (value) {}),
        ],
      ),
    );
  }
}
