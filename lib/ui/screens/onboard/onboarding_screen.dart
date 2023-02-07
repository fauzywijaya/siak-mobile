import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/router/route_list.dart';
import 'package:siak_app/ui/widgets/onboarding_slider.dart';
import 'package:siak_app/utils/navigation_utils.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPages = 0;
  PageController _controller = PageController();
  List<Widget> pages = [
    OnBoardingSlider(
      title: "Let's Invest",
      description:
          "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
      imageAsset: Assets.images.logoUMMI.path,
    ),
    OnBoardingSlider(
      title: "Great Analytics",
      description:
          "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
      imageAsset: Assets.images.logoUMMI.path,
    ),
    OnBoardingSlider(
      title: "Security Guarantee",
      description:
          "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
      imageAsset: Assets.images.logoUMMI.path,
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: setHeight(50),
              ),
              Center(
                  child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'INLINE',
                    textStyle: TextStyle(
                      fontSize: 32.0,
                      color: bluePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 1000),
                  ),
                ],
                totalRepeatCount: 1,
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )),
            ],
          ),
          PageView.builder(
            itemBuilder: (context, int index) => pages[index],
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _controller,
            onPageChanged: (int index) {
              setState(() {
                _currentPages = index;
              });
            },
            itemCount: pages.length,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  pages.length,
                  (int index) {
                    return AnimatedContainer(
                      duration: kAnimationDuration,
                      margin: const EdgeInsets.only(right: 5),
                      height: 6,
                      width: _currentPages == index ? 20 : 6,
                      decoration: BoxDecoration(
                        color:
                            _currentPages == index ? bluePrimary : grayPrimary,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: setHeight(50),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: (_currentPages == (pages.length - 1))
                    ? Container(
                        margin: EdgeInsets.only(top: setHeight(20)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: bluePrimary),
                        child: Material(
                          type: MaterialType.transparency,
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              navigate.pushToRemoveUntil(routeLogin);
                            },
                            borderRadius: BorderRadius.circular(5),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: setWidth(40),
                                  vertical: setHeight(20)),
                              child: Text(
                                "Get Started",
                                style: styleTitle.copyWith(
                                    fontSize: setFontSize(40),
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: setHeight(20)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: graySecondary),
                              child: Material(
                                type: MaterialType.transparency,
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    _controller.animateToPage(2,
                                        duration: Duration(milliseconds: 1000),
                                        curve: Curves.easeInOutQuint);
                                  },
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: setWidth(40),
                                        vertical: setHeight(20)),
                                    child: Text(
                                      "Skip",
                                      style: styleTitle.copyWith(
                                          fontSize: setFontSize(40),
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: setHeight(20)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: bluePrimary),
                              child: Material(
                                type: MaterialType.transparency,
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    _controller.nextPage(
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeInOutQuint);
                                  },
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: setWidth(40),
                                        vertical: setHeight(20)),
                                    child: Text(
                                      "Next",
                                      style: styleTitle.copyWith(
                                          fontSize: setFontSize(40),
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
