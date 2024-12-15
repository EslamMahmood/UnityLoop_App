import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/components/button.dart';
import 'package:project/pages/tracks_page.dart';

class JoinTrackPage extends StatefulWidget {
  @override
  _JoinTrackPageState createState() => _JoinTrackPageState();
}

class _JoinTrackPageState extends State<JoinTrackPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  String? _selectedLevel;
  String? _reasonForJoining;
  String? _contactNumber;
  String? _studentId;
  String? _preferredLearningMode;

  bool _isSubmitting = false;

  Future<void> _submitApplication() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      _formKey.currentState!.save();

      final user = _auth.currentUser;
      if (user == null) throw Exception("User not authenticated.");

      await _firestore.collection('trackApplications').add({
        'userId': user.uid,
        'userName': user.displayName ?? 'Anonymous',
        'email': user.email,
        'contactNumber': _contactNumber,
        'studentId': _studentId,
        'level': _selectedLevel,
        'reasonForJoining': _reasonForJoining,
        'preferredLearningMode': _preferredLearningMode,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Application submitted successfully!')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TracksPage(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit application: $e')),
      );
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Fill Form',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[500],
            ),
          )),
      body: _isSubmitting
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: _auth.currentUser?.email ?? '',
                        enabled: false,
                        decoration: InputDecoration(labelText: 'Email :'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Student ID',
                          labelStyle: TextStyle(
                              color: Colors
                                  .grey[700]), // Change this color as needed
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (value) => _studentId = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Student ID is required';
                          }
                          // Check for exactly 7 digits
                          if (!RegExp(r'^\d{7}$').hasMatch(value)) {
                            return 'Student ID must be 7 digits';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Contact Number',
                          labelStyle: TextStyle(
                              color: Colors
                                  .grey[700]), // Change this color as needed
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) => _contactNumber = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Contact number is required';
                          }
                          // Check for exactly 11 digits and correct prefix (010, 011, 012, or 015)
                          if (!RegExp(r'^(010|011|012|015)\d{8}$')
                              .hasMatch(value)) {
                            return 'Contact number must be 11 digits';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField<String>(
                        value: _selectedLevel,
                        items: ['LEVEL 1', 'LEVEL 2', 'LEVEL 3', 'LEVEL 4']
                            .map((track) => DropdownMenuItem(
                                  value: track,
                                  child: Text(track),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _selectedLevel = value),
                        onSaved: (value) => _selectedLevel = value,
                        validator: (value) =>
                            value == null ? 'Please select your level' : null,
                        decoration: InputDecoration(
                          labelText: 'Select your level',
                          labelStyle: TextStyle(
                              color: Colors
                                  .grey[700]), // Change this color as needed
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Reason for Joining',
                          labelStyle: TextStyle(color: Colors.grey[700]),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                        ),
                        maxLines: 2,
                        onSaved: (value) => _reasonForJoining = value,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Reason is required'
                            : null,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DropdownButtonFormField<String>(
                        value: _preferredLearningMode,
                        items: ['Online', 'On-Campus', 'Hybrid']
                            .map((mode) => DropdownMenuItem(
                                  value: mode,
                                  child: Text(mode),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _preferredLearningMode = value),
                        onSaved: (value) => _preferredLearningMode = value,
                        decoration: InputDecoration(
                          labelText: 'Preferred Learning Mode',
                          labelStyle: TextStyle(
                              color: Colors
                                  .grey[700]), // Change this color as needed
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      MyButton(
                          onTap: _submitApplication,
                          text: 'Start your Journey'),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
