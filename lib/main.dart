import 'package:flutter/material.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfolio",
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/projects': (context) => ProjectsPage(),
      },
    );
  }
}

// ================= Home Page =================
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background black
      appBar: AppBar(title: Text("My Portfolio")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            SizedBox(height: 15),
            Text(
              "Hi, I'm Yashovardhan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Flutter Developer",
              style: TextStyle(fontSize: 16, color: Colors.grey[300]),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: Text("About Me"),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/projects'),
              child: Text("Projects"),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= About Page =================
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Me")),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://tse4.mm.bing.net/th/id/OIP.Kiw2Xg5a1zOJjBua3DWOKQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "I'm a passionate Flutter developer.\n"
                  "I love building mobile apps, reading novels,\n"
                  "and continuously learning programming.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                  label: Text("Back to Home"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= Projects Page =================
class ProjectsPage extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {
      "title": "Weather App",
      "icon": Icons.cloud,
      "desc": "Get real-time weather updates.",
    },
    {
      "title": "Music Player",
      "icon": Icons.music_note,
      "desc": "Play and manage your music.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Projects")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: ListTile(
              leading: Icon(project["icon"], color: Colors.blue, size: 35),
              title: Text(
                project["title"],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(project["desc"]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.home),
      ),
    );
  }
}
