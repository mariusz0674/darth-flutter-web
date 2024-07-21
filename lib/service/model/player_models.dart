import 'dart:collection';

import 'package:darth_flutter/service/model/coordinates.dart';
import 'package:darth_flutter/service/model/equipment_state.dart';

import 'allowedMoves.dart';
import 'direction.dart';

class Player {
  final Queue<Coordinates> coordinatesQueue = Queue<Coordinates>();
  final EquipmentState equipment;
  bool blockedMovement = false;
  bool _minimapOpen = false;
  AllowedMoves allowedMoves = AllowedMoves(north: true, south: true, east: true, west: true);

  Player(coordinates, this.equipment) {
    coordinatesQueue.add(coordinates);
  }

  move(Direction direction) {
    if (direction == Direction.NORTH) {
      coordinatesQueue.addFirst(Coordinates(coordinatesQueue.first.x,
          (int.parse(coordinatesQueue.first.y) - 1).toString()));
    } else if (direction == Direction.SOUTH) {
      coordinatesQueue.addFirst(Coordinates(coordinatesQueue.first.x,
          (int.parse(coordinatesQueue.first.y) + 1).toString()));
    } else if (direction == Direction.WEST) {
      coordinatesQueue.addFirst(Coordinates(
          String.fromCharCode(coordinatesQueue.first.x.codeUnitAt(0) + 1),
          coordinatesQueue.first.y));
    } else if (direction == Direction.EAST) {
      coordinatesQueue.addFirst(Coordinates(
          String.fromCharCode(coordinatesQueue.first.x.codeUnitAt(0) - 1),
          coordinatesQueue.first.y));
    }
  }

  String getPlayerPositionId() {
    return coordinatesQueue.first.x + coordinatesQueue.first.y;
  }

  void rollbackMoves(int moves) {
    if (moves < coordinatesQueue.length) {
      for (int i = 0; i < moves; i++) {
        coordinatesQueue.removeFirst();
      }
    } else {
      while (coordinatesQueue.length > 1) {
        coordinatesQueue.removeFirst();
      }
    }
  }

  void setBlockedMovement(bool blockMovement) {
    allowedMoves = AllowedMoves(north: false, south: false, east: false, west: false);
    blockedMovement = blockMovement;
  }

  AllowedMoves getAllowedMoves() {
    return allowedMoves;
  }

  void setAllowedMoves(AllowedMoves allowedMoves) {
    this.allowedMoves = allowedMoves;
  }

  bool getBlockedMovement() {
    return blockedMovement;
  }

  EquipmentState getPlayerEquipment() {
    return equipment;
  }

  bool getMinimapOpen(){
    return _minimapOpen;
  }

  void openMiniMap() {
    _minimapOpen = true;
  }

  void closeMiniMap() {
    _minimapOpen = false;
  }
}
