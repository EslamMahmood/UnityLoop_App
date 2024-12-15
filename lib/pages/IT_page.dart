import 'package:flutter/material.dart';
import 'package:project/components/card.dart';
import 'package:project/components/track_details.dart';

class ITPage extends StatelessWidget {
  final List<Map<String, dynamic>> itTracks = [
    {
      "name": "Networking",
      "description":
          "Learn about computer networks, protocols, and troubleshooting.",
      "certifications": [
        "Cisco Certified Network Associate (CCNA)",
        "CompTIA Network+",
        "Juniper Networks Certified Associate (JNCIA)",
        "Certified Wireless Network Administrator (CWNA)"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to Networking",
          "url": "https://youtu.be/network1234"
        },
        {"name": "TCP/IP Explained", "url": "https://youtu.be/network5678"}
      ],
      "certificationResources": {
        "Cisco Certified Network Associate (CCNA)": [
          {
            "name": "CCNA Certification Guide",
            "url":
                "https://www.cisco.com/c/en/us/training-events/training-certifications/certifications/ccna.html"
          }
        ],
        "CompTIA Network+": [
          {
            "name": "Network+ Certification Guide",
            "url": "https://www.comptia.org/certifications/network"
          }
        ],
        "Juniper Networks Certified Associate (JNCIA)": [
          {
            "name": "JNCIA Certification Details",
            "url": "https://www.juniper.net/us/en/training/certification/jncia/"
          }
        ],
        "Certified Wireless Network Administrator (CWNA)": [
          {
            "name": "CWNA Certification Overview",
            "url": "https://www.cwnp.com/cwna/"
          }
        ]
      },
      "icon": Icons.router,
      "iconColor": Colors.blue
    },
    {
      "name": "DevOps and Automation",
      "description":
          "Learn practices to streamline development, deployment, and operations.",
      "certifications": [
        "Certified Kubernetes Administrator (CKA)",
        "Docker Certified Associate",
        "AWS Certified DevOps Engineer",
        "Google Professional DevOps Engineer"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to DevOps",
          "url": "https://youtu.be/devops1234"
        },
        {"name": "CI/CD Pipeline Basics", "url": "https://youtu.be/devops5678"}
      ],
      "certificationResources": {
        "Certified Kubernetes Administrator (CKA)": [
          {
            "name": "CKA Certification Guide",
            "url": "https://www.cncf.io/certification/cka/"
          }
        ],
        "Docker Certified Associate": [
          {
            "name": "Docker Certification Resources",
            "url": "https://www.docker.com/certification/"
          }
        ],
        "AWS Certified DevOps Engineer": [
          {
            "name": "AWS DevOps Engineer Resources",
            "url":
                "https://aws.amazon.com/certification/certified-devops-engineer-professional/"
          }
        ],
        "Google Professional DevOps Engineer": [
          {
            "name": "Google DevOps Engineer Resources",
            "url": "https://cloud.google.com/certification/devops-engineer"
          }
        ]
      },
      "icon": Icons.build,
      "iconColor": Colors.brown
    },
    {
      "name": "Systems Administration",
      "description": "Learn to manage and maintain IT systems.",
      "certifications": [
        "CompTIA Server+",
        "Red Hat Certified System Administrator (RHCSA)",
        "Microsoft Certified: Windows Server Administrator",
        "Linux Professional Institute Certification (LPIC-1)"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to Linux",
          "url": "https://youtu.be/sysadmin1234"
        },
        {
          "name": "Windows Server Administration Basics",
          "url": "https://youtu.be/sysadmin5678"
        }
      ],
      "certificationResources": {
        "CompTIA Server+": [
          {
            "name": "Server+ Certification Guide",
            "url": "https://www.comptia.org/certifications/server"
          }
        ],
        "Red Hat Certified System Administrator (RHCSA)": [
          {
            "name": "RHCSA Certification Guide",
            "url": "https://www.redhat.com/en/services/certification/rhcsa"
          }
        ],
        "Microsoft Certified: Windows Server Administrator": [
          {
            "name": "Windows Server Administrator Resources",
            "url":
                "https://learn.microsoft.com/en-us/certifications/windows-server-administrator/"
          }
        ],
        "Linux Professional Institute Certification (LPIC-1)": [
          {
            "name": "LPIC-1 Certification Details",
            "url": "https://www.lpi.org/our-certifications/lpic-1/"
          }
        ]
      },
      "icon": Icons.computer,
      "iconColor": Colors.green
    },
    {
      "name": "IT Governance and Compliance",
      "description":
          "Learn how to ensure IT processes comply with regulations and standards.",
      "certifications": [
        "Certified Information Systems Auditor (CISA)",
        "Certified Information Security Manager (CISM)",
        "ISO/IEC 27001 Lead Implementer",
        "COBIT 2019 Foundation"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to IT Governance",
          "url": "https://youtu.be/itgov1234"
        },
        {
          "name": "IT Compliance Best Practices",
          "url": "https://youtu.be/itgov5678"
        }
      ],
      "certificationResources": {
        "Certified Information Systems Auditor (CISA)": [
          {
            "name": "CISA Certification Details",
            "url": "https://www.isaca.org/credentialing/cisa"
          }
        ],
        "Certified Information Security Manager (CISM)": [
          {
            "name": "CISM Certification Resources",
            "url": "https://www.isaca.org/credentialing/cism"
          }
        ],
        "ISO/IEC 27001 Lead Implementer": [
          {
            "name": "ISO/IEC 27001 Certification Overview",
            "url": "https://www.iso.org/isoiec-27001-information-security.html"
          }
        ],
        "COBIT 2019 Foundation": [
          {
            "name": "COBIT 2019 Resources",
            "url": "https://www.isaca.org/resources/cobit"
          }
        ]
      },
      "icon": Icons.golf_course,
      "iconColor": Colors.purple
    },
    {
      "name": "IT Support",
      "description":
          "Gain skills for providing technical support and troubleshooting.",
      "certifications": [
        "Google IT Support Professional Certificate",
        "CompTIA IT Fundamentals (ITF+)",
        "Certified IT Support Technician",
        "HDI Desktop Support Technician"
      ],
      "youtubeLinks": [
        {"name": "IT Support Basics", "url": "https://youtu.be/itsupport1234"},
        {
          "name": "Troubleshooting Techniques",
          "url": "https://youtu.be/itsupport5678"
        }
      ],
      "certificationResources": {
        "Google IT Support Professional Certificate": [
          {
            "name": "Google IT Support Certificate Resources",
            "url":
                "https://www.coursera.org/professional-certificates/google-it-support"
          }
        ],
        "CompTIA IT Fundamentals (ITF+)": [
          {
            "name": "ITF+ Certification Overview",
            "url": "https://www.comptia.org/certifications/it-fundamentals"
          }
        ],
        "Certified IT Support Technician": [
          {
            "name": "Certified IT Support Technician Resources",
            "url": "https://www.hdi.com/certification/"
          }
        ],
        "HDI Desktop Support Technician": [
          {
            "name": "Desktop Support Technician Resources",
            "url": "https://www.hdi.com/certification/"
          }
        ]
      },
      "icon": Icons.headset,
      "iconColor": Colors.orange
    },
    {
      "name": "IT Infrastructure Management",
      "description":
          "Manage and maintain IT systems and network infrastructure.",
      "certifications": [
        "Cisco Certified Network Associate (CCNA)",
        "CompTIA Network+",
        "Microsoft Certified: Azure Infrastructure Solutions",
        "Certified Information Systems Administrator (CISA)"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to IT Infrastructure",
          "url": "https://youtu.be/infrastructure1234"
        },
        {
          "name": "Network Management Basics",
          "url": "https://youtu.be/infrastructure5678"
        }
      ],
      "certificationResources": {
        "Cisco Certified Network Associate (CCNA)": [
          {
            "name": "CCNA Certification Guide",
            "url":
                "https://www.cisco.com/c/en/us/training-events/training-certifications/certifications/ccna.html"
          }
        ],
        "CompTIA Network+": [
          {
            "name": "Network+ Certification Guide",
            "url": "https://www.comptia.org/certifications/network"
          }
        ],
        "Microsoft Certified: Azure Infrastructure Solutions": [
          {
            "name": "Azure Infrastructure Solutions Resources",
            "url":
                "https://learn.microsoft.com/en-us/certifications/azure-infrastructure-solutions/"
          }
        ],
        "Certified Information Systems Administrator (CISA)": [
          {
            "name": "CISA Certification Details",
            "url": "https://www.isaca.org/credentialing/cisa"
          }
        ]
      },
      "icon": Icons.info,
      "iconColor": Colors.red
    },
    {
      "name": "Cybersecurity",
      "description": "Learn to secure and protect IT systems and networks.",
      "certifications": [
        "Certified Ethical Hacker (CEH)",
        "CompTIA Security+",
        "Certified Information Systems Security Professional (CISSP)",
        "GIAC Security Essentials (GSEC)"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to Cybersecurity",
          "url": "https://youtu.be/cyber1234"
        },
        {"name": "Cyber Threats Explained", "url": "https://youtu.be/cyber5678"}
      ],
      "certificationResources": {
        "Certified Ethical Hacker (CEH)": [
          {
            "name": "CEH Certification Overview",
            "url":
                "https://www.eccouncil.org/programs/certified-ethical-hacker-ceh/"
          }
        ],
        "CompTIA Security+": [
          {
            "name": "Security+ Certification Resources",
            "url": "https://www.comptia.org/certifications/security"
          }
        ],
        "Certified Information Systems Security Professional (CISSP)": [
          {
            "name": "CISSP Certification Details",
            "url": "https://www.isc2.org/Certifications/CISSP"
          }
        ],
        "GIAC Security Essentials (GSEC)": [
          {
            "name": "GSEC Certification Resources",
            "url":
                "https://www.giac.org/certifications/security-essentials-gsec"
          }
        ]
      },
      "icon": Icons.security,
      "iconColor": Colors.pink
    },
    {
      "name": "Cloud Computing",
      "description": "Learn to work with cloud platforms and services.",
      "certifications": [
        "AWS Certified Solutions Architect",
        "Microsoft Certified: Azure Fundamentals",
        "Google Cloud Certified Professional Cloud Architect",
        "CompTIA Cloud+"
      ],
      "youtubeLinks": [
        {"name": "Cloud Basics", "url": "https://youtu.be/cloud1234"},
        {
          "name": "Deploying Applications in the Cloud",
          "url": "https://youtu.be/cloud5678"
        }
      ],
      "certificationResources": {
        "AWS Certified Solutions Architect": [
          {
            "name": "AWS Solutions Architect Resources",
            "url":
                "https://aws.amazon.com/certification/certified-solutions-architect-associate/"
          }
        ],
        "Microsoft Certified: Azure Fundamentals": [
          {
            "name": "Azure Fundamentals Certification Resources",
            "url":
                "https://learn.microsoft.com/en-us/certifications/azure-fundamentals/"
          }
        ],
        "Google Cloud Certified Professional Cloud Architect": [
          {
            "name": "Google Cloud Architect Resources",
            "url": "https://cloud.google.com/certification/cloud-architect"
          }
        ],
        "CompTIA Cloud+": [
          {
            "name": "Cloud+ Certification Overview",
            "url": "https://www.comptia.org/certifications/cloud"
          }
        ]
      },
      "icon": Icons.cloud,
      "iconColor": Colors.teal
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'IT Department',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: itTracks.length,
          itemBuilder: (context, index) {
            var track = itTracks[index];

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
                        certificationResources:
                            track["certificationResources"]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
