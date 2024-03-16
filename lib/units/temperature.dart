import 'package:flutter/services.dart';
import 'package:measure_app/importers.dart';


class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => TemperatureState();
}

class TemperatureState extends State<Temperature> {
  final textController = TextEditingController();
  List<String> toplam = ["C", "K", "F"];
  String info = """
  C  ->  Selsi
  K  ->  Kelvin
  F  ->  Farangeyt""";

  var drdwn = '--';
  var natija = "0.0 C\n"
      "0.0 K\n"
      "0.0 F";

  String harorat(String dr, String val) {
    if (val.isNotEmpty) {
      switch (dr) {
        case "C":
          {
            double edtValue = double.tryParse(val)!;
            var K = edtValue * 274.15;
            var F = edtValue * 33.8;

            return natija = "${K.toStringAsFixed(2)} K\n"
                "${F.toStringAsFixed(2)} F";
          }
        case "K":
          {
            double edtValue = double.tryParse(val)!;
            var C = edtValue * (-272.15);
            var F = edtValue * (-457.87);

            return natija = "${C.toStringAsFixed(2)} C\n"
                "${F.toStringAsFixed(2)} F";
          }
        case "F":
          {
            double edtValue = double.tryParse(val)!;
            var C = edtValue * (-17.22);
            var K = edtValue * 255.927;

            return natija = "${C.toStringAsFixed(2)} C\n"
                "${K.toStringAsFixed(2)} K";
          }
        default :
          {
            return natija = "Qiymatni tanlang!";
          }
      }
    } else {
      return natija = "0.0 C\n"
          "0.0 K\n"
          "0.0 F";
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
                                        fontSize: 30,
                                        color: Colors.white
                                    ),),
                                  )
                              )
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
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)
            )
        ),
        title: Text(
          "Harorat",
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
                          minWidth: (screenWidth / 100) * 60,
                          maxWidth: (screenWidth / 100) * 63,
                          minHeight: (screenHeight / 100) * 7.5,
                          maxHeight: (screenHeight / 100) * 7.5,
                        ),
                        margin: const EdgeInsets.only(left: 25),
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
                              harorat(drdwn, matn);
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
                          // width: 120,
                          // height: 70,
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
                                harorat(drdwn, matn);
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
                        minHeight: (screenHeight / 100) * 50,
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
                              margin:
                              EdgeInsets.only(left: 10, right: 10),
                              padding:
                              EdgeInsets.only(left: 5, right: 5),
                              constraints: BoxConstraints(
                                minHeight: (screenHeight / 100) * 8,
                                maxHeight: (screenHeight / 100) * 8,
                                minWidth: (screenWidth / 100) * 85,
                                maxWidth: (screenWidth / 100) * 95,
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
              ],
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      textController.clear();
                      drdwn = '--';
                      natija = "0.0 C\n"
                          "0.0 K\n"
                          "0.0 F";
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
          ),
        ),
      
    );
  }
}
