import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:friggly/app_preferences.dart';

import 'Home/MainHomeScreen.dart';
import 'loginflow/mobilenumber.dart';

class Onboardingscreen extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    AppPreferences.setShowOnBoarding(false);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg1.jpg"),
                fit: BoxFit.cover,
              )),
          child: Column(
            children: [
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(110),
                  child: Image.asset("assets/mic.jpg",height: 120,width: 120,)),
              Expanded(
                flex: 1,
                child: OnBoard(
                  pageController: _pageController,
                  // Either Provide onSkip Callback or skipButton Widget to handle skip state
                  onSkip: () {
                    // print('skipped');
                  },
                  // Either Provide onDone Callback or nextButton Widget to handle done state
                  onDone: () {
                    // print('done tapped');
                  },
                  onBoardData: onBoardData,
                  titleStyles: const TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.15,
                  ),
                  descriptionStyles: TextStyle(
                    fontSize: 16,
                    color: Colors.brown.shade300,
                  ),
                  pageIndicatorStyle: const PageIndicatorStyle(
                    width: 100,
                    inactiveColor: Colors.deepOrangeAccent,
                    activeColor: Colors.deepOrange,
                    inactiveSize: Size(8, 8),
                    activeSize: Size(12, 12),
                  ),

                  // Either Provide onSkip Callback or skipButton Widget to handle skip state
                  skipButton: TextButton(
                    onPressed: () {
                      // print('skipButton pressed');
                    },
                    child: const Text(
                      "",
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                  ),
                  // Either Provide onDone Callback or nextButton Widget to handle done state
                  nextButton: OnBoardConsumer(
                    builder: (context, ref, child) {
                      final state = ref.watch(onBoardStateProvider);
                      return Column(
                        children: [
                         // Text("Change language to"),
                          InkWell(
                            onTap: () =>{
                      state.isLastPage ?  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Myphone())) : _onNextTap(state)
                      },

                            child: Container(
                              width: 230,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                  colors: [Colors.redAccent, Colors.deepOrangeAccent],
                                ),
                              ),
                              child: Text(
                                state.isLastPage ? "Done" : "Next",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),


                        ],
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(

    imgUrl: "assets/1.jpg",
    title: "Know who is calling before you answer",
    description: " ",
  ),
  const OnBoardModel(
    imgUrl: 'assets/1.jpg',
    title: "Protect yourself from",
    description: " ",
  ),
  const OnBoardModel(
    title: "Your SMS inbox categorized into highlights, spam and more",

    description: " ",
    imgUrl: 'assets/1.jpg',
  ),

];