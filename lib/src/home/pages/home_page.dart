part of '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Background.parallax(
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: Env.controller.node,
          onKey: Env.controller.onKey,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: NavigationHeader(),
            drawer: NavigationDrawer.of(context),
            body: InteractiveScrollViewer(
              scrollToId: Env.controller.instance,
              scrollDirection: Axis.vertical,
              children: [
                ...Env.navigations.to(HomePage.scrollContent),
                ScrollContent(
                  id: 'footer',
                  child: const NavigationFooter(),
                )
              ],
            ),
            floatingActionButton: HomePage.floatingButton(),
          ),
        ),
      ),
    );
  }

  static Widget floatingButton() {
    return ValueListenableBuilder(
      valueListenable: Env.controller,
      builder: (_, value, child) {
        return TweenAnimationBuilder(
          tween: Tween(end: value == Env.navigations.last.id ? 0.0 : 1.0),
          duration: Constants.duration,
          builder: (_, value, child) {
            return Transform.translate(
              offset: Offset(0.0, value * kToolbarHeight * 2.0),
              child: child,
            );
          },
          child: child,
        );
      },
      child: Builder(
        builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () => Env.controller.onTap(
                  context,
                  id: Env.navigations.first.id,
                ),
                child: Seo.link(
                  anchor: 'Go back to top',
                  href: '/?section=${Env.navigations.first.id}',
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                    semanticLabel: 'Go back to top',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static ScrollContent scrollContent(
    int index,
    NavigationModel item,
  ) {
    return ScrollContent(
        id: item.id,
        child: [
          // HomeStarter Section: Introduction
          HomeStarter(
            id: item.id,
            title: "유니콘 UNITCON",
            subtitle: "제 1회 수도권 대학 연합 IT 컨퍼런스 '유니콘'에 당신을 초대합니다!",
          ),
          HomeOutline(
            id: item.id,
            title: "대회개요",
            subtitle: "대회의 진행방식을 소개합니다.",
            cards: const [],
          ),

          // HomeFeatures Section: Key Features
          HomeFeatures(
            id: item.id,
            title: '참여학교',
            subtitle: '이번 대회를 함께하는 학교를 확인해보세요!',
            cards: const [
              CardModel(
                source: "assets/image/school-logos/SJU.png",
                title: "세종대학교",
                subtitle: '제7대 소프트웨어융합대학 학생회 ‘태그’',
              ),
              CardModel(
                source: "assets/image/school-logos/CAU.svg",
                title: "중앙대학교",
                subtitle: '제52대 소프트웨어학부 학생회 ‘AN;SWer’',
              ),
              CardModel(
                source: "assets/image/school-logos/KU.jpg",
                title: "건국대학교",
                subtitle: ' 제5대 컴퓨터공학부 학생회 ‘ITZI’',
              ),
              CardModel(
                source: "assets/image/school-logos/SSU.jpg",
                title: "세종대학교",
                subtitle: '제7대 소프트웨어융합대학 학생회 태그',
              ),
              CardModel(
                source: "assets/image/school-logos/SJU.png",
                title: "세종대학교",
                subtitle: '제7대 소프트웨어융합대학 학생회 태그',
              ),
              CardModel(
                source: "assets/image/school-logos/SJU.png",
                title: "세종대학교",
                subtitle: '제7대 소프트웨어융합대학 학생회 태그',
              ),
              CardModel(
                source: "assets/image/school-logos/SJU.png",
                title: "세종대학교",
                subtitle: '제7대 소프트웨어융합대학 학생회 태그',
              ),
              CardModel(
                source: "assets/image/school-logos/SJU.png",
                title: "세종대학교",
                subtitle: '제7대 소프트웨어융합대학 학생회 태그',
              ),
              CardModel(
                source: "assets/image/school-logos/SJU.png",
                title: "세종대학교",
                subtitle: '제7대 소프트웨어융합대학 학생회 태그',
              ),
            ],
          ),

          // HomePricing Section: Pricing Plans
          HomePricing(
            id: item.id,
            title: '협찬사',
            subtitle: '본 행사를 도와주시는 협찬사를 소개합니다.',
            plans: const [
              // HomePricingModel items representing pricing plans
              HomePricingModel(
                  title: '세종대학교',
                  imagePath: "assets/image/school-logos/SJU.png"),
              HomePricingModel(
                title: '경희대학교',
                imagePath: "assets/image/school-logos/SJU.png",
              ),
              HomePricingModel(
                title: 'Premium Plan',
                imagePath: "assets/image/school-logos/SJU.png",
              ),
              HomePricingModel(
                title: 'Premium Plan',
                imagePath: "assets/image/school-logos/SJU.png",
              ),
              HomePricingModel(
                title: 'Premium Plan',
                imagePath: "assets/image/school-logos/SJU.png",
              ),
            ],
          ),

          // HomeFAQ Section: Frequently Asked Questions
          HomeFAQ(
            id: item.id,
            title: 'FAQ',
            subtitle: '궁금한 점이 있으시다면 무엇이든 물어보세요!',
            cards: const [
              // CardModel items representing frequently asked questions
              CardModel(
                source: 'assets/image/icon_inactive_faq.svg',
                title: "🚀 Discover the World's Wonders",
                subtitle:
                    'Embark on a mesmerizing journey to breathtaking destinations and uncover the hidden gems that make our planet truly extraordinary.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_features.svg',
                title: '🎨 Unleash Your Creativity',
                subtitle:
                    'Ignite your creative spark and let your imagination run wild with our vast collection of inspiring content, designed to fuel your artistic passions.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_pricing.svg',
                title: '🍰 Elevate Your Taste Buds',
                subtitle:
                    'Indulge in a delectable culinary journey that tantalizes your palate, as we guide you through a world of flavors and culinary adventures.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_faq.svg',
                title: '🏸 Master Your Fitness Journey',
                subtitle:
                    'Take control of your health and wellness goals with our expert guidance, tailored workouts, and nutrition tips to help you achieve the best version of yourself.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_features.svg',
                title: '🏔 Unlock Adventure Awaits',
                subtitle:
                    'Embark on thrilling adventures and create unforgettable moments as we guide you through an exciting world of experiences, from adrenaline-pumping escapades to serene getaways.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_pricing.svg',
                title: '🗞 Stay Informed and Inspired',
                subtitle:
                    'Get the latest news, insights, and motivation from our team of experts and thought leaders. Stay informed, stay inspired, and stay ahead of the curve.',
              ),
            ],
          ),
        ][index]);
  }
}
