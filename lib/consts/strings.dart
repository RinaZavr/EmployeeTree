// ignore_for_file: prefer_const_constructors

import 'package:flutter_treeview/flutter_treeview.dart';

const String header = 'Tree';
const String addButton = 'img/add.png';
const String removeButton = 'img/remove.png';
const String upButton = 'img/up.png';
const String downButton = 'img/down.png';

List<Node> nodes = [
  Node(label: 'Сотрудники', key: 'Сотрудники', children:[
    Node(label: 'Петр', key: '0', children: [
      Node(
        label: 'Мария',
        key: '1',
      ),
      Node(label: 'Ольга', key: '2', children: [
        Node(
          label: 'Василий',
          key: '3',
        ),
        Node(
          label: 'Анжелика',
          key: '4',
        ),
        Node(
          label: 'Геннадий',
          key: '5',
        ),
      ]),
    ]),
    Node(
      label: 'Анастасия',
      key: '6',
    ),
    Node(label: 'Данил', key: '7', children: [
      Node(
        label: 'Петр',
        key: '8',
      ),
      Node(
        label: 'Карина',
        key: '9',
      ),
    ]),
    Node(
      label: 'Геннадий',
      key: '10',
    ),
  ])
];
