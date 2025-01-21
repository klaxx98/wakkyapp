import 'package:flutter/material.dart';

void main() {
  runApp(WakkyApp());
}

class WakkyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wakky App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Iniciar con la pantalla de Login
    );
  }
}

/*
* PANTALLA DE LOGIN
*/
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagen local
            Image.asset(
              'assets/login_image.png', // Ruta de la imagen en assets
              height: 150, // Altura de la imagen
            ),
            SizedBox(height: 32), // Espaciado entre la imagen y los campos
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
* PANTALLA PRINCIPAL
*/

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'LA MEJOR AYUDA PROFESIONAL EN LO QUE NECESITES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Busco ayuda en...',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PCScreen()),
                );
              },
              child: Text('COMPUTADORAS'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SmartphoneScreen()),
                );
              },
              child: Text('SMARTPHONES'),
            ),
          ],
        ),
      ),
    );
  }
}

/*
* PANTALLA DE SERVICIO COMPUTACION
*/

class PCScreen extends StatefulWidget {
  @override
  _PCScreenState createState() => _PCScreenState();
}

class _PCScreenState extends State<PCScreen> {
  String postalAddress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicio Técnico de Computadoras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Encuentra servicio técnico para tu computador de escritorio o portátil',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text('Mi dirección postal...'),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      postalAddress = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa tu dirección postal',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Continuar'),
                ),
              ],
            ),
            if (postalAddress.isNotEmpty) ...[
              SizedBox(height: 16),
              Text(
                'Profesionales cerca de ti',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    ProfessionalCard(
                      name: 'Pro1',
                      contracts: 10,
                      imagePath: 'assets/profile_picture.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewProScreen(
                              proName: 'Pro1',
                              imagePath: 'assets/profile_picture.png',
                              successfulContracts: 10,
                              address: 'Dirección de Pro1',
                              positiveReviews: 15,
                            ),
                          ),
                        );
                      },
                    ),
                    ProfessionalCard(
                      name: 'Pro2',
                      contracts: 10,
                      imagePath: 'assets/profile_picture.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewProScreen(
                              proName: 'Pro2',
                              imagePath: 'assets/profile_picture.png',
                              successfulContracts: 10,
                              address: 'Dirección de Pro2',
                              positiveReviews: 20,
                            ),
                          ),
                        );
                      },
                    ),
                    ProfessionalCard(
                      name: 'Pro3',
                      contracts: 10,
                      imagePath: 'assets/profile_picture.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewProScreen(
                              proName: 'Pro3',
                              imagePath: 'assets/profile_picture.png',
                              successfulContracts: 10,
                              address: 'Dirección de Pro3',
                              positiveReviews: 25,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/*
* PANTALLAS DE SERVICIO SMARTPHONE
*/

class SmartphoneScreen extends StatefulWidget {
  @override
  _SmartphoneScreenState createState() => _SmartphoneScreenState();
}

class _SmartphoneScreenState extends State<SmartphoneScreen> {
  String postalAddress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicio Técnico de Smartphones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Encuentra servicio técnico para tu smartphone',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text('Mi dirección postal...'),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      postalAddress = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa tu dirección postal',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Continuar'),
                ),
              ],
            ),
            if (postalAddress.isNotEmpty) ...[
              SizedBox(height: 16),
              Text(
                'Profesionales cerca de ti',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    ProfessionalCard(
                      name: 'Pro1',
                      contracts: 10,
                      imagePath: 'assets/profile_picture.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewProScreen(
                              proName: 'Pro1',
                              imagePath: 'assets/profile_picture.png',
                              successfulContracts: 10,
                              address: 'Dirección de Pro1',
                              positiveReviews: 15,
                            ),
                          ),
                        );
                      },
                    ),
                    ProfessionalCard(
                      name: 'Pro2',
                      contracts: 10,
                      imagePath: 'assets/profile_picture.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewProScreen(
                              proName: 'Pro2',
                              imagePath: 'assets/profile_picture.png',
                              successfulContracts: 10,
                              address: 'Dirección de Pro2',
                              positiveReviews: 20,
                            ),
                          ),
                        );
                      },
                    ),
                    ProfessionalCard(
                      name: 'Pro3',
                      contracts: 10,
                      imagePath: 'assets/profile_picture.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewProScreen(
                              proName: 'Pro3',
                              imagePath: 'assets/profile_picture.png',
                              successfulContracts: 10,
                              address: 'Dirección de Pro3',
                              positiveReviews: 25,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/*
* CARTA DE PROFESIONAL
*/

class ProfessionalCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final int contracts;
  final VoidCallback onTap;

  ProfessionalCard({
    required this.name,
    required this.imagePath,
    required this.contracts,
    required this.onTap,
  });

/*
* BOTON DE PROFESIONAL
*/

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,  // Ejecuta la navegación cuando se toca la tarjeta
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Foto de perfil
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imagePath),
              ),
              SizedBox(width: 16),
              // Nombre del profesional y número de contrataciones
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '$contracts contrataciones',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
* PANTALLA DE PERFIL DE PROFESIONAL
*/

class ViewProScreen extends StatelessWidget {
  final String proName;
  final String imagePath;
  final int successfulContracts;
  final String address;
  final int positiveReviews;

  ViewProScreen({
    required this.proName,
    required this.imagePath,
    required this.successfulContracts,
    required this.address,
    required this.positiveReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Profesional'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto de perfil y nombre
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(imagePath),
                    ),
                    SizedBox(height: 8),
                    Text(
                      proName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Acerca de
              Text(
                'Acerca de $proName',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Descripción de $proName'),
              SizedBox(height: 16),
              // Desempeño general
              Text(
                'Desempeño general',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blueGrey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🏆 $successfulContracts contrataciones exitosas',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '🌎 $address',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '🥇 $positiveReviews valoraciones positivas de los usuarios',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              // Agendar cita
              Center(
                child: Column(
                  children: [
                    Text(
                      'AGENDA TU CITA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Navegar a la pantalla de agendar cita
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScheduleAppointmentScreen(
                              proName: proName,
                              imagePath: imagePath,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: Text(
                        'Contactar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleAppointmentScreen extends StatelessWidget {
  final String proName;
  final String imagePath;

  ScheduleAppointmentScreen({
    required this.proName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar Cita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado: Foto del profesional y su nombre
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(imagePath),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    proName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Mensaje personalizado del profesional
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
                color: Colors.grey[100],
              ),
              child: Text(
                'Ofrezco servicios de mantenimiento de máquina, instalación y actualización de software y hardware. '
                'Venta de periféricos y componentes. Precio inicial por diagnóstico: \$5',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Spacer(),
            // Botón de agendar cita
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Mostrar AlertDialog al presionar el botón
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Cita agendada',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Text('Espera confirmación del profesional'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Cerrar el AlertDialog
                          },
                          child: Text('Cerrar'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  backgroundColor: Colors.blueAccent, // Color del botón
                ),
                child: Text(
                  'Agendar cita',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}