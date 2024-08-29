import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/app_image.dart';

class HelpSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image from assets/images/logo.png
            Image.asset(
              AppImages.img2,
              width: 500,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Call Us'),
              subtitle: Text('+91 9345390384'),
              onTap: () {
                _launchPhone('+91 9345390384'); // Launch phone dialer
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email Us'),
              subtitle: Text('megavathi18@gmail.com'),
              onTap: () {
                _launchEmail('megavathi18@gmail.com'); // Launch email client
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQs'),
              onTap: () {
                // Show FAQ section or navigate to an FAQ page
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Frequently Asked Questions'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FAQItem(
                          question: 'How can I reset my password?',
                          answer: 'To reset your password, go to the login page and click on "Forgot Password". Follow the instructions sent to your registered email.',
                        ),
                        SizedBox(height: 10),
                        FAQItem(
                          question: 'How do I contact customer support?',
                          answer: 'You can contact customer support by calling us at +91 9348477648 or by emailing support@gmail.com.',
                        ),
                        SizedBox(height: 10),
                        FAQItem(
                          question: 'Where can I find the privacy policy?',
                          answer: 'The privacy policy can be found in the app menu under "Privacy Policy".',
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Method to launch phone dialer
  void _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // Method to launch email client
  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch email to $email';
    }
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(answer),
      ],
    );
  }
}
