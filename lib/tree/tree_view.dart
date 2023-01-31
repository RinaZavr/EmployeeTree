import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:provider/provider.dart';
import 'package:tree/consts/strings.dart';
import 'package:tree/consts/styles.dart';
import 'package:tree/state/tree_state.dart';

class EmployeeTreeView extends StatelessWidget {
  const EmployeeTreeView({super.key});

  @override
  Widget build(BuildContext context) {
    TreeState state = Provider.of<TreeState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(header),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: IntrinsicWidth(
              child: SizedBox(
                width: 200,
                child: TextField(
                  decoration: appInputStyle,
                  onChanged: (text) => state.inputNewNode(text),
                  controller: TextEditingController(text: state.newNode),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: state.nodeAdd, 
            icon: Image.asset(addButton)
          ),
          IconButton(
            onPressed: state.nodeRemove, 
            icon: Image.asset(removeButton)
          ),
        ],
      ),
      body: TreeView(
        nodeBuilder: (context, node) {
          return ListTile(
            onTap: () => state.nodeTap(node.key),
            selectedTileColor: Colors.red,
            title: Text(node.label),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      state.nodeTap(node.key);
                      state.nodeUp(nodes);
                    },
                    icon: Image.asset(
                      upButton,
                      height: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      state.nodeTap(node.key);
                      nodes = state.nodeDown(nodes);
                      state.treeViewController =
                          TreeViewController(children: nodes);
                    },
                    icon: Image.asset(
                      downButton,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        controller: state.treeViewController,
      ),
    );
  }
}