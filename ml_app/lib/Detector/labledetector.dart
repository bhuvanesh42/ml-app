/*
import 'package:flutter/material.dart';
import 'package:mlkit/mlkit.dart';

class LabelDetectDecoration extends Decoration {
  final Size _originalImageSize;
  final List<VisionLabel> _labels;
  LabelDetectDecoration(List<VisionLabel> labels, Size originalImageSize)
      : _labels = labels,
        _originalImageSize = originalImageSize;

  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return _LabelDetectPainter(_labels, _originalImageSize);
  }
}

class _LabelDetectPainter extends BoxPainter {
  final List<VisionLabel> _labels;
  final Size _originalImageSize;
  _LabelDetectPainter(labels, originalImageSize)
      : _labels = labels,
        _originalImageSize = originalImageSize;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    final _heightRatio = _originalImageSize.height / configuration.size.height;
    final _widthRatio = _originalImageSize.width / configuration.size.width;
    for (var label in _labels) {
      final _rect = Rect.fromLTRB(
          offset.dx + label.rect.left / _widthRatio,
          offset.dy + label.rect.top / _heightRatio,
          offset.dx + label.rect.right / _widthRatio,
          offset.dy + label.rect.bottom / _heightRatio);
      canvas.drawRect(_rect, paint);
    }
    canvas.restore();
  }
}
*/
