import 'package:cobro_app/ui/main.ui/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});
  static const String routeName = 'initial_route_name';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.settings_outlined,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: 'App settings',
            ),
          ),
        ],
      ),
      endDrawer: const MainDrawer(),
    );
  }
}
