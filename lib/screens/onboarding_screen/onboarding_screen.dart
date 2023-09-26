
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../LoginScreen/view/SignInScreen.dart';
import '../register_screen/view/widget/register_screen_body.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  PageController controller = PageController();
  int  _totalDots = 3;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }
  void _updatePosition(int position) {
    setState(() => _currentPosition = _validPosition(position.toDouble()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: _updatePosition,
            children: [
              OnboardingScreen(
                  Image.asset(
                      'assets/img/slider4.jpg',
                  ),
                  [
                     Text("Discover a world of healthcare options at your fingertips"
                         "\n\nFind the perfect doctor for your needs with just a few taps\n",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight:FontWeight.bold,
                          color: Color(0xFF174068).withOpacity(0.8),
                          letterSpacing: 0.3,
                      ),
                       textAlign: TextAlign.center,
                     ),
                    SizedBox(height: 30,),
                    //const Padding(padding: EdgeInsets.all(12.0)),
                    /*
                    OutlinedButton(onPressed: (

                        ){},child:  const Text(
                        "SKIP",
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                      style: ButtonStyle(

                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),

                      ),
                    )

                     */
                  ]

              ),
              OnboardingScreen(
                  Image.asset(
                      'assets/img/slider3.jpg'
                  ),
                  [
                     Text("Access a wide range of specialists and medical professionals Caring About Your Health"
                         "\n\nEnjoy the convenience of online consultations from your home.",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight:FontWeight.bold,
                        color: Color(0xFF174068).withOpacity(0.8),
                        letterSpacing: 0.3,

                      ),
                       textAlign: TextAlign.center,
                     ),
                    const Padding(padding: EdgeInsets.all(12.0)),
                    SizedBox(height: 20,),
                    /*
                    OutlinedButton(onPressed: (

                        ){},child:  const Text(
                        "SKIP",
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),

                      ),
                    )

                     */
                  ]

              ),
              OnboardingScreen(
                Image.asset('assets/img/slider2.png'),
                [
                   Text("Take control of your healthcare journey with our intuitive app\n\nReserve Your Doctor Now!", style: TextStyle(
                      fontSize: 22,
                      fontWeight:FontWeight.bold,
                      color: Color(0xFF174068).withOpacity(0.8),
                     letterSpacing: 0.3,

                   ),
                     textAlign: TextAlign.center,
                   ),
                  const Padding(padding: EdgeInsets.all(12.0)),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>   SignInScreen()),
                        );
                      }
                        , child: Text(
                          "Login",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight:FontWeight.bold,
                          color: Colors.blue,
                          letterSpacing: 0.5,
                        ),
                      ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),

                        ),),
                      OutlinedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  RegisterScreenBody()),
                        );

                      }, child: Text(
                          "Sign up",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight:FontWeight.bold,
                          color: Colors.blue,
                          letterSpacing: 0.5,
                        ),
                      ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),


                        ),),
                    ],
                  )
                ],
              ),

            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: DotsIndicator(
                dotsCount: 3,
                position:  _currentPosition,
                onTap: (double page){
                  setState(() {
                    controller.animateToPage(page.toInt(), duration: Duration(milliseconds: 300), curve: Curves.ease);
                  });
                },
              ))
        ],
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final Widget? image;
  final List<Widget> text;

  const OnboardingScreen(this.image, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.tealAccent.shade100,
      child: Column(
        children: [
          if (image != null)
            Expanded(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 10,
                    child: image!,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
              flex: 2,
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: text
              ),
            ),
            // flex: 1
          ),
        ],
      ),
    );
  }
}