import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:myapp/doctordetail1.dart';
import 'package:myapp/doctordetail2.dart';








class makerendezvous extends StatefulWidget {
  final List<Widget Function()> pageHistory;
    const makerendezvous({Key? key, this.pageHistory = const []}) : super(key: key);

  @override
  _MakeRendezvousState createState() => _MakeRendezvousState();
}

class _MakeRendezvousState extends State<makerendezvous> {
  String _selectedPayment = 'By Cash';  
  bool shouldGoToFirstPage = true;
  DateTime _selectedDate = DateTime.now();
  String _selectedTimeSlot = '08:30 AM'; 
  final List<String> _timeSlots = [
    '08:30 AM',
    '09:00 AM',
    '10:10 AM',
    '10:50 AM',
    '11:30 AM',
    '12:30 PM',
    '02:00 PM',
    '04:30 PM',
    
  ];
 
  final TextEditingController _nameController = TextEditingController();  

  @override
  void dispose() {
    _nameController.dispose();  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Color(0xFF00CED1),
        onPressed: () { if (widget.pageHistory.isNotEmpty) {
              var previousPage = widget.pageHistory.last();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => previousPage));
            } else {
              Navigator.pop(context);  // Retour à la page précédente si la pile est vide
            }
          },
          
        ),
      ),
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Full Name',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                  hintText: '',
                  
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: const Text(
                ' The Date of Consultation',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),

              ),
              const SizedBox(height: 10.0),
              CalendarCarousel(
                headerTextStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20.0),
                onDayPressed: (DateTime date, List<dynamic> events) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
                
                weekendTextStyle: TextStyle(
                  color: Color.fromARGB(255, 246, 8, 8),
                ),
                thisMonthDayBorderColor: Color(0xFF9E9E9E),
                weekFormat: false,
                height: 420.0,
                selectedDateTime: _selectedDate,
                daysHaveCircularBorder: false,
                customGridViewPhysics: NeverScrollableScrollPhysics(),
                todayTextStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                todayButtonColor: Color(0xFFF5F5F5),
                todayBorderColor: Color.fromARGB(255, 114, 111, 111),
                selectedDayTextStyle: TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
                selectedDayButtonColor: Color(0xFF00CED1),
                selectedDayBorderColor: const Color.fromARGB(255, 0, 0, 0),
                daysTextStyle: TextStyle(color: Colors.black),
                prevDaysTextStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                nextDaysTextStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                inactiveDaysTextStyle: TextStyle(color: Colors.tealAccent),
                iconColor: Color.fromARGB(255, 0, 0, 0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const  Text(
                'Time',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Wrap(
                spacing: 5.0,
                runSpacing: 10.0,
                children: _timeSlots.map((timeSlot) => ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTimeSlot = timeSlot;
                    });
                  },
                  child: Text(timeSlot,
                  style: TextStyle(color: _selectedTimeSlot == timeSlot ? Colors.white : Colors.black),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedTimeSlot == timeSlot ? Color(0xFF00CED1) : Color(0xFFD4FEFF),
                    
                  ),
                )).toList(),
              ),
                ],
              ),
              
              const SizedBox(height: 20.0),
              Center(
                child: const Text(
                'Payment Mode',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              ),
              
              const SizedBox(height: 10.0),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  RadioListTile<String>(
                    title: const Text('Add card'),
                    value: 'Card',
                    groupValue: _selectedPayment,
                    secondary: Icon(Icons.credit_card,color: Color(0xFF00CED1)), 
                    onChanged: (value) {
                      setState(() {
                        _selectedPayment = value!;
                      });
                    },
                    activeColor: Color(0xFF00CED1),
                    toggleable: true, 
                  ),
                  RadioListTile<String>(
                    title: const Text('By Cash'),
                    value: 'By Cash',
                    groupValue: _selectedPayment,
                    secondary: Icon(Icons.money_off,color: Color(0xFF00CED1)),  
                    onChanged: (value) {
                      setState(() {
                        _selectedPayment = value!;
                      });
                    },
                    activeColor: Color(0xFF00CED1),
                    toggleable: true, 
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(onPressed: (){},
                child: Text('Next',style: TextStyle(color: Color(0xFF000000)),),
                style:ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00CED1),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}


