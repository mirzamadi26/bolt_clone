import 'package:flutter/material.dart';

class drawer_icon extends StatelessWidget {
  final VoidCallback function;
  const drawer_icon({
    super.key,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: function,
        child: Container(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 21,
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ),
      ),
    );
  }
}
