import 'package:flutter/material.dart';
import 'package:todo_app/core/style/colors.dart';

const _icons = [
  Icons.home_rounded,
  Icons.add_rounded,
  Icons.settings_rounded,
];

class CustomBottomNavBar extends StatelessWidget {
  final int selectedNavBarIndex;
  final Function(int) onTabChanged;

  const CustomBottomNavBar({
    super.key,
    required this.selectedNavBarIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
          decoration: BoxDecoration(
            color: const Color(0xFF000920),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: shadowColor,
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_icons.length, (index) {
              return GestureDetector(
                onTap: () => onTabChanged(index),
                child: AnimatedOpacity(
                  opacity: selectedNavBarIndex == index ? 1 : 0.5,
                  duration: const Duration(milliseconds: 350),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Visibility(
                        visible: selectedNavBarIndex == index,
                        child: Positioned(
                          bottom: -5,
                          child: AnimatedContainer(
                            height: 3,
                            width: 30,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            duration: const Duration(milliseconds: 350),
                          ),
                        ),
                      ),
                      Icon(
                        _icons[index],
                        size: 30,
                        color: selectedNavBarIndex == index ? secondaryColor : Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
