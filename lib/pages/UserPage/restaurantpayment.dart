import 'package:flutter/material.dart';


class Paynow extends StatefulWidget {
  const Paynow({super.key});

  @override
  State<Paynow> createState() => _PaynowState();
}

class _PaynowState extends State<Paynow> {
  String? _selectedPaymentMethod;

  bool isRoomDeliveryChecked = false; // To track if the checkbox is checked
  TextEditingController roomNumberController = TextEditingController();
  final TextEditingController _transactionIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Pay now',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Payment methods',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),


              Row(
                children: [
                  Text(
                    'Bkash, Nagad, Rocket: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '01714227495',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),


              Row(
                children: [
                  Radio<String>(
                    value: 'Bkash',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                  Image.asset(
                    'assets/images/bkash_logo.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 10),
                ],
              ),


              Row(
                children: [
                  Radio<String>(
                    value: 'Nagad',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                  Image.asset(
                    'assets/images/nagad_logo.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 10),
                ],
              ),


              Row(
                children: [
                  Radio<String>(
                    value: 'Rocket',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                  Image.asset(
                    'assets/images/rocket_logo.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 10),
                ],
              ),

              SizedBox(height: 20),

              TextField(
                controller: _transactionIdController,
                decoration: InputDecoration(
                  labelText: 'Transaction ID',
                  labelStyle: TextStyle(color: Color(0xFFC1C1CE)), // Optional: Set label text color
                  filled: true,
                  fillColor: Color(0xFFFEF7F7), // Set the background color
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFB9B1B1)), // Border color when not focused
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFB9B1B1)), // Border color when focused
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFB9B1B1)), // Border color when enabled (unfocused)
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                style: TextStyle(color: Colors.black), // Text color inside the text field
              ),

              SizedBox(height: 20),


                // Checkbox for room delivery
                CheckboxListTile(
                  title: Text('Room Delivery'),
                  value: isRoomDeliveryChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isRoomDeliveryChecked = value ?? false;
                    });
                  },
                ),

                // Room number input field (enabled only if checkbox is checked)
                TextFormField(
                  controller: roomNumberController,
                  enabled: isRoomDeliveryChecked, // Enable/disable based on checkbox state
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Room number eg. 1001',
                    labelStyle: TextStyle(color: Color(0xFFC1C1CE)),

                    filled: true,
                    fillColor: Color(0xFFFEF7F7), // Set the background color
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFB9B1B1)), // Border color when not focused
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFB9B1B1)), // Border color when focused
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFB9B1B1)), // Border color when enabled (unfocused)
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  style: TextStyle(color: Colors.black),
                ),

              SizedBox(height: 20),


          Center(
            child: ElevatedButton(
              onPressed: () {
                String transactionId = _transactionIdController.text;
                String roomNumber = roomNumberController.text;

                // Check if room delivery is selected and room number is empty
                if (isRoomDeliveryChecked && roomNumber.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a room number for delivery')),
                  );
                } else if (_selectedPaymentMethod == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a payment method')),
                  );
                } else if (transactionId.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a Transaction ID')),
                  );
                } else {
                  // Show payment details
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Payment method: $_selectedPaymentMethod\nTransaction ID: $transactionId\nRoom Number: $roomNumber'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBB8506), // Custom button color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Order Now",
                style: TextStyle(fontSize: 16, color: Colors.white),
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