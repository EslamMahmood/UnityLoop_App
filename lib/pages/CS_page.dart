import 'package:flutter/material.dart';
import 'package:project/components/card.dart';
import 'package:project/components/track_details.dart';

class CSPage extends StatelessWidget {
  final List<Map<String, dynamic>> csTracks = [
    {
      "name": "Mobile Development",
      "description":
          "Master the art of mobile application development for both Android and iOS. From the fundamentals of Flutter and React Native to cloud integration with Firebase and Azure, this track provides the knowledge and hands-on experience to build high-quality apps. Whether designing user interfaces or managing backend services, this track will guide you through every step of mobile app development, ensuring you're equipped to deploy apps on both Android and iOS platforms with confidence.",
      "certifications": [
        "Google Associate Android Developer Certification",
        "Apple Certified iOS Developer (ACiD)",
        "Flutter Certified Developer",
        "Microsoft Certified: Azure Developer Associate",
        "React Native Certification",
        "Firebase Certified Developer",
        "Certified Mobile App Developer (Mobile Development Institute)"
      ],
      "youtubeLinks": [
        {
          "name": "How to master this track ?!",
          "url": "https://www.youtube.com/watch?v=yye7rSsiV6k&t=7s"
        },
        {
          "name": "Introduction to dart and flutter",
          "url": "https://www.youtube.com/watch?v=yye7rSsiV6k&t=7s"
        },
        {
          "name": "React Native Tutorial",
          "url": "https://www.youtube.com/watch?v=2V1e8Rx_zas"
        },
        {
          "name": "Flutter for Beginners",
          "url": "https://www.youtube.com/watch?v=1gDhl4leEzA"
        },
        {
          "name": "Mastering React Native",
          "url": "https://www.youtube.com/watch?v=0-S5a0eXPoc"
        },
        {
          "name": "Firebase Authentication in Flutter",
          "url": "https://www.youtube.com/watch?v=fsj9A0X_K2M"
        },
        {
          "name": "Build a To-Do App in React Native",
          "url": "https://www.youtube.com/watch?v=OkzGZ1kTcXI"
        },
        {
          "name": "How to Build Mobile Apps with Azure",
          "url": "https://www.youtube.com/watch?v=RkRdo4K5Yv4"
        },
        {
          "name": "Deploying Flutter Apps to Google Play & App Store",
          "url": "https://www.youtube.com/watch?v=H4qxZGiI1-0"
        },
        {
          "name": "Advanced Flutter UI Design",
          "url": "https://www.youtube.com/watch?v=JXszdSYryPQ"
        }
      ],
      "certificationResources": {
        "Google Associate Android Developer Certification": [
          {
            "name": "Official Google Certification Page",
            "url": "https://developers.google.com/certification/android"
          }
        ],
        "Apple Certified iOS Developer (ACiD)": [
          {
            "name": "ACiD Certification Details",
            "url": "https://developer.apple.com"
          }
        ],
        "Flutter Certified Developer": [
          {"name": "Flutter Certification Guide", "url": "https://flutter.dev"}
        ],
        "Microsoft Certified: Azure Developer Associate": [
          {
            "name": "Azure Developer Associate Certification",
            "url":
                "https://learn.microsoft.com/en-us/certifications/azure-developer-associate/"
          }
        ],
        "React Native Certification": [
          {
            "name": "React Native Certification Details",
            "url": "https://reactnative.dev"
          }
        ],
        "Firebase Certified Developer": [
          {
            "name": "Firebase Certified Developer",
            "url": "https://firebase.google.com/docs/learn"
          }
        ],
      },
      "icon": Icons.phone_android,
      "iconColor": Colors.green,
    },
    {
      "name": "Web Development",
      "description":
          "Become a skilled web developer by mastering both frontend and backend technologies. This track will guide you through building dynamic websites and applications using modern web development tools and frameworks. From HTML, CSS, and JavaScript to advanced backend technologies like Node.js and databases, you'll gain the expertise to create full-stack web solutions. Whether you want to specialize in frontend design or full-stack development, this track offers certifications and resources to support your journey to becoming a professional web developer.",
      "certifications": [
        "Full Stack Developer",
        "Frontend Specialist",
        "Backend Developer Certification",
        "JavaScript Developer Certification",
        "React.js Developer Certification",
        "Node.js Developer Certification"
      ],
      "youtubeLinks": [
        {
          "name": "How to master this track ?!",
          "url": "https://www.youtube.com/watch?v=UB1O30fR-EE"
        },
        {
          "name": "HTML and CSS Basics",
          "url": "https://www.youtube.com/watch?v=UB1O30fR-EE"
        },
        {
          "name": "JavaScript for Beginners",
          "url": "https://www.youtube.com/watch?v=W6NZfCO5SIk"
        },
        {
          "name": "Understanding React.js",
          "url": "https://www.youtube.com/watch?v=DLX62G4lc44"
        },
        {
          "name": "Node.js Tutorial for Beginners",
          "url": "https://www.youtube.com/watch?v=TlB_eWDSMt4"
        },
        {
          "name": "Building a Full-Stack App with React and Node.js",
          "url": "https://www.youtube.com/watch?v=4rRk6tjVwH0"
        },
        {
          "name": "CSS Flexbox and Grid Tutorial",
          "url": "https://www.youtube.com/watch?v=1RSYoHDhaZk"
        },
        {
          "name": "Introduction to MongoDB and Express",
          "url": "https://www.youtube.com/watch?v=bxpNf7pF4uw"
        },
        {
          "name": "Mastering JavaScript ES6",
          "url": "https://www.youtube.com/watch?v=NCwa_xi0Uuc"
        },
        {
          "name": "Vue.js Tutorial for Beginners",
          "url": "https://www.youtube.com/watch?v=4deVCNJq3qc"
        }
      ],
      "certificationResources": {
        "Full Stack Developer": [
          {
            "name": "Full Stack Development Resources",
            "url": "https://www.fullstackacademy.com"
          },
          {"name": "The Odin Project", "url": "https://www.theodinproject.com"}
        ],
        "Frontend Specialist": [
          {
            "name": "Frontend Development Resources",
            "url": "https://www.frontendmasters.com"
          },
          {"name": "CSS-Tricks", "url": "https://css-tricks.com"}
        ],
        "Backend Developer Certification": [
          {"name": "Node.js Resources", "url": "https://nodejs.org/en/docs/"},
          {"name": "Express.js Documentation", "url": "https://expressjs.com"}
        ],
        "JavaScript Developer Certification": [
          {"name": "JavaScript.info", "url": "https://javascript.info"},
          {
            "name": "MDN JavaScript Guide",
            "url":
                "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide"
          }
        ]
      },
      "icon": Icons.web,
      "iconColor": Colors.blue,
    },
    {
      "name": "Data Science",
      "description":
          "Dive into the world of data science where you'll learn to analyze, interpret, and visualize complex data to drive business decisions. This track covers essential topics such as data cleaning, exploratory data analysis (EDA), machine learning, and big data analytics. Whether you're interested in becoming a data analyst or a data scientist, this track equips you with the tools and techniques necessary to unlock the power of data. You'll also gain hands-on experience with popular data science tools like Python, R, SQL, and various machine learning libraries.",
      "certifications": [
        "Data Analyst",
        "Data Scientist",
        "Machine Learning Specialist",
        "Big Data Developer Certification",
        "Deep Learning Certification",
        "AI & Data Science Professional Certification"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to Data Science",
          "url": "https://www.youtube.com/watch?v=xC-c7E5PK0Y"
        },
        {
          "name": "Data Visualization Techniques",
          "url": "https://www.youtube.com/watch?v=2LhoCfjm8R4"
        },
        {
          "name": "Python for Data Science",
          "url": "https://www.youtube.com/watch?v=7eh4d6sabA0"
        },
        {
          "name": "SQL for Data Science",
          "url": "https://www.youtube.com/watch?v=HXV3zeQKqGY"
        },
        {
          "name": "Machine Learning for Beginners",
          "url": "https://www.youtube.com/watch?v=Gv9_4yMHFhI"
        },
        {
          "name": "Data Preprocessing with Python",
          "url": "https://www.youtube.com/watch?v=VmTrb2ke1nA"
        },
        {
          "name": "Introduction to Deep Learning",
          "url": "https://www.youtube.com/watch?v=6M5VXKLf4D4"
        },
        {
          "name": "Big Data Analytics with Hadoop",
          "url": "https://www.youtube.com/watch?v=I20TxVd76Yk"
        },
        {
          "name": "Data Science Projects for Beginners",
          "url": "https://www.youtube.com/watch?v=5Uu1H2hV82o"
        }
      ],
      "certificationResources": {
        "Data Analyst": [
          {
            "name": "Data Analyst Certification Guide",
            "url": "https://www.coursera.org/certifications/data-analyst"
          },
          {
            "name": "Data Analyst Learning Path",
            "url":
                "https://www.udacity.com/course/data-analyst-nanodegree--nd002"
          }
        ],
        "Data Scientist": [
          {
            "name": "Data Science Specialization",
            "url": "https://www.coursera.org/specializations/jhu-data-science"
          },
          {
            "name": "Data Science Career Track",
            "url": "https://www.springboard.com/workshops/data-science/"
          }
        ],
        "Machine Learning Specialist": [
          {
            "name": "Machine Learning by Stanford University",
            "url": "https://www.coursera.org/learn/machine-learning"
          },
          {
            "name": "Advanced Machine Learning Specialization",
            "url":
                "https://www.coursera.org/specializations/advanced-machine-learning"
          }
        ],
        "Big Data Developer Certification": [
          {
            "name": "Big Data Certification Program",
            "url":
                "https://www.edx.org/professional-certificate/uc-berkeleyx-big-data-analytics"
          },
          {
            "name": "Big Data Hadoop Developer",
            "url":
                "https://www.simplilearn.com/big-data-and-analytics/big-data-hadoop-developer-certification-training"
          }
        ]
      },
      "icon": Icons.bar_chart,
      "iconColor": Colors.orange,
    },
    {
      "name": "Artificial Intelligence",
      "description": "Dive into machine learning and AI models.",
      "certifications": ["AI Engineer", "Machine Learning Specialist"],
      "youtubeLinks": [
        {
          "name": "AI Basics",
          "url": "https://www.youtube.com/watch?v=aircAruvnKk"
        },
        {
          "name": "Machine Learning Algorithms",
          "url": "https://www.youtube.com/watch?v=GwIo3gDZCVQ"
        }
      ],
      "certificationResources": {
        "AI Engineer": [
          {
            "name": "AI Engineer Certification Guide",
            "url": "https://www.ibm.com/certify/ai-engineer"
          }
        ],
        "Machine Learning Specialist": [
          {
            "name": "Machine Learning Specialist Resources",
            "url":
                "https://www.coursera.org/professional-certificates/machine-learning-specialist"
          }
        ]
      },
      "icon": Icons.person,
      "iconColor": Colors.purple,
    },
    {
      "name": "Game Development",
      "description":
          "Create interactive games using various game engines and programming languages.",
      "certifications": [
        "Unity Certified Developer",
        "Unreal Engine Certification",
        "Game Development Professional"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to Game Development",
          "url": "https://www.youtube.com/watch?v=onLOlsHHnlA"
        },
        {
          "name": "Game Engine Basics",
          "url": "https://www.youtube.com/watch?v=FTx0jJ9Ly9E"
        }
      ],
      "certificationResources": {
        "Unity Certified Developer": [
          {
            "name": "Unity Certification Overview",
            "url": "https://unity.com/certifications"
          }
        ],
        "Unreal Engine Certification": [
          {
            "name": "Unreal Engine Developer Certification",
            "url": "https://www.unrealengine.com/en-US/certification"
          }
        ],
        "Game Development Professional": [
          {
            "name": "Game Development Resources",
            "url":
                "https://www.udemy.com/course/game-development-professional-certification"
          }
        ]
      },
      "icon": Icons.videogame_asset,
      "iconColor": Colors.red,
    },
    {
      "name": "Blockchain Technology",
      "description":
          "Understand blockchain principles and develop decentralized applications.",
      "certifications": [
        "Certified Blockchain Developer",
        "Ethereum Developer Certification",
        "IBM Blockchain Foundation Developer"
      ],
      "youtubeLinks": [
        {
          "name": "Blockchain Basics",
          "url": "https://www.youtube.com/watch?v=pKxnB90p4vk"
        },
        {
          "name": "Building Decentralized Applications",
          "url": "https://www.youtube.com/watch?v=6WG7D47tGb0"
        }
      ],
      "certificationResources": {
        "Certified Blockchain Developer": [
          {
            "name": "Blockchain Developer Certification Details",
            "url":
                "https://www.blockchain-council.org/certifications/blockchain-developer/"
          }
        ],
        "Ethereum Developer Certification": [
          {
            "name": "Ethereum Developer Certification Guide",
            "url": "https://www.ethereum.org/developers"
          }
        ],
        "IBM Blockchain Foundation Developer": [
          {
            "name": "IBM Blockchain Foundation Course",
            "url": "https://www.ibm.com/courses/blockchain"
          }
        ]
      },
      "icon": Icons.account_balance_wallet,
      "iconColor": Colors.teal,
    },
    {
      "name": "Robotics and Automation",
      "description":
          "Learn how to design and program robotic systems for different applications.",
      "certifications": [
        "Robotics Engineering Certification",
        "Certified Automation Professional (CAP)",
        "ROS Developer Certification"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to Robotics",
          "url": "https://www.youtube.com/watch?v=rMwBw63X4Kg"
        },
        {
          "name": "Automation Principles",
          "url": "https://www.youtube.com/watch?v=3dO2v5Gw-Bg"
        }
      ],
      "certificationResources": {
        "Robotics Engineering Certification": [
          {
            "name": "Robotics Engineering Certification Details",
            "url": "https://www.robotics.org/certifications"
          }
        ],
        "Certified Automation Professional (CAP)": [
          {
            "name": "Certified Automation Professional Guide",
            "url": "https://www.automation.com/cap-certification"
          }
        ],
        "ROS Developer Certification": [
          {
            "name": "ROS Certification Resources",
            "url": "https://www.roboticsystemsimulator.com"
          }
        ]
      },
      "icon": Icons.android,
      "iconColor": Colors.brown,
    },
    {
      "name": "(AR/VR) Development",
      "description":
          "Explore AR(Augmented Reality) and VR(Virtual Reality) technologies for applications in various industries.",
      "certifications": [
        "Unity Certified AR/VR Developer",
        "Google AR/VR Developer Certification"
      ],
      "youtubeLinks": [
        {
          "name": "Getting Started with AR/VR Development",
          "url": "https://www.youtube.com/watch?v=Ejy88MJ1VKo"
        },
        {
          "name": "Building Your First AR App",
          "url": "https://www.youtube.com/watch?v=W95nkkF7X8g"
        }
      ],
      "certificationResources": {
        "Unity Certified AR/VR Developer": [
          {
            "name": "Unity AR/VR Developer Certification",
            "url": "https://unity.com/certifications/arvr"
          }
        ],
        "Google AR/VR Developer Certification": [
          {
            "name": "Google AR/VR Developer Resources",
            "url": "https://developers.google.com/arvr"
          }
        ]
      },
      "icon": Icons.remove_red_eye,
      "iconColor": Colors.pink,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'CS Department',
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
          child: GridView.builder(
            shrinkWrap:
                true, // Allows the GridView to take only as much space as needed
            physics:
                NeverScrollableScrollPhysics(), // Prevents the GridView from being scrollable itself
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: csTracks.length,
            itemBuilder: (context, index) {
              var track = csTracks[index];

              return TrackCard(
                name: track["name"],
                icon: track["icon"],
                iconColor: track["iconColor"],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrackDetailsPage(
                        name: track["name"],
                        description: track["description"],
                        certifications: track["certifications"],
                        youtubeLinks: track["youtubeLinks"],
                        certificationResources: track["certificationResources"],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
