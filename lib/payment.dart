import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardExpiryDateController = TextEditingController();
  final _cardCVVController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  bool _agreeTerms = false;  // State for the checkbox

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardExpiryDateController.dispose();
    _cardCVVController.dispose();
    _cardHolderNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paiement par carte', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('images/carte.png'),  
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(labelText: 'Card Holder Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le numéro de carte est obligatoire';
                  }
                  if (!RegExp(r'^[0-9]{16}$').hasMatch(value)) {
                    return 'Le numéro de carte doit être composé de 16 chiffres';
                  }
                  return null;
                },
              ),
               SizedBox(height: 16.0),
              TextFormField(
                controller: _cardHolderNameController,
                decoration: InputDecoration(labelText: 'Card number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le nom du titulaire de la carte est obligatoire';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cardExpiryDateController,
                decoration: InputDecoration(labelText: ' Expiry Date (MM/AA)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La date d\'expiration est obligatoire';
                  }
                  if (!RegExp(r'^[0-9]{2}/[0-9]{2}$').hasMatch(value)) {
                    return 'La date d\'expiration doit être au format MM/AA';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cardCVVController,
                decoration: InputDecoration(labelText: 'CVV'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le CVV est obligatoire';
                  }
                  if (!RegExp(r'^[0-9]{3}$').hasMatch(value)) {
                    return 'Le CVV doit être composé de 3 chiffres';
                  }
                  return null;
                },
              ),
             
              CheckboxListTile(
                title: Text("Save card"),
                value: _agreeTerms,
                onChanged: (bool? value) {
                  setState(() {
                    _agreeTerms = value!;
                  });
                },
                activeColor: Color(0xFF3BC2C8),  
                checkColor: Colors.white, 
                controlAffinity: ListTileControlAffinity.leading,  
                
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false && _agreeTerms) {
                    print('Paiement en cours...');
                    print('Paiement effectué avec succès!');
                  } else if (!_agreeTerms) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Erreur'),
                        content: Text('Vous devez accepter les termes et conditions pour continuer.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                               style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFC3F5F7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Color(0xFF3BC2C8)),
                          ),
                           );
                        
                      
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Color.fromARGB(255, 202, 252, 255),
                  elevation: 5, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100) 
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20) 
                ),
                child: Text('Next',style: TextStyle(color:Color(0xFF000000),fontWeight: FontWeight.bold,fontSize: 18),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


 

