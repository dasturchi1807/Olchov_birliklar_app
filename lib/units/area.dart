import 'package:flutter/services.dart';
import 'package:measure_app/importers.dart';


class Area extends StatefulWidget {
  const Area({super.key});

  @override
  State<Area> createState() => AreaState();
}

class AreaState extends State<Area> {
  final textController = TextEditingController();
  List<String> toplam = ["mm²", "cm²", "m²", "ha", "km²"];
  String info = """
  mm²  ->  Millimetr kvadrat
  cm²  ->  Santimetr kvadrat
  m²  ->  Detsimetr kvadrat
  ha   ->  Gektar
  km²  ->  Kilometr kvadrat""";

  var drdwn = '--';
  var natija = "0.0 mm²\n"
      "0.0 cm²\n"
      "0.0 m²\n"
      "0.0 ha\n"
      "0.0 km²";

  String hudud(String dr, String val) {
    if (val.isNotEmpty) {
      switch (dr) {
        case "mm²":
          {
            double edtValue = double.tryParse(val)!;
            var cm2 = edtValue / 100;
            var m2 = edtValue / 1000000;
            var ha = edtValue / 10000000000;
            var km2 = edtValue / 1000000000000;

            return natija = "${cm2.toStringAsFixed(2)} cm²\n"
                "${m2.toStringAsFixed(2)} m²\n"
                "${ha.toStringAsFixed(2)} ha\n"
                "${km2.toStringAsFixed(2)} km²";
          }
        case "cm²":
          {
            double edtValue = double.tryParse(val)!;
            var mm2 = edtValue * 100;
            var m2 = edtValue / 10000;
            var ha = edtValue / 10000000;
            var km2 = edtValue / 10000000000;

            return natija = "${mm2.toStringAsFixed(2)} mm\n"
                "${m2.toStringAsFixed(2)} m²\n"
                "${ha.toStringAsFixed(2)} ha\n"
                "${km2.toStringAsFixed(2)} km²";
          }
        case "m²":
          {
            double edtValue = double.tryParse(val)!;
            var mm2 = edtValue * 1000000;
            var cm2 = edtValue * 10000;
            var ha = edtValue / 10000;
            var km2 = edtValue / 1000000;

            return natija = "${mm2.toStringAsFixed(2)} mm²\n"
                "${cm2.toStringAsFixed(2)} cm²\n"
                "${ha.toStringAsFixed(2)} ha\n"
                "${km2.toStringAsFixed(2)} km²";
          }
        case "ha":
          {
            double edtValue = double.tryParse(val)!;
            var mm2 = edtValue * 10000000000;
            var cm2 = edtValue * 100000000;
            var m2 = edtValue * 10000;
            var km2 = edtValue / 100;

            return natija = "${mm2.toStringAsFixed(2)} mm²\n"
                "${cm2.toStringAsFixed(2)} cm²\n"
                "${m2.toStringAsFixed(2)} m²\n"
                "${km2.toStringAsFixed(2)} km²";
          }
        case "km²":
          {
            double edtValue = double.tryParse(val)!;
            var mm2 = edtValue * 1000000000000;
            var cm2 = edtValue * 10000000000;
            var m2 = edtValue * 1000000;
            var ha = edtValue * 100;

            return natija = "${mm2.toStringAsFixed(2)} mm²\n"
                "${cm2.toStringAsFixed(2)} cm²\n"
                "${m2.toStringAsFixed(2)} m²\n"
                "${ha.toStringAsFixed(2)} ha";
          }
        default :
          {
            return natija = "Qiymatni tanlang!";
          }
      }
    } else {
      return natija = "0.0 mm²\n"
          "0.0 cm²\n"
          "0.0 m²\n"
          "0.0 ha\n"
          "0.0 km²";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      primary: true,
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
          "Maydon",
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
                          maxWidth: (screenWidth / 100) * 61,
                          minHeight: (screenHeight / 100) * 7.5,
                          maxHeight: (screenHeight / 100) * 7.5,
                        ),
                        margin: const EdgeInsets.only(left: 15),
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
                              hudud(drdwn, matn);
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
                                hudud(drdwn, matn);
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
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          textController.clear();
                          drdwn = '--';
                          natija = "0.0 mm²\n"
                              "0.0 cm²\n"
                              "0.0 m²\n"
                              "0.0 ha\n"
                              "0.0 km²";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: CircleBorder(side: BorderSide(color: Colors.red, width: 2)),
                          fixedSize: Size(100, 70)
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
