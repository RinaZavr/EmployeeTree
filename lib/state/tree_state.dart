import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:tree/consts/strings.dart';

class TreeState with ChangeNotifier {
  Node? selectedNode;
  int? index;
  String newNode = '';
  int lastIndex = 10;
  TreeViewController treeViewController = TreeViewController(children: nodes);

  void nodeTap(key) {
    selectedNode = treeViewController.getNode(key);
    notifyListeners();
  }

  void nodeUp(newNodes) {
    bool isDone = false;
    for (int i = 0; i < newNodes.length; i++) {
      if (newNodes[i].key == selectedNode!.key && i - 1 >= 0) {
        newNodes[i] = newNodes[i - 1];
        newNodes[i - 1] = selectedNode!;
        isDone = true;
        if (isDone) {
          break;
        }
      } else {
        nodeUp(newNodes[i].children);
      }
    }
    treeViewController = TreeViewController(children: newNodes);
    notifyListeners();
  }

  List<Node> nodeDown(newNodes) {
    bool isDone = false;
    for (int i = 0; i < newNodes.length; i++) {
      if (newNodes[i].key == selectedNode!.key && i + 1 < newNodes.length) {
        newNodes[i] = newNodes[i + 1];
        newNodes[i + 1] = selectedNode!;
        isDone = true;
        if (isDone) {
          break;
        }
      } else {
        nodeDown(newNodes[i].children);
      }
    }
    treeViewController = TreeViewController(children: newNodes);
    notifyListeners();

    return newNodes;
  }

  void nodeAdd() {
    lastIndex += 1;
    nodes = treeViewController.addNode(
        selectedNode!.key, Node(key: lastIndex.toString(), label: " "));
    treeViewController = TreeViewController(children: nodes);
    print(nodes);
    notifyListeners();
  }

  void nodeRemove() {
    if (selectedNode != null) {
      nodes = treeViewController.deleteNode(selectedNode!.key);
      treeViewController = TreeViewController(children: nodes);
      notifyListeners();
    }
  }

  void inputNewNode(String label) {
    newNode = label;
  }
}
