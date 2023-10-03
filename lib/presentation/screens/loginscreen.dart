import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:google_fonts/google_fonts.dart';
import 'package:team_picas_flutter_frontend/presentation/components/buttons/authbutton.dart';
import 'package:team_picas_flutter_frontend/presentation/components/textfields/texfieldcustom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _HomeViewState();
}

class _HomeViewState extends State<LoginScreen> {

  String _name = "";
  String _password = "";


  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Image(
                      image: AssetImage('assets/images/picas-logo-light.png')),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('Ingreso',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w800, fontSize: 30)),
                      TextFieldCustom(
                        text: 'Email',
                      ),
                      TextFieldCustom(
                        text: 'Contraseña',
                        isObscured: true,
                        subfixText: 'Olvidada?',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        child: FilledButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          child: Text("Ingresar Sesión"),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('O continua con'),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthButton(
                              assetPath:
                                  'assets/socialmedia-icons/icon-google.png',
                              text: 'Google'),
                          SizedBox(width: 20),
                          AuthButton(
                              assetPath:
                                  'assets/socialmedia-icons/icon-facebook.png',
                              text: 'Facebook'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No tienes una cuenta?'),
                          TextButton(
                              onPressed: () {},
                              child: Text('Registrarte ahora!'))
                        ],
                      )
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
}
