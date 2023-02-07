// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'panel_selection.dart';

class Listeners{
  ValueNotifier<bool> _destination_reached = ValueNotifier(false);

  ValueNotifier<bool> get destination_reached => _destination_reached;

  set setlisteners(ValueNotifier<bool> value) {
     _destination_reached = value;
  }

  Panelitem panelitem = Panelitem();
  
}