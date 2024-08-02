import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

// Define the Project class
class Project {
  final String name;
  final String description;
  final String client;
  final String outcome;
  final String imageUrl;
  final String type;
  final DateTime date;
  final int relevance;

  Project({
    required this.name,
    required this.description,
    required this.client,
    required this.outcome,
    required this.imageUrl,
    required this.type,
    required this.date,
    required this.relevance,
  });
}

// Sample project data
List<Project> projects = [
  Project(
    name: 'Alpha Project',
    description: "Project Alpha was a cinematography and multimedia project focused on producing high-quality video content to enhance clients' brand messaging and promotional efforts.",
    client: 'Client A',
    outcome: 'The outcome of Project Alpha was a notable boost in brand visibility and engagement, with clients experiencing increased viewer interaction and a wider audience reach.',
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnkJQKVB4dWSmUjqb2uXDHad9n7YS7Kr4-OQ&s",
    type: 'Multimedia Production',
    date: DateTime(2024, 7, 1),
    relevance: 5,
  ),
  Project(
    name: 'Beta Project',
    description: "Project Beta was a social media marketing campaign aimed at increasing brand awareness and engagement through targeted ads and creative content.",
    client: 'Client B',
    outcome: "The outcome of Project Beta was a significant rise in brand visibility, follower growth, and user engagement across social media platforms.",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnkJQKVB4dWSmUjqb2uXDHad9n7YS7Kr4-OQ&s",
    type: 'Promotion',
    date: DateTime(2024, 6, 15),
    relevance: 4,
  ),
  Project(
    name: 'Gamma Project',
    description: "Project Gamma was a portfolio photography initiative where the company focused on capturing high-quality, visually striking images to showcase clients' work or products. The project aimed to create a professional and compelling visual portfolio that highlighted key features and appealed to target audiences.",
    client: 'Client C',
    outcome: 'The outcome of Project Gamma was a striking portfolio that boosted client visibility and attracted more business opportunities.',
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnkJQKVB4dWSmUjqb2uXDHad9n7YS7Kr4-OQ&s",
    type: 'Multimedia Production',
    date: DateTime(2024, 5, 10),
    relevance: 3,
  ),
  Project(
    name: 'Delta Project',
    description: "Project Delta was a music video promotion initiative focused on creating and executing promotional strategies to enhance the visibility and reach of a music video. The project aimed to engage audiences and drive higher viewership through targeted marketing efforts.",
    client: 'Client D',
    outcome: "The outcome of Project Delta was a substantial increase in music video views and engagement, successfully expanding the artist's audience reach.",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnkJQKVB4dWSmUjqb2uXDHad9n7YS7Kr4-OQ&s",
    type: 'Promotion',
    date: DateTime(2024, 4, 25),
    relevance: 2,
  ),
  Project(
    name: 'Epsilon Project',
    description: "Project Epsilon was a music production venture focused on creating and recording high-quality music tracks. The project aimed to deliver polished, professional soundscapes tailored to the artistic vision of the clients.",
    client: 'Client E',
    outcome: "The outcome of Project Epsilon was a set of professionally produced music tracks that met clients' artistic goals and received positive feedback for their quality and sound.",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnkJQKVB4dWSmUjqb2uXDHad9n7YS7Kr4-OQ&s",
    type: 'Multimedia Production',
    date: DateTime(2024, 3, 20),
    relevance: 1,
  ),
  Project(
    name: 'Zeta Project',
    description: "Project Zeta was a promotion initiative for a food outlet, focusing on enhancing its visibility and attracting customers through targeted marketing and advertising strategies.",
    client: 'Client F',
    outcome: "The outcome of Project Zeta was a noticeable increase in foot traffic and sales for the food outlet, driven by heightened brand awareness and effective promotional efforts.",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnkJQKVB4dWSmUjqb2uXDHad9n7YS7Kr4-OQ&s",
    type: 'Promotion',
    date: DateTime(2024, 2, 14),
    relevance: 4,
  ),
  Project(
    name: 'Theta Project',
    description: "Project Theta was an influencer marketing campaign aimed at promoting brands by leveraging influential personalities to reach and engage target audiences through sponsored content and endorsements.",
    client: 'Client H',
    outcome: "The outcome of Project Theta was a significant boost in brand awareness and engagement, with increased reach and credibility achieved through effective influencer endorsements.",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnkJQKVB4dWSmUjqb2uXDHad9n7YS7Kr4-OQ&s",
    type: 'Promotion',
    date: DateTime(2023, 12, 30),
    relevance: 5,
  ),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  String _selectedType = 'All';
  String _selectedSort = 'Date New to Old';
  String _selectedRelevance = 'Relevance High to Low';

  @override
  Widget build(BuildContext context) {
    List<Project> filteredProjects = _filterProjects(projects, _selectedType);
    List<Project> sortedProjects = _sortProjects(filteredProjects, _selectedSort, _selectedRelevance);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Portfolio')),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              _showFilterMenu(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProjectGallery(projects: sortedProjects),
      ),
    );
  }

  void _showFilterMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildFilterOption('All', 'Type'),
            _buildFilterOption('Multimedia Production', 'Type'),
            _buildFilterOption('Promotion', 'Type'),
            _buildFilterOption('Date Old to New', 'Date'),
            _buildFilterOption('Date New to Old', 'Date'),
            _buildFilterOption('Relevance Low to High', 'Relevance'),
            _buildFilterOption('Relevance High to Low', 'Relevance'),
          ],
        );
      },
    );
  }

  Widget _buildFilterOption(String title, String filterType) {
    return ListTile(
      title: Text(title),
      onTap: () {
        setState(() {
          if (filterType == 'Type') {
            _selectedType = title;
          } else if (filterType == 'Date') {
            _selectedSort = title;
          } else if (filterType == 'Relevance') {
            _selectedRelevance = title;
          }
        });
        Navigator.pop(context);
      },
    );
  }

  List<Project> _filterProjects(List<Project> projects, String type) {
    if (type == 'All') {
      return projects;
    }
    return projects.where((project) => project.type == type).toList();
  }

  List<Project> _sortProjects(List<Project> projects, String sortBy, String relevanceBy) {
    List<Project> sortedProjects = List.from(projects);

    if (sortBy == 'Date New to Old') {
      sortedProjects.sort((a, b) => b.date.compareTo(a.date));
    } else if (sortBy == 'Date Old to New') {
      sortedProjects.sort((a, b) => a.date.compareTo(b.date));
    }

    if (relevanceBy == 'Relevance High to Low') {
      sortedProjects.sort((a, b) => b.relevance.compareTo(a.relevance));
    } else if (relevanceBy == 'Relevance Low to High') {
      sortedProjects.sort((a, b) => a.relevance.compareTo(b.relevance));
    }

    return sortedProjects;
  }
}

class ProjectGallery extends StatelessWidget {
  final List<Project> projects;

  ProjectGallery({required this.projects});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.75,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectDetailPage(project: project),
              ),
            );
          },
          child: ProjectCard(project: project),
        );
      },
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.network(
                project.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              project.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              project.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Client: ${project.client}',
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.share, size: 20.0),
                  onPressed: () {
                    Share.share(
                      'Check out this project: ${project.name}\n${project.description}\n${project.imageUrl}',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  ProjectDetailPage({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  project.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              project.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8.0),
            Text(
              'Description: ${project.description}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8.0),
            Text(
              'Client: ${project.client}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8.0),
            Text(
              'Outcome: ${project.outcome}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
