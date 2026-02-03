// import 'package:flutter/material.dart';
// import 'package:portafolio_app/constants/colors.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ContactFormWidget extends StatefulWidget {
//   const ContactFormWidget({super.key});

//   @override
//   State<ContactFormWidget> createState() => _ContactFormWidgetState();
// }

// class _ContactFormWidgetState extends State<ContactFormWidget> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _messageController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _messageController.dispose();
//     super.dispose();
//   }

//   Future<void> _sendEmail() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => _isLoading = true);

//     try {
//       final Uri emailUri = Uri(
//         scheme: 'mailto',
//         path: 'haxrosshdez@gmail.com',
//         query: Uri.encodeQueryComponent(
//           'subject=New message from ${_nameController.text}&body=${_messageController.text}\n\nFrom: ${_emailController.text}',
//         ),
//       );

//       if (await canLaunchUrl(emailUri)) {
//         await launchUrl(emailUri);
//         if (mounted) {
//           _showSuccessMessage();
//           _formKey.currentState!.reset();
//           _nameController.clear();
//           _emailController.clear();
//           _messageController.clear();
//         }
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: $e')),
//         );
//       }
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   void _showSuccessMessage() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Thank you for your message! Your email client will open.'),
//         backgroundColor: Colors.green,
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isMobile = screenWidth < 768;
//     final isTablet = screenWidth >= 768 && screenWidth < 1200;

//     return Container(
//       width: double.infinity,
//       color: CustomColor.bgLight1,
//       child: Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: isMobile ? 16 : isTablet ? 32 : 48,
//             vertical: 60,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//             // Title
//             Text(
//               'Get In Touch',
//               style: TextStyle(
//                 fontSize: isMobile ? 28 : isTablet ? 32 : 40,
//                 fontWeight: FontWeight.bold,
//                 color: CustomColor.whitePrimary,
//                 letterSpacing: 0.5,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Have a question or a project in mind? Let\'s connect and create something amazing together!',
//               style: TextStyle(
//                 fontSize: isMobile ? 14 : 16,
//                 color: CustomColor.whiteSecondary,
//                 height: 1.6,
//               ),
//               textAlign: TextAlign.center,
//               maxLines: 3,
//             ),
//             const SizedBox(height: 50),

//             // Form
//             Container(
//               constraints: BoxConstraints(maxWidth: isMobile ? double.maxFinite : 600),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     // Name Field
//                     _buildTextFormField(
//                       controller: _nameController,
//                       label: 'Name',
//                       hint: 'Your name',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your name';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),

//                     // Email Field
//                     _buildTextFormField(
//                       controller: _emailController,
//                       label: 'Email',
//                       hint: 'your@email.com',
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                           return 'Please enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),

//                     // Message Field
//                     _buildTextFormField(
//                       controller: _messageController,
//                       label: 'Message',
//                       hint: 'Write your message here...',
//                       maxLines: 5,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please write a message';
//                         }
//                         if (value.length < 10) {
//                           return 'Message must be at least 10 characters';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 32),

