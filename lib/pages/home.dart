import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  dynamic data = {};

  @override
  Widget build(BuildContext context) {
    
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments;

    String bgImage = data['isDayLight'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayLight'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 50.0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location'); // return from pop with new informations
                    setState(() {
                      data = result;
                    });
                  }, 
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                    ), 
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
                SizedBox(height: 30.0),
                Image.asset(
                  'assets/${data['flag']}',
                  width: 200,
                  height: 100,
                  fit:BoxFit.fill  
                  ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 80.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                   
                  ],
                ),
                SizedBox(height: 50.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 50.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}