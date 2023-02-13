import 'dart:html';
import 'dart:html';
import 'dart:async';

CanvasElement? canvas;
CanvasRenderingContext2D? ctx;

int TILE_SIZE = 32;
void main() {
  canvas = querySelector('#canvas') as CanvasElement;
  ctx = canvas!.getContext('2d') as CanvasRenderingContext2D;
}
