import 'package:flutter/material.dart';
import 'package:myapp/doctordetail1.dart';
import 'package:myapp/doctordetail2.dart';
import 'package:myapp/makerendezvous.dart';
import 'package:permission_handler/permission_handler.dart';



class NephrologistPage extends StatefulWidget {
  @override
  _NephrologistPageState createState() => _NephrologistPageState();
}

class _NephrologistPageState extends State<NephrologistPage> {
  final List<Nephrologist> nephrologists = [
    Nephrologist(
      title: "Nephrologist",
      name: "Dr. Bouguerra Khaled",
      location: "Bordj Bou Arréridj, Algeria",
      imageUrl: "images/bgrkhaled.gif",
      destinationPage: doctordetailPage(),
    ),
    Nephrologist(
      title: "General practitioner",
      name: "Dr. Kraouchi Soumia",
      location: "Bordj Bou Arréridj, Algeria",
      imageUrl: "images/soumia.gif",
      destinationPage: doctordetailPage2(),
    ),
    Nephrologist(
      title: "General practitioner",
      name: "Dr. Kraouchi Amina",
      location: "Bordj Bou Arréridj, Algeria",
      imageUrl: "images/amina.gif",
      destinationPage: doctordetailPage2(),
    ),
    Nephrologist(
      title: "Cardiologist",
      name: "Dr. Bouguerra Sofiane",
      location: "Bordj Bou Arréridj, Algeria",
      imageUrl: "images/sofiane.gif",
      destinationPage: doctordetailPage(),
    ),
    Nephrologist(
      title: "General practitioner",
      name: "Dr. Ali Hassen",
      location: "Bordj Bou Arréridj, Algeria",
      imageUrl: "images/ali.gif",
      destinationPage: doctordetailPage(),
    ),
    
  ];

  String searchTerm = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF3BC2C8)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          onChanged: (term) {
            setState(() {
              searchTerm = term.toLowerCase();
            });
          },
          decoration: InputDecoration(
            hintText: "Search for a doctor",
            prefixIcon: Icon(Icons.search, color: Color(0xFF00CED1)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: _buildNephrologistList(),
          ),
        ),
      ),
    );
  }


  List<Widget> _buildNephrologistList() {
    List<Widget> widgets = [];
    for (Nephrologist nephrologist in filteredNephrologists) {
      widgets.add(
        Container(
          margin: EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 218, 218, 218),
            ), 
            borderRadius: BorderRadius.circular(10), 
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 243, 243, 243).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), 
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    leading: Column(
                      mainAxisSize: MainAxisSize.min,
                       children: [
                        Flexible(
                          child: Container(
                            width: 80.0,
                           height: 80.0,
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                             image: AssetImage(nephrologist.imageUrl),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            ),
                            ),
                            ),
                             ),
     
                              ],
                             ),
                  title: Text(nephrologist.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nephrologist.title),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                        ],
                      ),
                      SizedBox(height: 8,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                           Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => makerendezvous()));
                         
                        },
                        icon: Icon(Icons.calendar_today, color: Color(0xFF3BC2C8)),
                        label: Text(
                          'Make an\nappointment',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 195, 245, 247),
                          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 11),
                          
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Color(0xFF3BC2C8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle tap on nephrologist
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => nephrologist.destinationPage),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
    return widgets;
  }


  List<Nephrologist> get filteredNephrologists {
    if (searchTerm.isEmpty) {
      return nephrologists;
    } else {
      String searchTermLowerCase = searchTerm.toLowerCase();
      return nephrologists.where((nephrologist) => nephrologist.name.toLowerCase().contains(searchTermLowerCase)).toList();
    }
  }
}

class Nephrologist {
  final String name;
  final String title;
  final String location;
  final String imageUrl;
  final Widget destinationPage;

  Nephrologist({
    required this.name,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.destinationPage,
  });
}
















