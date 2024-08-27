import 'package:flutter/material.dart';
import '../screens/onboarding1.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? _selectedLanguage;
  final List<Map<String, String>> _languages = [
    {'code': 'En', 'language': 'English'},
    {'code': 'Hi', 'language': 'हिंदी'},
    {'code': 'Gu', 'language': 'ગુજરાતી'},
    {'code': 'Ba', 'language': 'বাংলা'},
    {'code': 'Te', 'language': 'తెలుగు'},
    {'code': 'Ka', 'language': 'ಕನ್ನಡ'},
    {'code': 'Or', 'language': 'ଓଡ଼ିଆ'},
    {'code': 'Mr', 'language': 'मराठी'},
    {'code': 'Ma', 'language': 'മലയാളം'},
    {'code': 'Bo', 'language': 'भोजपुरी'},
  ];

  void _onLanguageSelected(String? language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  void _onNextPressed() {
    if (_selectedLanguage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => onboarding1(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a language before proceeding.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rub Bank",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Choose your preferred language",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: _selectedLanguage == _languages[index]['language']
                              ? Colors.blue.withOpacity(0.1)
                              : Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _languages[index]['code']!,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      title: Text(_languages[index]['language']!),
                      trailing: _selectedLanguage == _languages[index]['language']
                          ? const Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                        size: 32,
                      )
                          : null,
                      onTap: () {
                        _onLanguageSelected(_languages[index]['language']);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                  onPressed: _onNextPressed,
                child: Text('Next', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4), // <-- Radius
                    ),
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 56),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

