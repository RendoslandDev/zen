import 'package:flutter/material.dart';

class AppBarRest extends StatelessWidget {
  const AppBarRest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset("images/zen.jpg"),
      title: const Text("Zen"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more),
        )
      ],
    );
  }
}
