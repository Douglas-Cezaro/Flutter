import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    required this.icon,
    required this.text,
    required this.pageController,
    required this.page,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
        child: SizedBox(
          height: 60.0,
          child: Row(
            children: [
              Icon(
                icon,
                size: 32.0,
                color: pageController.page?.round() == page
                    ? Theme.of(context).primaryColor
                    : Colors.grey[700],
              ),
              const SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: pageController.page?.round() == page
                      ? Theme.of(context).primaryColor
                      : Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
