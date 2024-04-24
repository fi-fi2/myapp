import 'package:flutter/material.dart';

import 'package:myapp/makerendezvous.dart';



class doctordetailPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dr. Kraouchi Soumia'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Kraouchi Soumia',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'General practitioner',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Color(0xFF3BC2C8)),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage('images/soumia.gif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  RatingBar(rating: 5.0),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'About',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Color(0xFF3BC2C8),decoration: TextDecoration.underline,
                 decorationColor: Color(0xFF3BC2C8),),
              ),
              SizedBox(height: 8.0),
              Text('. Acts as the initial contact for patients in the healthcare system, handling a wide variety of medical issues.'),
              SizedBox(height: 4.0),
              Text('.  Provides care for all ages, genders, and various health conditions, offering a holistic approach to patient health.'),
              SizedBox(height: 4.0),
              Text('. Focuses on preventive care through routine check-ups, immunizations, and health counseling to prevent illnesses before they develop.'),
              SizedBox(height: 4.0),
              Text('. Manages and monitors chronic conditions such as diabetes, hypertension, and heart disease, helping patients manage their health over time.'),
              SizedBox(height: 8.0),
              Text(
                'Services',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Color(0xFF3BC2C8),decoration: TextDecoration.underline,
                 decorationColor: Color(0xFF3BC2C8),),
              ),
              SizedBox(height: 8.0),
              Text('. Routine check-ups to assess overall health and identify any potential health issues early.'),
              SizedBox(height: 4.0),
              Text('.  Évaluations de santé régulières pour diagnostiquer et traiter divers problèmes médicaux.'),
              SizedBox(height: 4.0),
              Text('. Services comme les frottis cervicaux, les examens mammaires et le suivi gynécologique.'),
              SizedBox(height: 4.0),
              Text('. Soins médicaux pour enfants, y compris les visites de routine et le suivi de la croissance et du développement.'),
              SizedBox(height: 4.0),
              Text('. Conseils et vaccinations pour les voyages internationaux.'),
              SizedBox(height: 4.0),
              Text('. Consultations à distance par téléphone ou plateformes en ligne, permettant un suivi accessible et pratique.'),
              SizedBox(height: 4.0),
              
             
              SizedBox(height: 14.0),
              Row(
                children: [Expanded(child: Align(
              alignment: Alignment.centerLeft,
                      child:ElevatedButton.icon(
                        
                        onPressed: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => makerendezvous()));
                        },
                        icon: Icon(Icons.calendar_today, color: Color(0xFF3BC2C8)),
                        label: Text(
                          'Make an appointment',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFC3F5F7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Color(0xFF3BC2C8)),
                          ),
                        ),
                      ),
                      
              ),
                ),
              SizedBox(width: 0.0), 
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Color(0xFFC3F5F7), 
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFF3BC2C8)),
              ),
              child: IconButton(
                icon: Icon(Icons.message, color: Color(0xFF3BC2C8)),
                onPressed: () {
                  
                },
                tooltip: 'Send a Message', 
              ),
            ),
                
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double rating;

  const RatingBar({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            for (int i = 0; i < rating; i++)
              Icon(Icons.star, color: Colors.amber),
            for (int i = (5 - rating).toInt(); i > 0; i--)
              Icon(Icons.star_border, color: Colors.amber),
            SizedBox(width: 8),
            Text(
              '$rating/5',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text('2,2 reviews',
        style: TextStyle(
            
            fontSize: 14,
          ),),
        Text(
          '10years of Experience', 
          style: TextStyle(
            
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}