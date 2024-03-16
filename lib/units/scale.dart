import 'package:flutter/services.dart';
import 'package:measure_app/importers.dart';


class Scale extends StatefulWidget {
  const Scale({super.key});

  @override
  State<Scale> createState() => _ScaleState();
}

class _ScaleState extends State<Scale> {
  final textController = TextEditingController();
  List<String> toplam = ["mg", "gr", "kg", "q", "t"];
  String info = """
  mg  ->  Milligramm
  gr  ->  Gramm
  kg  ->  Kilogramm
  q   ->  Centner
  t   ->  Tonna""";
  var drdwn = '--';

  var natija = "0.0 mg\n"
      "0.0 gr\n"
      "0.0 kg\n"
      "0.0 q\n"
      "0.0 t";

 String ogirlik(String d, String v) {
    // var v = textController.text.toString();
    if (v.isNotEmpty) {
      switch (d) {
        case 'mg':
          {
            double edtValue = double.tryParse(v)!;
            var gr = edtValue / 1000.0;
            var kg = edtValue / 1000000.0;
            var q = edtValue / 100000000.0;
            var tonna = edtValue / 1000000000.0;

            return natija = "${gr.toStringAsFixed(2)} gr\n"
                "${kg.toStringAsFixed(2)} kg\n"
                "${q.toStringAsFixed(2)} q\n"
                "${tonna.toStringAsFixed(2)} t";
          }
        case 'gr':
          {
            double edtValue = double.tryParse(v)!;
            var mg = edtValue * 1000.0;
            var kg = edtValue / 1000.0;
            var q = edtValue / 100000.0;
            var tonna = edtValue / 1000000.0;

            return natija = "${mg.toStringAsFixed(2)} mg\n"
                "${kg.toStringAsFixed(2)} kg\n"
                "${q.toStringAsFixed(2)} q\n"
                "${tonna.toStringAsFixed(2)} t";
          }
        case 'kg':
          {
            double edtValue = double.tryParse(v)!;
            var mg = edtValue * 1000000.0;
            var gr = edtValue * 1000;
            var q = edtValue / 100.0;
            var tonna = edtValue / 1000.0;

            return natija = "${mg.toStringAsFixed(2)} mg\n"
                "${gr.toStringAsFixed(2)} gr\n"
                "${q.toStringAsFixed(2)} q\n"
                "${tonna.toStringAsFixed(2)} t";
          }

        case "q":
          {
            double edtValue = double.tryParse(v)!;
            var mg = edtValue * 100000000.0;
            var gr = edtValue * 100000.0;
            var kg = edtValue * 100.0;
            var tonna = edtValue / 10.0;

            return natija = "${mg.toStringAsFixed(2)} mg\n"
                "${gr.toStringAsFixed(2)} gr\n"
                "${kg.toStringAsFixed(2)} kg\n"
                "${tonna.toStringAsFixed(2)} t";
          }

        case 't':
          {
            double edtValue = double.tryParse(v)!;
            var mg = edtValue * 1000000000.0;
            var gr = edtValue * 1000000.0;
            var kg = edtValue * 1000.0;
            var q = edtValue * 10.0;

            return natija = "${mg.toStringAsFixed(2)} mg\n"
                "${gr.toStringAsFixed(2)} gr\n"
                "${kg.toStringAsFixed(2)} kg\n"
                "${q.toStringAsFixed(2)} q";
          }
        default:
          {
            return natija = 'Qiymat tanlang!';
          }
      }
    }
    else {
      return natija = "0.0 mg\n"
          "0.0 gr\n"
          "0.0 kg\n"
          "0.0 q\n"
          "0.0 t";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                                  height: (screenHeight / 100) * 35,
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
                                    ),)
                                  ),
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
        title: Text("Og'irlik", style: GoogleFonts.aBeeZee(
            fontSize: 30,
          color: Colors.black
        )),
        backgroundColor: Colors.orangeAccent.shade100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)
          )
        ),
      ),
      body: Container(
          width: screenWidth,
          height: screenHeight,
          // color: Colors.brown.shade100,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/woo2.jpg'),
              fit: BoxFit.cover
            )
          ),
          child:
              ListView(children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(children: [
                      // KIRITISH TUGMASI
                      Container(
                        constraints: BoxConstraints(
                          minWidth: (screenWidth / 100) * 60,
                          maxWidth: (screenWidth / 100) * 65,
                          minHeight: (screenHeight / 100) * 7.5,
                          maxHeight: (screenHeight / 100) * 7.5,
                        ),
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.lightBlue, width: 2),
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
                              hintStyle: GoogleFonts.aBeeZee(),
                              hintText: "Kiriting...",
                              border: InputBorder.none),
                          controller: textController,
                          onChanged: (t) {
                            setState(() {
                              var matn = textController.text.toString();
                              ogirlik(drdwn, matn);
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
                          minWidth: (screenWidth / 100) * 15,
                          maxWidth: (screenWidth / 100) * 25,
                          minHeight: (screenHeight / 100) * 7.5,
                          maxHeight: (screenHeight / 100) * 7.5,
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
                                ogirlik(drdwn, matn);
                              });
                            },
                            hint: Text(
                              drdwn,
                              style: const TextStyle(fontSize: 30),
                            ),
                            underline: Container(),
                            iconSize: 30,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ))
                    ]),
                    // NATIJA CHIQUVCHI MAYDON
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                        constraints: BoxConstraints(
                            minWidth: screenWidth,
                            maxWidth: screenWidth,
                            minHeight: (screenHeight / 100) * 50,
                            maxHeight: (screenHeight / 100) * 60
                        ),
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.white, width: 2)),
                      child: ListView(
                        padding: EdgeInsets.only(top: 20),
                        children: natija
                            .split('\n')
                            .map((e) => Column(
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        minHeight: (screenHeight / 100) * 8,
                                        maxHeight: (screenHeight / 100) * 8,
                                        minWidth: (screenWidth / 100) * 85,
                                        maxWidth: (screenWidth / 100) * 95,
                                      ),
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(color: Colors.green, width: 2),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 5),
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                            )
                                          ]),
                                      child: Center(
                                          child: SelectableText(
                                        e,
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: 25
                                        ),
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              textController.clear();
                              drdwn = '--';
                              natija = "0.0 mg\n"
                                  "0.0 gr\n"
                                  "0.0 kg\n"
                                  "0.0 q\n"
                                  "0.0 t";
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
              ])));
  }
}
