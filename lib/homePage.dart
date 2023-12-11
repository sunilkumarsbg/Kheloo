import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final VideoPlayerController _controller = VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');

  @override
  void initState() {
    super.initState();
    _controller.initialize().then((_) {
      setState(() {}); // Ensure the video is initialized and loaded
      _controller.play(); // Optionally, play the video immediately
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: 24,
            width: 24,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50, // Adjust height as needed
                    width: 100, // Adjust width as needed
                    child: Image.asset(
                      'assets/images/logo.png', // Replace with your image path
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: const [
                            Icon(Icons.wallet_giftcard, color: Colors.yellow),
                            Text(
                              "Promation",
                              style: TextStyle(fontSize: 11, color: Colors.yellowAccent),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        color: Colors.yellow,
                        child: const Expanded(child: Center(child: Text("LOGIN"))),
                      ),
                    ],
                  )
                ],
              ),
              CarouselSliderWidget(),
              const SizedBox(height: 10),
              DotIndicater(),
              const SizedBox(height: 10),
              Container(
                color: Colors.pinkAccent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      LanguageText(text: 'English', languageCode: 'en'),
                      LanguageText(text: 'Hindi', languageCode: 'es'),
                      LanguageText(text: 'Kanada', languageCode: 'fr'),
                      LanguageText(text: 'Tamil', languageCode: 'de'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Image.asset("assets/images/point.png"),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.purple,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            child: UserCard(
                              username: 'A',
                              price: '\$20',
                              subtitle: '3 hours ago',
                            ),
                          ),
                          Expanded(
                            child: UserCard(
                              username: 'S',
                              price: '\$20',
                              subtitle: '3 hours ago',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: UserCard(
                              username: 'A',
                              price: '\$20',
                              subtitle: '3 hours ago',
                            ),
                          ),
                          Expanded(
                            child: UserCard(
                              username: 'D',
                              price: '\$20',
                              subtitle: '3 hours ago',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                  child: Column(
                children: [
                  Text("GAME", style: TextStyle(fontSize: 24.0, color: Colors.yellow),
                  ),
                  Text("______________", style: TextStyle(fontSize: 24.0, color: Colors.yellow),)
                ],
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "|| Most Popular (15)",
                      style: TextStyle(fontSize: 15.0, color: Colors.yellow),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("ShowMore"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow))),
                  ],
                ),
              ),
              Container(
                height: 450, // Set a specific height for the GridView
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(4, (index) {
                    return Card(
                      color: Colors.yellow,
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                            child: Image.asset(
                          "assets/images/${index + 1}.png",
                          fit: BoxFit.cover,
                        )),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 10),
              // Center(
              //   child: _controller.value.isInitialized
              //       ? AspectRatio(
              //           aspectRatio: _controller.value.aspectRatio,
              //           child: VideoPlayer(_controller),
              //         )
              //       : Center(child: CircularProgressIndicator()), // Show loader until video is initialized
              // ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.yellow,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.surround_sound),
                label: 'Support',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: 'Sport',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.casino_outlined),
                label: 'Live Casino',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> imageList = [
  'assets/images/banner.png',
  'assets/images/banner.png',
  'assets/images/banner.png',
  'assets/images/banner.png',
  // Replace with your image paths
];

Widget CarouselSliderWidget() {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: CarouselSlider(
      items: imageList.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        // autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        enableInfiniteScroll: true,
        viewportFraction: 0.8,
      ),
    ),
  );
}

Widget DotIndicater() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: imageList.map((url) {
      int index = imageList.indexOf(url);
      return Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey.withOpacity(index == 0 ? 0.9 : 0.4),
        ),
      );
    }).toList(),
  );
}

class LanguageText extends StatelessWidget {
  final String text;
  final String languageCode;

  const LanguageText({required this.text, required this.languageCode});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 12.0, color: Colors.yellow),
    );
  }
}

class UserCard extends StatelessWidget {
  final String username;
  final String price;
  final String subtitle;

  const UserCard({
    required this.username,
    required this.price,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.purple,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text(
                  username,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "User",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    Text(
                      ' $price',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  "   " + '$subtitle',
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ],
            )
          ],
        ));
  }
}
