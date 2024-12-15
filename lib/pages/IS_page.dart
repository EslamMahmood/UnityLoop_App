import 'package:flutter/material.dart';
import 'package:project/components/card.dart';
import 'package:project/components/track_details.dart';

class ISPage extends StatelessWidget {
  final List<Map<String, dynamic>> isTracks = [
    {
      "name": "Database Management",
      "description": "Master database design, querying, and management.",
      "certifications": [
        "Oracle Certified Professional (OCP)",
        "Microsoft Certified: Azure Database Administrator Associate",
        "MongoDB Certified Developer",
        "AWS Certified Database Specialty"
      ],
      "youtubeLinks": [
        {"name": "SQL Basics", "url": "https://youtu.be/database1234"},
        {"name": "NoSQL Databases", "url": "https://youtu.be/database5678"}
      ],
      "certificationResources": {
        "Oracle Certified Professional (OCP)": [
          {
            "name": "OCP Certification Overview",
            "url":
                "https://education.oracle.com/oracle-certified-professional/overview"
          }
        ],
        "Microsoft Certified: Azure Database Administrator Associate": [
          {
            "name": "Azure Database Administrator Associate Details",
            "url":
                "https://learn.microsoft.com/en-us/certifications/azure-database-administrator/"
          }
        ],
        "MongoDB Certified Developer": [
          {
            "name": "MongoDB Certification Overview",
            "url": "https://university.mongodb.com/certification"
          }
        ],
        "AWS Certified Database Specialty": [
          {
            "name": "AWS Database Specialty Certification Details",
            "url":
                "https://aws.amazon.com/certification/certified-database-specialty/"
          }
        ]
      },
      "icon": Icons.storage,
      "iconColor": Colors.deepPurple
    },
    {
      "name": "Business Analytics",
      "description":
          "Learn to analyze business data to make strategic decisions.",
      "certifications": [
        "Certified Business Analysis Professional (CBAP)",
        "Microsoft Certified: Data Analyst Associate",
        "Tableau Desktop Specialist",
        "Google Data Analytics Certificate"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to Business Analytics",
          "url": "https://youtu.be/business1234"
        },
        {
          "name": "Data Analysis Techniques",
          "url": "https://youtu.be/business5678"
        }
      ],
      "certificationResources": {
        "Certified Business Analysis Professional (CBAP)": [
          {
            "name": "CBAP Certification Overview",
            "url": "https://www.iiba.org/certification/cbap/"
          }
        ],
        "Microsoft Certified: Data Analyst Associate": [
          {
            "name": "Data Analyst Associate Certification Details",
            "url":
                "https://learn.microsoft.com/en-us/certifications/data-analyst-associate/"
          }
        ],
        "Tableau Desktop Specialist": [
          {
            "name": "Tableau Desktop Specialist Certification Guide",
            "url": "https://www.tableau.com/learn/certification"
          }
        ],
        "Google Data Analytics Certificate": [
          {
            "name": "Google Data Analytics Certificate Details",
            "url":
                "https://www.coursera.org/professional-certificates/google-data-analytics"
          }
        ]
      },
      "icon": Icons.bar_chart,
      "iconColor": Colors.blue
    },
    {
      "name": "Enterprise Systems",
      "description": "Understand and implement enterprise-wide solutions.",
      "certifications": [
        "SAP Certified Application Associate",
        "Oracle E-Business Suite Certification",
        "Microsoft Dynamics 365 Certification",
        "Certified Enterprise Architect (CEA)"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to ERP Systems",
          "url": "https://youtu.be/enterprise1234"
        },
        {
          "name": "ERP Implementation Basics",
          "url": "https://youtu.be/enterprise5678"
        }
      ],
      "certificationResources": {
        "SAP Certified Application Associate": [
          {
            "name": "SAP Certification Overview",
            "url": "https://training.sap.com/certification/"
          }
        ],
        "Oracle E-Business Suite Certification": [
          {
            "name": "Oracle E-Business Suite Certification Details",
            "url": "https://education.oracle.com/oracle-ebusiness-suite"
          }
        ],
        "Microsoft Dynamics 365 Certification": [
          {
            "name": "Microsoft Dynamics 365 Certification Guide",
            "url":
                "https://learn.microsoft.com/en-us/certifications/dynamics-365/"
          }
        ],
        "Certified Enterprise Architect (CEA)": [
          {
            "name": "CEA Certification Overview",
            "url":
                "https://www.opengroup.org/certifications/enterprise-architecture"
          }
        ]
      },
      "icon": Icons.business,
      "iconColor": Colors.green
    },
    {
      "name": "Information Systems Security",
      "description": "Secure information systems and protect sensitive data.",
      "certifications": [
        "Certified Information Security Manager (CISM)",
        "CompTIA Security+",
        "Certified Information Systems Auditor (CISA)",
        "GIAC Information Security Fundamentals (GISF)"
      ],
      "youtubeLinks": [
        {
          "name": "Basics of Information Security",
          "url": "https://youtu.be/infosec1234"
        },
        {
          "name": "Data Protection Techniques",
          "url": "https://youtu.be/infosec5678"
        }
      ],
      "certificationResources": {
        "Certified Information Security Manager (CISM)": [
          {
            "name": "CISM Certification Overview",
            "url": "https://www.isaca.org/credentialing/cism"
          }
        ],
        "CompTIA Security+": [
          {
            "name": "Security+ Certification Guide",
            "url": "https://www.comptia.org/certifications/security"
          }
        ],
        "Certified Information Systems Auditor (CISA)": [
          {
            "name": "CISA Certification Details",
            "url": "https://www.isaca.org/credentialing/cisa"
          }
        ],
        "GIAC Information Security Fundamentals (GISF)": [
          {
            "name": "GISF Certification Guide",
            "url":
                "https://www.giac.org/certifications/information-security-fundamentals"
          }
        ]
      },
      "icon": Icons.security,
      "iconColor": Colors.red
    },
    {
      "name": "Knowledge Management",
      "description":
          "Learn how to organize and utilize organizational knowledge effectively.",
      "certifications": [
        "Certified Knowledge Manager (CKM)",
        "ITIL Foundation Certification",
        "Knowledge-Centered Service (KCS) Certification",
        "Microsoft Certified: Information Protection Administrator Associate"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to Knowledge Management",
          "url": "https://youtu.be/knowledge1234"
        },
        {
          "name": "Knowledge Sharing Best Practices",
          "url": "https://youtu.be/knowledge5678"
        }
      ],
      "certificationResources": {
        "Certified Knowledge Manager (CKM)": [
          {
            "name": "CKM Certification Overview",
            "url":
                "https://www.kmworld.com/Articles/ReadArticle.aspx?ArticleID=134455"
          }
        ],
        "ITIL Foundation Certification": [
          {
            "name": "ITIL Certification Overview",
            "url": "https://www.axelos.com/certifications/itil-certifications"
          }
        ],
        "Knowledge-Centered Service (KCS) Certification": [
          {
            "name": "KCS Certification Guide",
            "url":
                "https://www.servicenow.com/products/knowledge-centered-service.html"
          }
        ],
        "Microsoft Certified: Information Protection Administrator Associate": [
          {
            "name": "Information Protection Administrator Details",
            "url":
                "https://learn.microsoft.com/en-us/certifications/information-protection-administrator/"
          }
        ]
      },
      "icon": Icons.lightbulb,
      "iconColor": Colors.yellow
    },
    {
      "name": "Project Management",
      "description": "Master the art of planning and executing projects.",
      "certifications": [
        "Project Management Professional (PMP)",
        "Certified Scrum Master (CSM)",
        "PRINCE2 Foundation",
        "Agile Certified Practitioner (PMI-ACP)"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to Project Management",
          "url": "https://youtu.be/project1234"
        },
        {
          "name": "Agile Methodologies Explained",
          "url": "https://youtu.be/project5678"
        }
      ],
      "certificationResources": {
        "Project Management Professional (PMP)": [
          {
            "name": "PMP Certification Overview",
            "url":
                "https://www.pmi.org/certifications/project-management-professional-pmp"
          }
        ],
        "Certified Scrum Master (CSM)": [
          {
            "name": "Scrum Master Certification Details",
            "url":
                "https://www.scrumalliance.org/get-certified/scrum-master-track"
          }
        ],
        "PRINCE2 Foundation": [
          {
            "name": "PRINCE2 Certification Guide",
            "url":
                "https://www.axelos.com/certifications/prince2-certifications"
          }
        ],
        "Agile Certified Practitioner (PMI-ACP)": [
          {
            "name": "PMI-ACP Certification Details",
            "url":
                "https://www.pmi.org/certifications/agile-certified-practitioner-acp"
          }
        ]
      },
      "icon": Icons.assignment,
      "iconColor": Colors.orange
    },
    {
      "name": "Data Governance",
      "description": "Learn how to manage data assets and ensure data quality.",
      "certifications": [
        "Certified Data Management Professional (CDMP)",
        "Microsoft Certified: Data Analyst Associate",
        "Data Governance and Stewardship Professional (DGSP)",
        "Google Data Analytics Certificate"
      ],
      "youtubeLinks": [
        {
          "name": "Data Governance Basics",
          "url": "https://youtu.be/datagov1234"
        },
        {"name": "Ensuring Data Quality", "url": "https://youtu.be/datagov5678"}
      ],
      "certificationResources": {
        "Certified Data Management Professional (CDMP)": [
          {
            "name": "CDMP Certification Overview",
            "url": "https://www.dama.org/cdmp"
          }
        ],
        "Microsoft Certified: Data Analyst Associate": [
          {
            "name": "Data Analyst Associate Certification Details",
            "url":
                "https://learn.microsoft.com/en-us/certifications/data-analyst-associate/"
          }
        ],
        "Data Governance and Stewardship Professional (DGSP)": [
          {
            "name": "DGSP Certification Overview",
            "url": "https://www.dataversity.net/dgsp-certification/"
          }
        ],
        "Google Data Analytics Certificate": [
          {
            "name": "Google Data Analytics Certificate Details",
            "url":
                "https://www.coursera.org/professional-certificates/google-data-analytics"
          }
        ]
      },
      "icon": Icons.data_usage,
      "iconColor": Colors.teal
    },
    {
      "name": "ERP Systems",
      "description":
          "Learn to manage and integrate business processes through ERP systems.",
      "certifications": [
        "SAP Certified Application Associate",
        "Oracle ERP Cloud Certification",
        "Microsoft Dynamics 365 Certified",
        "Certified ERP Specialist"
      ],
      "youtubeLinks": [
        {
          "name": "Introduction to ERP Systems",
          "url": "https://youtu.be/erp1234"
        },
        {"name": "ERP Implementation Guide", "url": "https://youtu.be/erp5678"}
      ],
      "certificationResources": {
        "SAP Certified Application Associate": [
          {
            "name": "SAP Certification Overview",
            "url": "https://training.sap.com/certification/"
          }
        ],
        "Oracle ERP Cloud Certification": [
          {
            "name": "Oracle ERP Cloud Certification Guide",
            "url": "https://education.oracle.com/oracle-erp-cloud-certification"
          }
        ],
        "Microsoft Dynamics 365 Certified": [
          {
            "name": "Microsoft Dynamics 365 Certification Details",
            "url":
                "https://learn.microsoft.com/en-us/certifications/dynamics-365/"
          }
        ],
        "Certified ERP Specialist": [
          {
            "name": "ERP Specialist Certification Overview",
            "url":
                "https://www.simplilearn.com/certified-erp-specialist-article"
          }
        ]
      },
      "icon": Icons.book_online,
      "iconColor": Colors.purple
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'IS Department',
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
          itemCount: isTracks.length,
          itemBuilder: (context, index) {
            var track = isTracks[index];

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
