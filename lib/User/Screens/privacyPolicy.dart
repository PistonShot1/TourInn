import 'package:flutter/material.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: // Generated code for this Text Widget...
            Center(
          child: Text(
            'Privacy Policy',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: ThemeProperty.primaryText,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Generated code for this Text Widget...
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 4),
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: ThemeProperty.primaryBackground,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Generated code for this Text Widget...
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 4),
              child: Text(
                '1. Information Collection\n\n1.1. The App may collect personal information, such as your name, email address, and location data, when you use our services.\n\n1.2. We use this information to provide and improve our services, personalize your experience, and contact you when necessary.\n\n2. Data Sharing\n\n2.1. We may share your personal information with third parties for the purpose of providing our services. We will never sell your personal information to third parties.\n\n3. Security\n\n3.1. We take reasonable measures to protect your personal information. However, we cannot guarantee the security of your data, and you share it at your own risk.\n\n4. Cookies and Tracking\n\n4.1. The App may use cookies and tracking technologies to collect information about your usage and improve our services.\n\n5. Third-Party Links\n\n5.1. The App may contain links to third-party websites. We are not responsible for the privacy practices of those websites.\n\n6. Contact Information\n\n6.1. If you have any questions or concerns about our Privacy Policy, please contact us.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: ThemeProperty.primaryBackground,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            // Generated code for this Text Widget...
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 4),
              child: Text(
                'Terms & Condition (T&C)',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: ThemeProperty.primaryBackground,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Generated code for this Text Widget...
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 4),
              child: Text(
                '1. Acceptance of Terms\n\nBy accessing or using the \"Tour Inn\" application, hereinafter referred to as the \"App,\" you agree to be bound by these Terms and Conditions. If you do not agree with these terms, please do not use the App.\n\n2. Use of the App\n\n2.1. The App allows users to scan the interior of units and post them for potential renters. You must use the App in compliance with all applicable laws and regulations.\n\n2.2. You are responsible for maintaining the security of your account and any content you post on the App.\n\n3. User-Generated Content\n\n3.1. Users are solely responsible for the content they post on the App. You agree not to post any content that is unlawful, defamatory, offensive, or infringing on the rights of others.\n\n3.2. The App may remove any content that violates these terms without notice.\n\n4. Privacy and Data Collection\n\n4.1. Our Privacy Policy governs the collection, use, and disclosure of your personal information. By using the App, you consent to the practices described in the Privacy Policy.\n\n5. Intellectual Property\n\n5.1. All content and materials on the App, including text, graphics, logos, and software, are the property of \"Tour Inn\" and protected by copyright and other intellectual property laws.\n\n6. Limitation of Liability\n\n6.1. The App is provided \"as is,\" and we make no warranties regarding its accuracy, availability, or suitability for a particular purpose.\n\n6.2. We are not liable for any direct, indirect, consequential, or incidental damages resulting from the use of the App.\n\n7. Termination\n\n7.1. We reserve the right to terminate or suspend your access to the App at our discretion, without notice.\n\n8. Changes to Terms\n\n8.1. We may update these Terms and Conditions from time to time. It is your responsibility to review them periodically.\n',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: ThemeProperty.primaryBackground,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
