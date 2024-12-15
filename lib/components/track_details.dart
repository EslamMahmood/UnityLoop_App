import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackDetailsPage extends StatelessWidget {
  final String name;
  final String description;
  final List<String> certifications;
  final List<Map<String, String>> youtubeLinks;
  final Map<String, List<Map<String, String>>> certificationResources;

  const TrackDetailsPage({
    required this.name,
    required this.description,
    required this.certifications,
    required this.youtubeLinks,
    required this.certificationResources,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Card(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : Color(0xFF1E1E1E),
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(description, style: TextStyle(fontSize: 16)),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Text(
                'Certifications',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              for (var cert in certifications)
                Card(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Color(0xFF1E1E1E), // Dark color for dark mode
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  cert,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                if (certificationResources[cert] != null)
                                  for (var resource
                                      in certificationResources[cert]!)
                                    ListTile(
                                      title: Text(
                                        resource['name'] ?? '',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      trailing: Icon(Icons.open_in_new),
                                      onTap: () async {
                                        final url = resource['url'];
                                        if (url != null) {
                                          final uri = Uri.parse(url);
                                          if (await canLaunchUrl(uri)) {
                                            await launchUrl(uri);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        }
                                      },
                                    )
                                else
                                  Text('No resources available'),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.teal),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              cert,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(Icons.arrow_drop_down, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Text(
                'YouTube Links',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              for (var link in youtubeLinks)
                Card(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Color(0xFF1E1E1E), // Dark color for dark mode
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () async {
                      final url = link['url'];
                      if (url != null) {
                        final uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.link, color: Colors.teal, size: 24),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              link['name'] ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
