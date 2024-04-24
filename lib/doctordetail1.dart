import 'package:flutter/material.dart';
import 'package:myapp/makerendezvous.dart';



class doctordetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dr. Bouguerra Khaled'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Bouguerra Khaled',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Nephrologist',
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
                        image: AssetImage('images/bgrkhaled.gif'),
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
              Text('. Experienced in treating chronic kidney diseases and renal function issues.'),
              SizedBox(height: 4.0),
              Text('. Proficient in renal function tests and managing dialysis patients.'),
              SizedBox(height: 4.0),
              Text('. Focuses on delivering quality care with a patient-centered and empathetic approach.'),
              SizedBox(height: 4.0),
              Text('. Private consultations available at a leading clinic.'),
              SizedBox(height: 8.0),
              Text(
                'Services',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Color(0xFF3BC2C8),decoration: TextDecoration.underline,
                 decorationColor: Color(0xFF3BC2C8),),
              ),
              SizedBox(height: 8.0),
              Text('. Diagnosis and treatment of kidney diseases.'),
              SizedBox(height: 4.0),
              Text('. Management of chronic kidney diseases.'),
              SizedBox(height: 4.0),
              Text('. Dialysis treatment (hemodialysis and peritonealdialysis)'),
              SizedBox(height: 4.0),
              Text('. Renal function testing.'),
              SizedBox(height: 4.0),
              Text('. Hypertension management.'),
              SizedBox(height: 4.0),
              Text('. Kidney transplant evaluation and follow-up.'),
              SizedBox(height: 4.0),
              Text('. Consultations for urinary tract infections and other      urinary disorders.'),
             
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
        Text('1,5 reviews',
        style: TextStyle(
            
            fontSize: 14,
          ),),
        Text(
          '1Oyears of Experience', 
          style: TextStyle(
            
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}


