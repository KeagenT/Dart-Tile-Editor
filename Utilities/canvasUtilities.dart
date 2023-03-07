import '../Types/position.dart';

// Calculate event position
Position calculateEventPosition(int tileDimensions, int x, int y) {
  int xPosition = x ~/ tileDimensions;
  int yPosition = y ~/ tileDimensions;
  return Position(xPosition, yPosition);
}
