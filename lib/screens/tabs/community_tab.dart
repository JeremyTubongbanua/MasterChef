import 'package:flutter/material.dart';

class CommunityTab extends StatelessWidget {
  const CommunityTab();

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Text('Community Tab'),
      ),
      backgroundColor: cs.background,
    );
  }
}
