import 'package:flutter/material.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';
import 'package:todo_app/features/common/presentation/widget/custom_text_field.dart';

const items = [
  'Item #1',
  'Item #2',
  'Item #3',
];

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: foregroundColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 10,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: DropdownButton(
                    dropdownColor: foregroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: 'Item #1',
                    hint: const Text(
                      'Choose project',
                    ),
                    items: items.map<DropdownMenuItem<String>>(
                      (item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {},
                  ),
                ),
                DropdownButtonFormField(
                  borderRadius: BorderRadius.circular(10),
                  isDense: true,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: foregroundColor,
                    alignLabelWithHint: true,
                    isDense: true,
                    suffixIconColor: labelColor,
                    label: Text('Select'),
                    border: DecoratedInputBorder(
                      shadow: const BoxShadow(
                        color: shadowColor,
                        blurRadius: 10,
                        offset: Offset(1, 5),
                      ),
                      child: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: foregroundColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    enabledBorder: DecoratedInputBorder(
                      shadow: const BoxShadow(
                        color: shadowColor,
                        blurRadius: 10,
                        offset: Offset(1, 5),
                      ),
                      child: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: foregroundColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    focusedBorder: DecoratedInputBorder(
                      shadow: const BoxShadow(
                        color: shadowColor,
                        blurRadius: 10,
                        offset: Offset(1, 5),
                      ),
                      child: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: foregroundColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    errorBorder: DecoratedInputBorder(
                      shadow: const BoxShadow(
                        color: shadowColor,
                        blurRadius: 10,
                        offset: Offset(1, 5),
                      ),
                      child: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: redColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    errorStyle: errorTextStyle,
                  ),
                  validator: _validate,
                  items: items.map<DropdownMenuItem<String>>(
                    (item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => _formKey.currentState!.validate(),
                  child: const Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Selection cannot be empty';
    }
    return null;
  }
}
