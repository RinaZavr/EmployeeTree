import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree/state/tree_state.dart';
import 'package:tree/tree/tree_view.dart';

class EmployeeTreeMainView extends StatelessWidget {
  const EmployeeTreeMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TreeState(),
      child: const EmployeeTreeView(),
    );
  }
}