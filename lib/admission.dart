import 'package:flutter/material.dart';

class AdmissionForm extends StatefulWidget {
  const AdmissionForm({super.key});

  @override
  _AdmissionFormState createState() => _AdmissionFormState();
}

class _AdmissionFormState extends State<AdmissionForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController educationBackgroundController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admission Form'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.yellowAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Name', nameController),
              _buildTextField('Email ID', emailController),
              _buildTextField('Phone Number', phoneController),
              _buildTextField('Address', addressController),
              _buildTextField('Date of Birth', dateOfBirthController),
              _buildTextField(
                  'Education Background', educationBackgroundController),
              const SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Set your desired color here
                  ),
                  onPressed: () {
                    // Perform form submission logic here
                    String name = nameController.text;
                    String email = emailController.text;
                    String phone = phoneController.text;
                    String address = addressController.text;
                    String dateOfBirth = dateOfBirthController.text;
                    String educationBackground =
                        educationBackgroundController.text;

                    // You can use the entered data as needed, e.g., send it to an API
                    print(
                        'Name: $name, Email: $email, Phone: $phone, Address: $address, Date of Birth: $dateOfBirth, Education Background: $educationBackground');
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
