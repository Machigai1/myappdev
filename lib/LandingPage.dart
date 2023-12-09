import 'package:flutter/material.dart';
import 'package:myappdev/LoginPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key : key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller:  _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              Container(
                color: Color.fromRGBO(65, 114, 159, 1), 
                child: 
                  Lottie.asset('assets/HealthLogo.json',
                  width: 400,
                  height: 400,),
              ),

              Container(
                color: Color.fromRGBO(88, 133, 175, 1),
                child: 
                  Center(child: Text("Project Health App Demo", style: TextStyle(fontSize: 30,),),),
              ),
              Container(
                color: Color.fromRGBO(39, 68, 114, 0.8),
                child: 
                  Center(child: Text("This contains any health related necessities", style: TextStyle(fontSize: 18,),),),
              ),
            ],
          ),
          //indicators
          Container(
            alignment: Alignment(0,0.80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                onLastPage
                  ? GestureDetector(
                  onTap: (){
                    _controller.jumpToPage(1);
                  },
                  child: Text("Back", style: TextStyle(fontSize: 20),),
                )
                : GestureDetector(
                  onTap: (){
                    _controller.jumpToPage(2);
                  },
                  child: Text("Skip", style: TextStyle(fontSize: 20),),
                ),

                SmoothPageIndicator(controller: _controller, count: 3),

                onLastPage 
                  ? GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LoginPage();
                      },));
                      _controller.nextPage(duration: Duration(milliseconds: 300), 
                      curve: Curves.bounceIn);
                    },
                    child: Text("Login", style: TextStyle(fontSize: 20),),
                  )
                  : GestureDetector(
                    onTap: (){
                      _controller.nextPage(duration: Duration(milliseconds: 300), 
                      curve: Curves.bounceIn);
                    },
                    child: Text("Next", style: TextStyle(fontSize: 20),),
                  ),
                    
              ],
            ),
          ),
        ],
      ),
    );
  }
}