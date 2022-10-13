import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:khobor/app/presentation/ui/screens/treading_news_screen.dart';
import 'app/presentation/ui/screens/all_news_screen.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SnakeNavigationBar Example ',
      home: SnakeNavigationBarExampleScreen(),
    );
  }
}

class SnakeNavigationBarExampleScreen extends StatefulWidget {
  const SnakeNavigationBarExampleScreen({Key? key}) : super(key: key);

  @override
  _SnakeNavigationBarExampleScreenState createState() =>
      _SnakeNavigationBarExampleScreenState();
}

class _SnakeNavigationBarExampleScreenState
    extends State<SnakeNavigationBarExampleScreen> {
  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);

  int _selectedItemPosition = 2;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.black;
  Color unselectedColor = Colors.blueGrey;

  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color? containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  int _page = 0;
  late PageController pageController;
  // NewsBloc _newsBloc = NewsBloc();
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    // _newsBloc.add(GetAllNews());
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void pageChanger(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      // appBar: AppBar(
      //   centerTitle: false,
      //   leading: IconButton(
      //       icon: const Icon(Icons.arrow_back, color: Colors.black),
      //       onPressed: () {}),
      //   title: const Text('Go back', style: TextStyle(color: Colors.black)),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   systemOverlayStyle: SystemUiOverlayStyle.dark,
      // ),
      body: AnimatedContainer(
        color: containerColor ?? containerColors[0],
        duration: const Duration(seconds: 1),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: [
            // Container(
            //   height: 300,
            //   child: Column(
            //     children: [
            //       Container(
            //         height: 200,
            //         width: 350,
            //         decoration: const BoxDecoration(
            //             border: Border(
            //                 bottom: BorderSide(width: 10, color: Colors.green)),
            //             borderRadius: BorderRadius.all(Radius.circular(24)),
            //             image: DecorationImage(
            //                 image: NetworkImage(
            //                   'https://s.yimg.com/os/creatr-uploaded-images/2022-09/bd1beea0-4027-11ed-abdb-98f9f2d0769a',
            //                 ),
            //                 fit: BoxFit.cover)),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 10),
            //         child: Text(
            //           "Hitting the Books: Steve Jobs' iPhone obsession led to Apple's silicon revolution",
            //           style: TextStyle(
            //               fontFamily: 'SansSerif',
            //               fontSize: 18,
            //               fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //       SizedBox(
            //         height: 15,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 10),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Row(
            //               children: [
            //                 Text(
            //                   'The Apple',
            //                   style: TextStyle(
            //                     fontFamily: 'serif',
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   width: 10,
            //                 ),
            //                 Text('14-5-1994'),
            //               ],
            //             ),
            //             SizedBox(
            //               width: 100,
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Icon(Icons.notifications),
            //                   Icon(Icons.local_activity_rounded),
            //                   Icon(Icons.home_max_rounded),
            //                 ],
            //               ),
            //             )
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   height: 300,
            //   child: BlocProvider<NewsBloc>(
            //     create: (_) => _newsBloc,
            //     child: BlocBuilder<NewsBloc, NewsState>(
            //       builder: (context, state) {
            //         if (state is NewsLoading) {
            //           return CircularProgressIndicator();
            //         } else if (state is NewsError) {
            //           return Text('Error FEtching news');
            //         } else if (state is NewsLoaded) {
            //           return ListView.builder(
            //               itemCount: state.news.articles!.length,
            //               itemBuilder: (context, index) {
            //                 return Text('${state.news.articles![index].title}');
            //               });
            //         } else {
            //           return Container(
            //             child: Center(child: CircularProgressIndicator()),
            //           );
            //         }
            //       },
            //     ),
            //   ),
            // ),
            const AllNewsScreen(),
            const TrendingNewsScreen(),
            Center(
              child: Text('dsad124242'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        // height: 80,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,

        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: unselectedColor,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _page,
        onTap: pageChanger,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'tickets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded), label: 'calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.production_quantity_limits_sharp),
          //     label: 'microphone'),
          // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }

  void _onPageChanged(int page) {
    containerColor = containerColors[page];
    switch (page) {
      case 0:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.floating;
          snakeShape = SnakeShape.circle;
          padding = const EdgeInsets.all(12);
          bottomBarShape =
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25));
          showSelectedLabels = false;
          showUnselectedLabels = false;
        });
        break;
      case 1:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.circle;
          padding = EdgeInsets.zero;
          bottomBarShape = RoundedRectangleBorder(borderRadius: _borderRadius);
          showSelectedLabels = false;
          showUnselectedLabels = false;
        });
        break;

      case 2:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.rectangle;
          padding = EdgeInsets.zero;
          bottomBarShape = BeveledRectangleBorder(borderRadius: _borderRadius);
          showSelectedLabels = true;
          showUnselectedLabels = true;
        });
        break;
      case 3:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.indicator;
          padding = EdgeInsets.zero;
          bottomBarShape = null;
          showSelectedLabels = false;
          showUnselectedLabels = false;
        });
        break;
    }
  }
}

class PagerPageWidget extends StatelessWidget {
  final String? text;
  final String? description;
  final Image? image;
  final TextStyle titleStyle =
      const TextStyle(fontSize: 40, fontFamily: 'SourceSerifPro');
  final TextStyle subtitleStyle = const TextStyle(
    fontSize: 20,
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w200,
  );

  const PagerPageWidget({
    Key? key,
    this.text,
    this.description,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _portraitWidget()
              : _horizontalWidget(context);
        }),
      ),
    );
  }

  Widget _portraitWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(text!, style: titleStyle),
            const SizedBox(height: 16),
            Text(description!, style: subtitleStyle),
          ],
        ),
        image!
      ],
    );
  }

  Widget _horizontalWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(text!, style: titleStyle),
              Text(description!, style: subtitleStyle),
            ],
          ),
        ),
        Expanded(child: image!)
      ],
    );
  }
}
