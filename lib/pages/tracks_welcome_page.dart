import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/button.dart';
import 'package:project/components/drawer.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/payment_page.dart';
import 'package:project/pages/profile_page.dart';

import 'tracks_page.dart';

class TracksWelcomePage extends StatefulWidget {
  @override
  State<TracksWelcomePage> createState() => _TracksWelcomePageState();
}

class _TracksWelcomePageState extends State<TracksWelcomePage> {
  void start() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TracksPage(),
      ),
    );
  }

  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  void goToCommunityPage() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FieldFinder',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: MyDrawer(
        onHomeTap: goToCommunityPage,
        onProfileTap: goToProfilePage,
        onSignOutTap: signOut,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Text(
                'Welcome to Our Community!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Explore and advance your skills in various programming fields through our expertly curated tracks. Whether you're a beginner or looking to deepen your knowledge, our tracks cater to all levels. Each track offers a structured learning path, hands-on activities, and resources designed to help you succeed in your career or academic goals.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 25),
              const Divider(thickness: 1.5),
              const SizedBox(height: 25),

              // Tracks Section
              Row(
                children: [
                  Icon(Icons.verified_outlined,
                      color: Colors.blueAccent, size: 28),
                  const SizedBox(width: 8),
                  Text(
                    'Available Tracks',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildTrackCard(
                'Computer Science (CS)',
                'Dive into data structures, algorithms, popular programming languages, and software development.',
              ),
              _buildTrackCard(
                'Information Technology (IT)',
                'Learn about networking, operating systems, cybersecurity, and IT infrastructure.',
              ),
              _buildTrackCard(
                'Information Systems (IS)',
                'Understand system analysis, design, and database management.',
              ),
              const SizedBox(height: 25),
              const Divider(thickness: 1.5),
              const SizedBox(height: 25),

              // Why Choose a Track Section
              Row(
                children: [
                  Icon(Icons.help_outline, color: Colors.red, size: 28),
                  const SizedBox(width: 8),
                  Text(
                    'Why Choose a Track?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildBulletPoint(
                'Structured Learning Path: Follow a clear roadmap for mastering a field with all you need to know.',
              ),
              _buildBulletPoint(
                'Comprehensive Content: Access online videos, important information about each field, and interactive assignments.',
              ),
              _buildBulletPoint(
                'Certification: Complete a track to earn a certificate and showcase your skills. We will also guide you on the most relevant certifications.',
              ),
              const SizedBox(height: 25),
              const Divider(thickness: 1.5),
              const SizedBox(height: 25),

              // Benefits Section
              Row(
                children: [
                  Icon(Icons.star_border, color: Colors.white, size: 28),
                  const SizedBox(width: 8),
                  Text(
                    'Benefits of Joining',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildBulletPoint(
                'Community Support: Collaborate with peers and experts.',
              ),
              _buildBulletPoint(
                'Practical Knowledge: Learn through real-world projects and challenges.',
              ),
              _buildBulletPoint(
                'Flexible Learning: Access content anytime, anywhere.',
              ),
              const SizedBox(height: 24),

              // Call to Action
              Center(
                child: MyButton(onTap: start, text: 'Join us'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackCard(String title, String description) {
    return Card(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Color(0xFF1E1E1E), // Dark color for dark mode
      margin: const EdgeInsets.symmetric(vertical: 12),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.track_changes, size: 40, color: Colors.teal),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 24, color: Colors.teal),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
