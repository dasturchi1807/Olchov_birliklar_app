import 'package:flutter/services.dart';
import 'package:measure_app/importers.dart';


class Speed extends StatefulWidget {
  const Speed({super.key});

  @override
  State<Speed> createState() => SpeedState();
}

class SpeedState extends State<Speed> {
  final textController = TextEditingController();
  List<String> toplam = ["m/s", "km/s", "km/h", "mph", "c"];
  String info = """
m/s    ->  Metr/sekund
km/s   ->  Km/sekund
km/h  ->  Km/soat
mph   ->  Mil/soat
 c       ->  Yorug'lik tezligi""";

  var drdwn = '--';
  var natija = "0.0 c\n"
  "0.0 m/s\n"
  "0.0 km/h\n"
  "0.0 km/s\n"
  "0.0 mph";

  String tezlik(String dr, String val) {
    if (val.isNotEmpty) {
      switch (dr) {
        case "m/s":
          {
            double edtValue = double.tryParse(val)!;
            var kms = edtValue * 0.001;
            var kmh = edtValue * 3.6;
            var mph = edtValue * 2.23694;
            var c = edtValue / 299792458;

            return natija = "${kms.toStringAsFixed(2)} km/s\n"
                "${kmh.toStringAsFixed(2)} km/h\n"
                "${mph.toStringAsFixed(2)} mph\n"
                "${c.toStringAsFixed(2)} c";
          }
        case "km/s":
          {
            double edtValue = double.tryParse(val)!;
            var ms = edtValue / 0.001;
            var kmh = edtValue * 3600;
            var mph = edtValue * 2.237;
            var c = edtValue / 299792458;

            return natija = "${ms.toStringAsFixed(2)} m/s\n"
                "${kmh.toStringAsFixed(2)} km/h\n"
                "${mph.toStringAsFixed(2)} mph\n"
                "${c.toStringAsFixed(2)} c";
          }
        case "km/h":
          {
            double edtValue = double.tryParse(val)!;
            var ms = edtValue / 3.6;
            var kms = edtValue / 3600;
            var mph = edtValue * 0.621371;
            var c = (edtValue / 3600) / 299792458;

            return natija = "${ms.toStringAsFixed(2)} m/s\n"
                "${kms.toStringAsFixed(2)} km/s\n"
                "${mph.toStringAsFixed(2)} mph\n"
                "${c.toStringAsFixed(2)} c";
          }
        case "mph":
          {
            double edtValue = double.tryParse(val)!;
            var ms = edtValue / 2.23694;
            var kms = (edtValue / 2.237) / 1000;
            var kmh = edtValue / 0.621371;
            var c = edtValue / 670616629;

            return natija = "${ms.toStringAsFixed(2)} m/s\n"
                "${kms.toStringAsFixed(2)} km/s\n"
                "${kmh.toStringAsFixed(2)} kmh\n"
                "${c.toStringAsFixed(2)} c";
          }
        case "c":
          {
            double edtValue = double.tryParse(val)!;
            var ms = edtValue * 299792458;
            var kms = (ms / 1000) * edtValue;
            var kmh = ms * 3600;
            var mph = edtValue * 670616629;

            return natija = "${ms.toStringAsFixed(2)} m/s\n"
                "${kms.toStringAsFixed(2)} km/s\n"
                "${kmh.toStringAsFixed(2)} km/h\n"
                "${mph.toStringAsFixed(2)} mph";
          }
        default :
          {
            return natija = "Qiymatni tanlang!";
          }
      }
    } else {
     return natija = "0.0 c\n"
          "0.0 m/s\n"
          "0.0 km/h\n"
          "0.0 km/s\n"
          "0.0 mph";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: (screenHeight / 100) * 40,
                          width: screenWidth,
                          child: Container(
                              child: Column(
                                children: [
                                  const Divider(
                                    color: Colors.grey,
                                    indent: 140,
                                    endIndent: 140,
                                    thickness: 4,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: (screenHeight / 100) * 36,
                                    width: (screenWidth / 100) * 95,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey.shade200, width: 3),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 15,
                                            spreadRadius: 5
                                          )
                                        ],
                                      image: const DecorationImage(
                                        image: AssetImage("images/board.jpg"),
                                        fit: BoxFit.cover
                                      )
                                    ),
                                    child: Center(
                                        child: Text(info, style: GoogleFonts.aBeeZee(
                                      fontSize: 26,
                                      color: Colors.white
                                    ),)
                                  ))
                                ],
                              )
                          ),
                        );
                      });
                },
                icon: const Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ),
              ),
          ],
          centerTitle: true,
          backgroundColor: Colors.orangeAccent.shade100,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)
            )
          ),
          title: Text(
            "Tezlik",
            style: GoogleFonts.aBeeZee(
              fontSize: 30,
            ),
          ),
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/woo2.jpg"), fit: BoxFit.cover),
          ),
          child:
            ListView(children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      // KIRITISH TUGMASI
                      Container(
                        constraints: BoxConstraints(
                            minWidth: (screenWidth / 100) * 55,
                            maxWidth: (screenWidth / 100) * 60,
                            minHeight: (screenHeight / 100) * 7.5,
                            maxHeight: (screenHeight / 100) * 7.5
                        ),
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.lightBlue, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(-2, 2),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black54)
                            ]),
                        child: TextField(
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(10)
                          ],
                          style: const TextStyle(fontSize: 30),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintStyle: GoogleFonts.aBeeZee(fontSize: 30),
                              hintText: "Kiriting...",
                              border: InputBorder.none),
                          controller: textController,
                          onChanged: (t) {
                            setState(() {
                              var matn = textController.text.toString();
                              tezlik(drdwn, matn);
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // TANLASH TUGMASI
                      Container(
                          constraints: BoxConstraints(
                              minWidth: (screenWidth / 100) * 20,
                              maxWidth: (screenWidth / 100) * 30,
                              minHeight: (screenHeight / 100) * 7.5,
                              maxHeight: (screenHeight / 100) * 7.5
                          ),
                          padding: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                              Border.all(color: Colors.lightBlue, width: 2),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(-2, 2),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black54),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            padding: const EdgeInsets.only(left: 10),
                            dropdownColor: Colors.white,
                            style: GoogleFonts.aBeeZee(
                                fontSize: 25, color: Colors.black),
                            items: toplam.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                drdwn = value!;
                                var matn = textController.text.toString();
                                tezlik(drdwn, matn);
                              });
                            },
                            hint: Center(
                              child:Text(
                              drdwn,
                              style: const TextStyle(fontSize: 30),
                            ),),
                            underline: Container(),
                            iconSize: 30,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ))
                    ]),
                  const SizedBox(
                    height: 40,
                  ),
                    // NATIJA CHIQARISH MAYDONI
                    Container(
                        constraints: BoxConstraints(
                            minWidth: screenWidth,
                            maxWidth: screenWidth,
                            minHeight: (screenHeight / 100) * 58,
                            maxHeight: (screenHeight / 100) * 60
                        ),
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.black, width: 2)
                      // ),
                      child: ListView(
                        padding: const EdgeInsets.only(top: 20),
                        children: natija.split('\n').map((e) => Column(
                          children: [
                            Container(
                                margin: const
                                EdgeInsets.only(left: 10, right: 10),
                                padding: const
                                EdgeInsets.only(left: 10, right: 5),
                                constraints: BoxConstraints(
                                  minWidth: (screenWidth / 100) * 85,
                                  maxWidth: (screenWidth / 100) * 90,
                                  minHeight: (screenHeight / 100) * 8,
                                  maxHeight: (screenHeight / 100) * 8,
                                ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.green, width: 2),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 5),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                  ),
                                ]
                              ),
                              child: Center(
                                child: SelectableText(e, style: GoogleFonts.aBeeZee(
                                  fontSize: 25
                                ),),
                              )
                            ),
                            const SizedBox(
                              height: 25,
                            )
                          ],
                        )).toList(),
                      )
                    ),
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            textController.clear();
                            drdwn = '--';
                            natija = "0.0 c\n"
                                "0.0 m/s\n"
                                "0.0 km/h\n"
                                "0.0 km/s\n"
                                "0.0 mph";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder(side: BorderSide(color: Colors.red, width: 2)),
                            fixedSize: Size(screenWidth / 100 * 22, screenHeight / 100 * 8.5)
                          // fixedSize: Size((screenWidth / 100 * 80), (screenHeight / 100 * 6.5))
                        ),
                        child:
                        const Icon(
                            Icons.refresh,
                            size: 40,
                            color: Colors.black
                        )
                    ),
                  ),
                    ],
                  )
                ],
              ),
            ),
      
        );
  }
}
