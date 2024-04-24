import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Action de recherche
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    'Top Doctors',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  DoctorCard(
                    name: 'Dr. Jane Smith',
                    specialization: 'Cardiologist',
                    rating: '4.5', // Ajout de la notation
                    imageUrl: 'images/a.jpg',
                  ),
                  DoctorCard(
                    name: 'Dr. John Doe',
                    specialization: 'Dermatologist',
                    rating: '4.2', // Ajout de la notation
                    imageUrl: 'images/a.jpg',
                  ),
                  DoctorCard(
                    name: 'Dr. Emily Brown',
                    specialization: 'Pediatrician',
                    rating: '4.8', // Ajout de la notation
                    imageUrl: 'images/a.jpg',
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Specialties',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SpecialtyCard(
                          name: 'Cardiology',
                          imageUrl: 'images/a.jpg',
                        ),
                        SpecialtyCard(
                          name: 'Dermatology',
                          imageUrl: 'images/a.jpg',
                        ),
                        SpecialtyCard(
                          name: 'Pediatrics',
                          imageUrl: 'images/a.jpg',
                        ),
                      ],
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
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String rating; // Nouveau champ pour la notation
  final String imageUrl;

  DoctorCard({
    required this.name,
    required this.specialization,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Ajout d'un GestureDetectore pour la navigation vers la page de détail du médecin
      onTap: () {
        // Naviguer vers la page de détail du médecin
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  specialization,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Rating: $rating', // Affichage de la notation
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SpecialtyCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  SpecialtyCard({
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Ajout d'un GestureDetectore pour la navigation vers la page de détail de la spécialité
      onTap: () {
        // Naviguer vers la page de détail de la spécialité
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 120.0,
                height: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}














