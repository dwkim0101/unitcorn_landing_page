part of '../home.dart';

class HomeOutline extends StatefulWidget {
  const HomeOutline({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.cards,
  });
  final String id, title, subtitle;
  final List<CardModel> cards;

  @override
  State<HomeOutline> createState() => _HomeOutlineState();

  static Widget introduction({
    required String id,
    required String title,
    required String subtitle,
  }) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(Constants.spacing,
              Constants.spacing * 5, Constants.spacing, Constants.spacing * 2),
          child: Animate(
            autoPlay: false,
            onInit: Env.controller.animate(id),
            effects: const [
              SlideEffect(
                begin: Offset(0.0, -0.25),
                end: Offset.zero,
                duration: Duration(milliseconds: 150),
              ),
              FadeEffect(
                duration: Duration(milliseconds: 150),
              ),
            ],
            child: MergeSemantics(
              child: Column(
                children: [
                  // Display title
                  Seo.text(
                    text: title,
                    style: TextTagStyle.h1,
                    child: Text(
                      title,
                      semanticsLabel: title,
                      textAlign: TextAlign.center,
                      style: context.text.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                    ),
                  ),

                  // Ddisplay subtitle
                  Seo.text(
                    text: subtitle,
                    style: TextTagStyle.p,
                    child: Text(
                      '\n$subtitle',
                      semanticsLabel: subtitle,
                      style: context.text.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget card({required CardModel item}) {
    return Builder(
      builder: (context) {
        return Container(
          width: 180.0,
          height: 210.0,
          margin: const EdgeInsets.only(right: Constants.spacing),
          padding: const EdgeInsets.only(
            top: Constants.spacing * 0.5,
            left: Constants.spacing * 0.5,
            right: Constants.spacing * 0.5,
            bottom: Constants.spacing * 0.5,
          ),
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: BorderRadius.circular(Constants.spacing * 0.5),
            boxShadow: [
              BoxShadow(
                color: context.color.onSurface.withOpacity(0.1),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: MergeSemantics(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display item image
                Semantics(
                  image: true,
                  label: '${item.title} Icon',
                  child: Seo.image(
                    alt: '${item.title} Icon',
                    src: 'assets/${item.source}',
                    child: DImage(
                      source: item.source,
                      size: const Size.fromRadius(Constants.spacing * 3),
                      // color: context.color.primary,
                    ),
                  ),
                ),

                // Add spacing between image and title
                Padding(
                  padding: const EdgeInsets.only(
                    top: Constants.spacing * 0.1,
                    // bottom: Constants.spacing,
                  ),
                  child: Seo.text(
                    text: item.title,
                    style: TextTagStyle.h2,
                    child: Text(
                      item.title,
                      semanticsLabel: item.title,
                      style: context.text.bodyMedium?.copyWith(
                        color: context.color.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                // Display item subtitle
                Seo.text(
                  text: item.subtitle,
                  style: TextTagStyle.p,
                  child: Text(
                    item.subtitle,
                    semanticsLabel: item.subtitle,
                    textAlign: TextAlign.center,
                    style: context.text.bodySmall
                        ?.copyWith(color: Colors.grey.shade700, fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HomeOutlineState extends State<HomeOutline> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback(
    //     (_) => scrollAnimated(controller.position.maxScrollExtent));
    // controller.animateTo(100,
    //     duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void scroll(double position) {
    controller.jumpTo(position);
  }

  void scrollAnimated(double position) {
    controller.animateTo(position,
        duration: const Duration(seconds: 15), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Display label
          HomeOutline.introduction(
              id: widget.id, title: widget.title, subtitle: widget.subtitle),

          // Display card
          Container(
            padding: const EdgeInsets.all(Constants.spacing).copyWith(top: 0.0),
            alignment: Alignment.center,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: Constants.spacing,
              runSpacing: Constants.spacing,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: widget.cards.to((index, item) => Animate(
                    autoPlay: false,
                    onInit: Env.controller.animate(widget.id),
                    effects: [
                      SlideEffect(
                        begin: const Offset(0.0, -0.25),
                        end: Offset.zero,
                        delay: Constants.duration * (index + 1),
                        duration: const Duration(milliseconds: 100),
                      ),
                      FadeEffect(
                        delay: Constants.duration * (index + 1),
                        duration: const Duration(milliseconds: 100),
                      ),
                    ],
                    child: HomeOutline.card(item: item),
                  )),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          // Display label with different tree
          Center(
            child: HomeOutline.introduction(
                id: widget.id, title: widget.title, subtitle: widget.subtitle),
          ),
          // Display card with different tree
          Transform.translate(
            offset: const Offset(0, Constants.spacing * -5),
            child: Center(
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(minHeight: context.height * 0.75),
                child: SingleChildScrollView(
                  controller: controller,
                  // dragStartBehavior: DragStartBehavior.start,s
                  padding: const EdgeInsets.all(Constants.spacing),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        children: widget.cards
                            .sublist((widget.cards.length ~/ 2))
                            .to(
                              (index, item) => Animate(
                                autoPlay: false,
                                onInit: Env.controller.animate(widget.id),
                                effects: [
                                  SlideEffect(
                                    begin: const Offset(-0.25, 0.0),
                                    end: Offset.zero,
                                    delay: Constants.duration * (index + 1),
                                    duration: const Duration(milliseconds: 250),
                                  ),
                                  FadeEffect(
                                    delay: Constants.duration * (index + 1),
                                    duration: const Duration(milliseconds: 250),
                                  ),
                                ],
                                child: HomeOutline.card(item: item),
                              ),
                            ),
                      ),
                      const SizedBox(
                        height: Constants.spacing,
                      ),
                      Row(
                        children: widget.cards
                            .sublist(widget.cards.length -
                                (widget.cards.length ~/ 2))
                            .to(
                              (index, item) => Animate(
                                autoPlay: false,
                                onInit: Env.controller.animate(widget.id),
                                effects: [
                                  SlideEffect(
                                    begin: const Offset(-0.25, 0.0),
                                    end: Offset.zero,
                                    delay: Constants.duration * (index + 1),
                                    duration: const Duration(milliseconds: 250),
                                  ),
                                  FadeEffect(
                                    delay: Constants.duration * (index + 1),
                                    duration: const Duration(milliseconds: 250),
                                  ),
                                ],
                                child: HomeOutline.card(item: item),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
      // return Container(
      //   alignment: Alignment.center,
      //   width: context.width,
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: [
      //         context.color.primary,
      //         context.color.primary.withOpacity(0.0),
      //       ],
      //     ),
      //   ),
      //   height: context.height - kToolbarHeight,
      //   constraints:
      //       BoxConstraints(minHeight: context.width < 560.0 ? 650.0 : 455.0),
      //   padding: const EdgeInsets.all(Constants.spacing),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       // Display label
      //       HomeOutline.introduction(id: id, title: title, subtitle: subtitle),

      //       // Display swiper
      //       Expanded(
      //         child: Animate(
      //           autoPlay: false,
      //           onInit: Env.controller.animate(id),
      //           effects: const [
      //             ScaleEffect(
      //               begin: Offset(0.75, 0.75),
      //               end: Offset(1.0, 1.0),
      //               delay: Constants.duration,
      //               duration: Duration(milliseconds: 250),
      //             ),
      //             FadeEffect(
      //               delay: Constants.duration,
      //               duration: Duration(milliseconds: 250),
      //             ),
      //           ],
      //           child: Swiper(
      //             itemBuilder: (BuildContext context, int index) =>
      //                 SingleChildScrollView(
      //               clipBehavior: Clip.none,
      //               physics: const BouncingScrollPhysics(),
      //               child: Column(
      //                   children: [HomeOutline.card(item: cards[index])]),
      //             ),
      //             itemCount: cards.length,
      //             autoplay: true,
      //             scrollDirection: context.width >= 560.0
      //                 ? Axis.horizontal
      //                 : Axis.horizontal,
      //             autoplayDelay: 10 * 1000,
      //             layout: SwiperLayout.STACK,
      //             itemWidth: 300.0,
      //             itemHeight: context.height.max(250.0),
      //             control: SwiperControl(
      //               iconNext: Icons.navigate_next_rounded,
      //               iconPrevious: Icons.navigate_before_rounded,
      //               color: context.color.surface,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // );
    }
  }
}
