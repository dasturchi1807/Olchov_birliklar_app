import 'importers.dart';


void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        // Asosiy background
        body: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/woo2.jpg'), fit: BoxFit.cover)),
            child: ListView(scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(bottom: 50),
                children: [
              Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  // SARLAVHA QISMI
                  Container(
                    constraints: BoxConstraints(
                      minWidth: (screenWidth / 100) * 85,
                      maxWidth: (screenWidth / 100) * 90,
                      minHeight: (screenHeight / 100) * 7,
                      maxHeight: (screenHeight / 100) * 8
                    ),
                    padding: const EdgeInsets.only(left: 55, top: 8),
                    decoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 90,
                              spreadRadius: 15)
                        ]),
                    child: Text(
                      "O'lchov birliklar",
                      style: GoogleFonts.lexendDeca(
                        fontSize: 30
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  // TUGMALAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: (screenHeight / 100) * 18,
                        width: (screenWidth / 100) * 38,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 15
                            ),
                          ]
                        ),
                        child:
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Length()));
                        },
                        style: TextButton.styleFrom(
                          elevation: 20,
                          // fixedSize: const Size(150, 150),
                          backgroundColor: Colors.amber.shade100,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                           const Icon(Icons.bar_chart, size: 60, color: Colors.orange),
                             Text(
                                "Uzunlik",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 30, color: Colors.orange, fontWeight: FontWeight.bold),
                              ),
                          ],
                        ),
                      ),
                      ),
                      Container(
                        height: (screenHeight / 100) * 18,
                        width: (screenWidth / 100) * 38,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 15
                              ),
                            ]
                        ),
                        child:
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Scale()));
                          });
                        },
                        style: TextButton.styleFrom(
                          elevation: 15,
                          backgroundColor: Colors.amber.shade100,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(Icons.scale, size: 60, color: Colors.black54),
                            Text(
                              "Og'irlik",
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 30, color: Colors.black54, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(height: (screenHeight / 100) * 18,
                        width: (screenWidth / 100) * 38,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 15
                              ),
                            ]
                        ),
                        child:
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Time()));
                        },
                        style: TextButton.styleFrom(
                          elevation: 15,
                          backgroundColor: Colors.amber.shade100,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(Icons.access_time, size: 60, color: Colors.green),
                            Text(
                              "Vaqt",
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),),
                      Container(
                        height: (screenHeight / 100) * 18,
                        width: (screenWidth / 100) * 38,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 15
                              ),
                            ]
                        ),
                        child:
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Data()));
                        },
                        style: TextButton.styleFrom(
                          // elevation: 20,
                          backgroundColor: Colors.amber.shade100,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(Icons.data_thresholding_outlined, size: 60, color: Colors.indigo),
                            Container(
                              // padding: EdgeInsets.only(left:  30),
                              child: Text(
                              "Axborot",
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 30, color: Colors.indigo, fontWeight: FontWeight.bold),
                            ))
                          ],
                        ),
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: (screenHeight / 100) * 18,
                        width: (screenWidth / 100) * 38,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 15
                              ),
                            ]
                        ),
                        child:
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Speed()));
                        },
                        style: TextButton.styleFrom(
                          elevation: 15,
                          backgroundColor: Colors.amber.shade100,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(Icons.speed, size: 60, color: Colors.red,),
                            Text(
                              "Tezlik",
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),),
                      Container(
                        height: (screenHeight / 100) * 18,
                        width: (screenWidth / 100) * 38,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 15
                              ),
                            ]
                        ),
                        child:
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Liquid()));
                        },
                        style: TextButton.styleFrom(
                          elevation: 15,
                          backgroundColor: Colors.amber.shade100,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(Icons.water_drop, size: 60, color: Colors.cyan,),
                            Text(
                              "Suyuqlik",
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 30, color: Colors.cyan, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: (screenHeight / 100) * 18,
                        width: (screenWidth / 100) * 38,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 15
                              ),
                            ]
                        ),
                        child:
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Temperature()));
                          },
                          style: TextButton.styleFrom(
                            elevation: 20,
                            // fixedSize: const Size(150, 150),
                            backgroundColor: Colors.amber.shade100,
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Image(image: AssetImage("images/temp_icon.png"), height: 60, color: Colors.amber,),
                              Text(
                                "Harorat",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 30, color: Colors.amber, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: (screenHeight / 100) * 18,
                        width: (screenWidth / 100) * 38,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 15
                              ),
                            ]
                        ),
                        child:
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Area()));
                            });
                          },
                          style: TextButton.styleFrom(
                            elevation: 15,
                            backgroundColor: Colors.amber.shade100,
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Icon(Icons.area_chart, size: 60, color: Colors.grey),
                              Text(
                                "Maydon",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 30, color: Colors.grey, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ])),
    );
  }
}
