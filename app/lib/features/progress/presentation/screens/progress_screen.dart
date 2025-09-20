import 'package:flutter/cupertino.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: const Text(
          'Progress',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // TODO: Implement notifications
          },
          child: const Icon(
            CupertinoIcons.bell,
            color: CupertinoColors.systemGrey,
            size: 24,
          ),
        ),
      ),
      child: const Center(
        child: Text(
          'Progress Screen\nComing Soon!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: CupertinoColors.systemGrey),
        ),
      ),
    );
  }
}