//                     // Send Button
//                     SizedBox(
//                       width: double.maxFinite,
//                       height: 52,
//                       child: ElevatedButton(
//                         onPressed: _isLoading ? null : _sendEmail,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: CustomColor.yellowPrimary,
//                           disabledBackgroundColor: CustomColor.bgLight2,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           elevation: 4,
//                         ),
//                         child: _isLoading
//                             ? const SizedBox(
//                                 width: 24,
//                                 height: 24,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2.5,
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                     CustomColor.scaffoldBg,
//                                   ),
//                                 ),
//                               )
//                             : Text(
//                                 'Send Message',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: CustomColor.scaffoldBg,
//                                   letterSpacing: 0.5,
//                                 ),
//                               ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextFormField({
//     required TextEditingController controller,
//     required String label,
//     required String hint,
//     int maxLines = 1,
//     TextInputType keyboardType = TextInputType.text,
//     String? Function(String?)? validator,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: CustomColor.whitePrimary,
//           ),
//         ),
//         const SizedBox(height: 8),
//         TextFormField(
//           controller: controller,
//           maxLines: maxLines,
//           keyboardType: keyboardType,
//           validator: validator,
//           style: const TextStyle(
//             color: CustomColor.whitePrimary,
//             fontSize: 14,
//           ),
//           decoration: InputDecoration(
//             hintText: hint,
//             hintStyle: const TextStyle(
//               color: CustomColor.whiteSecondary,
//               fontSize: 14,
//             ),
//             filled: true,
//             fillColor: CustomColor.bgLight2,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(
//                 color: CustomColor.bgLight1,
//                 width: 1,
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(
//                 color: CustomColor.bgLight1,
//                 width: 1,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(
//                 color: CustomColor.yellowSecondary,
//                 width: 1.5,
//               ),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(
//                 color: Colors.red,
//                 width: 1,
//               ),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: 12,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomColor {
  static const Color bgLight1 = Color(0xFF1E1E2C);
  static const Color bgLight2 = Color(0xFF2A2A3C);
  static const Color whitePrimary = Colors.white;
  static const Color whiteSecondary = Colors.white70;
  static const Color yellowPrimary = Colors.amber;
  static const Color scaffoldBg = Colors.black;
}

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  // ✅ Tus credenciales EmailJS
  final String serviceId = 'service_3ni8re2';
  final String templateId = 'template_p4dy8dq';
  final String publicKey = 'cfZxvzPYw4OhkkzDv';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": publicKey,
          "template_params": {
            "from_name": _nameController.text,
            "from_email": _emailController.text,
            "message": _messageController.text,
          }
        }),
      );

      if (response.statusCode == 200) {
        _showSnackBar('Message sent successfully!', Colors.green);
        _formKey.currentState!.reset();
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      } else {
        _showSnackBar('Error sending email: ${response.body}', Colors.red);
      }
    } catch (e) {
      _showSnackBar('Error: $e', Colors.red);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, Color color) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1200;

    return Container(
      width: double.infinity,
      color: CustomColor.bgLight1,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : isTablet ? 32 : 48,
            vertical: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Get In Touch',
                style: TextStyle(
                  fontSize: isMobile ? 28 : isTablet ? 32 : 40,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Have a question or a project in mind? Let\'s connect!',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: CustomColor.whiteSecondary,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              const SizedBox(height: 50),
              Container(
                constraints: BoxConstraints(maxWidth: isMobile ? double.maxFinite : 600),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextFormField(
                        controller: _nameController,
                        label: 'Name',
                        hint: 'Your name',
                        validator: (value) => value == null || value.isEmpty ? 'Please enter your name' : null,
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        controller: _emailController,
                        label: 'Email',
                        hint: 'your@email.com',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Please enter your email';
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Enter a valid email';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        controller: _messageController,
                        label: 'Message',
                        hint: 'Write your message...',
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Please write a message';
                          if (value.length < 10) return 'Message must be at least 10 characters';
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.maxFinite,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _sendEmail,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColor.yellowPrimary,
                            disabledBackgroundColor: CustomColor.bgLight2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 4,
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    valueColor: AlwaysStoppedAnimation<Color>(CustomColor.scaffoldBg),
                                  ),
                                )
                              : Text(
                                  'Send Message',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColor.scaffoldBg,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
  required TextEditingController controller,
  required String label,
  required String hint,
  int maxLines = 1,
  TextInputType keyboardType = TextInputType.text,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: CustomColor.whitePrimary,
        ),
      ),
      const SizedBox(height: 8),
      TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: validator,
        style: const TextStyle(color: CustomColor.whitePrimary, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: CustomColor.whiteSecondary, fontSize: 14),
          filled: true,
          fillColor: CustomColor.bgLight2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: CustomColor.bgLight1, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: CustomColor.bgLight1, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: CustomColor.yellowPrimary, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    ],
  );
}

}
