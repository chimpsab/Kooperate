import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:internship_project/pages/portfoliopage.dart';
import 'package:internship_project/pages/servicepage.dart';
import 'package:internship_project/pages/userlogin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imagePath = [
    "lib/images/photoshoot.jpg",
    "lib/images/production.jpg",
    "lib/images/musicp.jpg",
    "lib/images/food.png",
  ];

  late List<Widget> _pages;

  //User details
  String userName = 'Anushka Bhardwaj';
  String userEmail = 'ab@mail.com';

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      imagePath.length,
      (index) => ImagePlaceholder(imagePath: imagePath[index]),
    );

    // TODO: Load the actual user data here
    // For example, you could load this data from a user profile service or Firebase
    // setState(() {
    //   userName = fetchedUserName;
    //   userEmail = fetchedUserEmail;
    //   userImageUrl = fetchedUserImageUrl;
    // });
  }

  // Sign out function
  void onSignOut() {

    // Navigate to the login page
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage(onTap: () {  },)), //ERROR
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Center(
          child: Image(
            image: AssetImage('lib/images/2.png'),
            height: 120,
            alignment: Alignment.center,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchBar()));
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.person, color: Colors.black),
              );
            },
          ),
        ],
        centerTitle: true,
      ),

      // DRAWER
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              const DrawerHeader(
                child: Image(image: AssetImage('lib/images/1.png')),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  'Home',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.design_services),
                title: const Text(
                  'Services',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ServicePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text(
                  'Portfolio',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PortfolioPage()));
                },
              ),
            ],
          ),
        ),
      ),

      // END-DRAWER with dynamic user details
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(userName),
              accountEmail: Text(userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: onSignOut,
            ),
          ],
        ),
      ),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: _pages.map((page) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        child: page,
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(height: 400),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Center(
                      child: Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        'Welcome to Kooperate!',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        'We are dedicated to providing the best services to help you achieve your goals. '
                            'Our team is made up of experienced professionals who are passionate about what they do. '
                            'We specialize in Photoshoots, Music Productions and Many more, and our mission is to ABCD. '
                            'Feel free to explore our website and learn more about what we have to offer.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        'Feel free to explore our website and learn more about what we have to offer.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final String imagePath;

  const ImagePlaceholder({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, fit: BoxFit.cover);
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
