import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool islogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // ClipPath(
            //   clipper: CustomClipDesign(),
            //   child:
               Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: Gradients.haze,
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        elevatedButtons('Login', (){
                          setState(() {
                            islogin = true;
                          });
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        elevatedButtons('Sign Up', (){
                          setState(() {
                            islogin = false;
                          });
                        })
                      ],
                    )
                  ],
                ),
              ),
            // ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 520,
                    width: 260,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-2, 2),
                            blurRadius: 5,
                            color: Colors.black38
                          )
                        ],
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        gradient: Gradients.buildGradient(
                            Alignment.topLeft,
                            Alignment.bottomLeft,
                            [Colors.purpleAccent, Colors.teal])),
                    child: islogin ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w200,
                              color: Colors.white),
                        ),
                        textfields("Email"),
                        textfields("Password"),
                        const SizedBox(height: 20,),
                      ],
                    ) : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w200,
                              color: Colors.white),
                        ),
                        textfields("Username"),
                        textfields("Email"),
                        textfields("Password"),
                        const SizedBox(height: 20,),
                      ],
                    )
                  ),
                  Transform(
                    transform: Matrix4.translationValues(0, -20, 4),
                    child: SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 5,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(20),
                                      left: Radius.circular(20)))),
                          child: islogin ? const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                          ) : const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                          )
                          ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "logo".toUpperCase(),
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textfields(String text) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              fillColor: Colors.white24,
              filled: true,
              border: InputBorder.none,
            ),
          )
        ],
      );

  Widget elevatedButtons(String text, void Function()? onPressed) => SizedBox(
        height: 35,
        width: 80,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.purpleAccent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
              ),
            )),
      );
}

class CustomClipDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;

    path.lineTo(0, h);
    path.lineTo(w / 8, h);
    path.quadraticBezierTo(w / 2, h - 200, w, h - 200);
    path.lineTo(w, 0);
    path.lineTo(w / 1.15, 0);
    path.quadraticBezierTo(w / 2, 200, 0, 200);
    path.close();
    return Path();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
// class CustomClipDesign extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     double h = size.height;
//     double w = size.width;

//     path.lineTo(0, h);
//     path.lineTo(w / 8, h);
//     path.quadraticBezierTo(w / 2, h - 200, w, h - 200);
//     path.lineTo(w, 0);
//     path.lineTo(w / 1.15, 0);
//     path.quadraticBezierTo(w / 2, 200, 0, 200);
//     path.close();
//     return Path();
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
