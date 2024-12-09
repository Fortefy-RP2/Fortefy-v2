import 'package:flutter/material.dart';
import 'dart:io';
//import '../widgets/widgets.dart';
import '../models/usuario.dart';
import '../services/services.dart';
import '../utils/utils.dart';

class ConfiguracoesWidget extends StatefulWidget{
  @override
  _ConfiguracoesScreen createState() => _ConfiguracoesScreen();
}

class _ConfiguracoesScreen extends State<ConfiguracoesWidget> {

  late Usuario usuario;
  bool _isPasswordVisible = false;
  File? _profileImage;
  int _selectedIndex = 0;

  final String config = "Configurações";
  final String home = "Home";
  final String chat = "Chat";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    navigateToPage(context, index, usuario); // Chama a função utilitária de navegação
  }

  void _togglePasswordVisible() {
    VisibilityUtils.togglePasswordVisibility(
      isVisible: _isPasswordVisible, 
      onVisibilityChanged: (newVisibility) {
        setState(() {
          _isPasswordVisible = newVisibility;
        });
      },
    );
  }

  Future<void> _selectProfileImage() async {
    final File? selectedImage = await ImagePickerUtils.pickImageFromGallery();
    if (selectedImage != null) {
      setState(() {
        _profileImage = selectedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    usuario = ModalRoute.of(context)?.settings.arguments as Usuario;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 23, 93, 95),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null
                    ? Icon(Icons.person, size: 50, color: Colors.black)
                    : null,
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: _selectProfileImage,
                child: Text(
                  'Editar foto',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Nome: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: usuario.nome),
                  ],
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 4),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Data de Nascimento: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: usuario.dataNasc),
                  ],
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 4),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'E-mail: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: usuario.email),
                  ],
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Senha: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: _isPasswordVisible ? usuario.senha : '********',
                        ),
                      ],
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 4),
                  IconButton( 
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                    ),
                    onPressed: _togglePasswordVisible,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 23, 93, 95),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Preferências',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 23, 93, 95),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Alterar senha',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Configurações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box, color: Colors.white),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 23, 93, 95),
        onTap: _onItemTapped, // Usa a função de navegação utilitária
      ),
    );
  }
}