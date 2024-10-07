import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciamento de Estado'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/vn/'),
              child: const Text('Value Notifier'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/bl/'),
              child: const Text('BLoC'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/tp/'),
              child: const Text('Triple'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/mx/'),
              child: const Text('MobX'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/rv/'),
              child: const Text('Riverpod'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/gx/'),
              child: const Text('GetX '),
            ),
          ],
        ),
      ),
    );
  }
}
