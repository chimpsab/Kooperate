import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final List<Service> services = [
    Service(
      image: 'lib/images/download.jpeg',
      title: 'Portfolio Photography',
      subtitle:
          'A portfolio is your visual resume, showcasing your skills, creativity, and professionalism, making it crucial for leaving a lasting impression in the industry.',
      price: 'Rs.9,999.00',
    ),
    Service(
      image: 'lib/images/music.jpg',
      title: 'Music Production',
      subtitle:
          'Create high-quality music tracks for various needs, from personal projects to commercial releases.',
      price: 'Rs.59,999.00',
    ),
    Service(
      image: 'lib/images/cinema.jpg',
      title: 'Cinematography',
      subtitle: 'Professional film and video production services for any project.',
      price: 'Rs.10,999.00',
    ),
  ];

  final List<Promotion> promotions = [
    Promotion(
      image: 'lib/images/SMM.jpg',
      title: 'Social Media Marketing',
      subtitle:
          'A portfolio is your visual resume, showcasing your skills, creativity, and professionalism, making it crucial for leaving a lasting impression in the industry.',
      price: 'Rs.9,999.00',
    ),
    Promotion(
      image: 'lib/images/music.jpg',
      title: 'Music Video Promotion',
      subtitle:
          'Create high-quality music tracks for various needs, from personal projects to commercial releases.',
      price: 'Rs.59,999.00',
    ),
    Promotion(
      image: 'lib/images/food.jpg',
      title: 'Food Outlet Promotions',
      subtitle: 'Professional film and video production services for any project.',
      price: 'Rs.10,999.00',
    ),
  ];

  final List<Testimonial> testimonials = [
    Testimonial(
      customerName: 'Prachiti Gupta',
      feedback: 'Amazing service! Highly recommended.',
    ),
    Testimonial(
      customerName: 'Riya Sharma',
      feedback: 'Great experience with the team, very professional.',
    ),
    Testimonial(
      customerName: 'Priyanshu Gupta',
      feedback: 'Fantastic results, exceeded my expectations!',
    ),
  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Service Page'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text(
                'S E R V I C E S',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    services[index].image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(services[index].title),
                  subtitle: Text(services[index].subtitle),
                  trailing: Text(services[index].price),
                );
              },
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'P R O M O T I O N S',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: promotions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    promotions[index].image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(promotions[index].title),
                  subtitle: Text(promotions[index].subtitle),
                  trailing: Text(promotions[index].price),
                );
              },
            ),
            const SizedBox(height: 25),

            // Customer Testimonials 
            const Center(
              child: Text(
                'C U S T O M E R  T E S T I M O N I A L S',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            CarouselSlider.builder(
              itemCount: testimonials.length,
              itemBuilder: (context, index, realIndex) {
                final testimonial = testimonials[index];
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.person, size: 50),
                      const SizedBox(height: 10),
                      Text(
                        testimonial.customerName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        testimonial.feedback,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(height: 20),

            // Enquiry Form Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return 'Please enter your name';
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return 'Please enter your email';
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return 'Please enter your phone number';
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _messageController,
                            decoration: const InputDecoration(
                              labelText: 'Message',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 10,
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return 'Please enter your message';
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Send the enquiry
                                print('Name: ${_nameController.text}');
                                print('Email: ${_emailController.text}');
                                print('Phone Number: ${_phoneController.text}');
                                print('Message: ${_messageController.text}');
                              }
                            },
                            child: const Text('Send Enquiry'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Service {
  final String image;
  final String title;
  final String subtitle;
  final String price;

  Service({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  });
}

class Promotion {
  final String image;
  final String title;
  final String subtitle;
  final String price;

  Promotion({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  });
}

class Testimonial {
  final String customerName;
  final String feedback;

  Testimonial({
    required this.customerName,
    required this.feedback,
  });
}

void main() {
  runApp(MaterialApp(
    home: ServicePage(),
  ));
}
