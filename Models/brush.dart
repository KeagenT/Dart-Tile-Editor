import '../Types/position.dart';
import 'tile.dart';

abstract class brush {
  draw(Position position);
  updateCurrentPaint();
}

class TileBrush extends brush {
  Tile currentTile = Tile();
  void draw(Position position) {}
  void updateCurrentPaint() {}
}
