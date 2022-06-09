import 'package:flutter/material.dart';

class CustomNavigator extends StatelessWidget {
  const CustomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,70),
                      painter: BNBCustomPainter(),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(onPressed: () {  },
                        backgroundColor: Colors.orange,
                        elevation: 0.5,
                        child: const Icon(Icons.account_balance, color: Colors.white,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.account_circle_sharp, color: Colors.black,size: 40,)),
                            Container(width: MediaQuery.of(context).size.width* 0.10,),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.notifications, color: Colors.black,size: 40))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),

    );
  }
}

class BNBCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    path.arcToPoint(Offset(size.width*0.60, 20), radius: const Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
