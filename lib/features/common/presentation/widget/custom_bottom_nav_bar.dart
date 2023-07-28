import 'package:flutter/material.dart';

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
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(0, 5),
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
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            duration: const Duration(milliseconds: 350),
                          ),
                        ),
                      ),
                      Icon(
                        _icons[index],
                        size: 30,
                        color: selectedNavBarIndex == index
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.white,
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
