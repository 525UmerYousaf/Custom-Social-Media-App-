import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //  With following line of code i'm vertical line
    //  from starting point of top left of image which
    //  is (zero, zero) to the point located vertically
    //  downward at 4/5 of the original height of the image.
    path.lineTo(0, 4 * size.height / 5);
    //  From the point I reach above now, I want to draw
    //  an curve from that point to the 4/5 of the original
    //  width of the image along "x-axis" to the full height
    //  of the image.
    Offset curvePoint1 = Offset(size.width / 4, size.height);
    //  Below I'm creating center point of the curved path as:
    Offset centerPoint = Offset(size.width / 2, 4 * size.height / 5);
    //  Now, with following line of code I would draw my curved
    //  path as: Below one will draw Curve to the center point
    //  of the image.
    path.quadraticBezierTo(
        curvePoint1.dx, curvePoint1.dy, centerPoint.dx, centerPoint.dy);
    Offset curvePoint2 = Offset(3 * size.width / 4, 3 * size.height / 5);
    //  Below is last point of the curve on the right of the image
    //  which is at same position as left curve point of the image.
    Offset endPoint = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
        curvePoint2.dx, curvePoint2.dy, endPoint.dx, endPoint.dy);
    //  With below line I'm moving toward top right of the image.
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  //  Below method is used to reclip our image whenever there's
  //  an update to our Curve Clipper. But in our case since we
  //  don't want to update our image, we would return "false".
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
