class Position {
  final int x = 0;
  final int y = 0;

  const Position(int x, int y);

  Position operator +(Position other) {
    return Position(this.x + other.x, this.y + other.y);
  }

  Position operator -(Position other) {
    return Position(this.x - other.x, this.y - other.y);
  }

  Position get north {
    return this - Position(0, 1);
  }

  Position get east {
    return this + Position(1, 0);
  }

  Position get south {
    return this + Position(0, 1);
  }

  Position get west {
    return this - Position(1, 0);
  }

  List<Position> get surrounding {
    return [this.north, this.east, this.south, this.west];
  }

  @override
  String toString() {
    return 'Position(${this.x}, ${this.y})';
  }
}
