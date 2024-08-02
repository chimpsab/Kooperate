import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:internship_project/pages/portfoliopage.dart';
import 'package:internship_project/pages/servicepage.dart';
// import 'package:internship_project/components/searchbar.dart'; // Uncomment if the SearchBar component is available

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imagePath = [
    "lib/images/totoro.jpg",
    "lib/images/Tiny-Tan.jpg",
    "lib/images/bts1.jpg",
    "lib/images/tinytans.jpg",
  ];

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      imagePath.length,
      (index) => ImagePlaceholder(imagePath: imagePath[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
              // Uncomment the following line if the SearchBar component is available
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchBar()));
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              // Handle user profile or other action
            },
            icon: const Icon(Icons.person, color: Colors.black),
          ),
        ],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              const DrawerHeader(
                child: Image(image: AssetImage('lib/images/1.png')),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  
                  /*gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.red,
                    ],
                  )*/
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CarouselSlider(
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
              options: CarouselOptions(height: 500),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 300,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                );
              },
              childCount: 6,
            ),
          ),
        ],
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
