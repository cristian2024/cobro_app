import 'package:flutter/material.dart';

class SigninOptions extends StatelessWidget {
  const SigninOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const Text('Or use'),
            Expanded(
              child: Divider(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
