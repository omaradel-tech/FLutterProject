import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    Rect rect= new Rect.fromPoints(Offset(0,0),Offset(size.width,size.height*7));
    paint.color = Colors.black;
    paint.strokeWidth=10;
    paint.shader=LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Colors.indigoAccent,Colors.orange],).createShader(rect);
    // var path = new Path();
    // path.lineTo(0, 0);
    //path.quadraticBezierTo(size.width/2, size.height*8, size.width,0);
    //path.lineTo(0, 0);
    //canvas.drawPath(path, paint);
    // canvas.drawLine(Offset(size.width / 4, size.height / 2),
    //   Offset(size.width * 0.75, size.height / 2), paint);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
