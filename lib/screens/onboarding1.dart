import 'package:flutter/material.dart';
import 'package:my_anim/data/onboarding_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../screens/permission_screen.dart';


class onboarding1 extends StatefulWidget {
  const onboarding1({super.key});

  @override
  State<onboarding1> createState() => _onboarding1State();
}

class _onboarding1State extends State<onboarding1> {
  final controller = SlideModelItems();
  final pageController = PageController();
  bool isLastPage=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: isLastPage? getStarted() : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: ()=> pageController.jumpToPage(controller.items.length-1),
                child: const Text('Skip')),

            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index)=>pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
              effect: const WormEffect(
                activeDotColor: Colors.purple,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),

            TextButton(
                onPressed: ()=> pageController.nextPage(
                    duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
                child: Text('Next')),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          onPageChanged: (index)=> setState(()=> isLastPage=controller.items.length-1==index),
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context,index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(controller.items[index].imagePath),
                const SizedBox(height: 15),
                Text(controller.items[index].title,textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
                const SizedBox(height: 15),
                Text(controller.items[index].desc,
                    textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              ],
            );
          }
        ),
      )
    );
  }
  Widget getStarted(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
          onPressed: () async{
            final pres= await SharedPreferences.getInstance();
            pres.setBool('onboarding1', true);
            if(!mounted) return;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PermissionScreen()));
          },
          child: const Text('Get Started', style: TextStyle(color: Colors.white),)),
    );
  }
}

