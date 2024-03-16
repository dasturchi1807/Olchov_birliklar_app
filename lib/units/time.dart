import 'package:flutter/services.dart';
import 'package:measure_app/importers.dart';


class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => TimeState();
}

class TimeState extends State<Time> {
  final textController = TextEditingController();
  List<String> toplam = ["s", "min", "h", "d", "wk", "y"];
  String info = """
  s  ->  Sekund
  min  ->  Daqiqa
  h  ->  Soat
  d  ->  Kun
  wk  ->  Hafta
  y  ->  Yil""";
  var drdwn = '--';
  var natija = "0.0 s\n"
      "0.0 min\n"
      "0.0 h\n"
      "0.0 d\n"
      "0.0 wk\n"
      "0.0 y";

  String vaqt(String dr, String val) {
    if (val.isNotEmpty) {
      switch (dr) {
        case "s":
          {
            double edtValue = double.tryParse(val)!;
            var min = edtValue / 60;
            var h = edtValue / 3600;
            var d = edtValue / (24 * 3600);
            var wk = edtValue / (86400 * 7);
            var y = edtValue / (86400 * 365);

            return natija = "${min.toStringAsFixed(2)} min\n"
                "${h.toStringAsFixed(2)} h\n"
                "${d.toStringAsFixed(2)} d\n"
                "${wk.toStringAsFixed(2)} wk\n"
                "${y.toStringAsFixed(2)} y";
          }
        case "min":
          {
            double edtValue = double.tryParse(val)!;
            var s = edtValue * 60;
            var h = edtValue / 60;
            var d = edtValue / (60 * 24);
            var wk = edtValue / (1440 * 7);
            var y = edtValue / (1440 * 365);

            return natija = "${s.toStringAsFixed(2)} s\n"
                "${h.toStringAsFixed(2)} h\n"
                "${d.toStringAsFixed(2)} d\n"
                "${wk.toStringAsFixed(2)} wk\n"
                "${y.toStringAsFixed(2)} y";
          }
        case "h":
          {
            double edtValue = double.tryParse(val)!;
            var s = edtValue * 3600;
            var min = edtValue * 60;
            var d = edtValue / 24;
            var wk = edtValue / (24 * 7);
            var y = edtValue / (24 * 365);

            return natija = "${s.toStringAsFixed(2)} s\n"
                "${min.toStringAsFixed(2)} min\n"
                "${d.toStringAsFixed(2)} d\n"
                "${wk.toStringAsFixed(2)} wk\n"
                "${y.toStringAsFixed(2)} y";
          }
        case "d":
          {
            double edtValue = double.tryParse(val)!;
            var s = edtValue * (24 * 3600);
            var min = edtValue * (24 * 60);
            var h = edtValue * 24;
            var wk = edtValue / 7;
            var y = edtValue / 365;

            return natija = "${s.toStringAsFixed(2)} s\n"
                "${min.toStringAsFixed(2)} min\n"
                "${h.toStringAsFixed(2)} h\n"
                "${wk.toStringAsFixed(2)} wk\n"
                "${y.toStringAsFixed(2)} y";
          }
        case "wk":
          {
            double edtValue = double.tryParse(val)!;
            var s = edtValue * 604800;
            var min = edtValue * 10080;
            var h = edtValue * 168;
            var d = edtValue * 7;
            var y = edtValue * 52.143;

            return natija = "${s.toStringAsFixed(2)} s\n"
                "${min.toStringAsFixed(2)} min\n"
                "${h.toStringAsFixed(2)} h\n"
                "${d.toStringAsFixed(2)} d\n"
                "${y.toStringAsFixed(2)} y";
          }
        case "y": {
          double edtValue = double.tryParse(val)!;
          var s = edtValue * 31536000;
          var min = edtValue * 525600;
          var h = edtValue * 8760;
          var d = edtValue * 365;
          var wk = edtValue * 52.143;

          return natija = "${s.toStringAsFixed(2)} s\n"
              "${min.toStringAsFixed(2)} min\n"
              "${h.toStringAsFixed(2)} h\n"
              "${d.toStringAsFixed(2)} d\n"
              "${wk.toStringAsFixed(2)} wk";
        }
        default :
          {
            return natija = "Qiymatni tanlang!";
          }
      }
    } else {
      return natija = "0.0 s\n"
          "0.0 min\n"
          "0.0 h\n"
          "0.0 d\n"
          "0.0 wk\n"
          "0.0 y";
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
                        height: (screenHeight / 100) * 43,
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
                                  height: (screenHeight / 100) * 39,
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
                                      fontSize: 28,
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
        backgroundColor: Colors.orangeAccent.shade100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
          )
        ),
        title: Text(
          "Vaqt",
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
                          minWidth: (screenWidth / 100) * 57,
                          maxWidth: (screenWidth / 100) * 60,
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
                              vaqt(drdwn, matn);
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
                            maxWidth: (screenWidth / 100) * 25,
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
                                enabled: true,
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                drdwn = value!;
                                var matn = textController.text.toString();
                                vaqt(drdwn, matn);
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
                  height: 30,
                ),
                //   NATIJA CHIQUVCHI MAYDON
                Container(
                  constraints: BoxConstraints(
                    minWidth: screenWidth,
                    maxWidth: screenWidth,
                    minHeight: (screenHeight / 100) * 58,
                    maxHeight: (screenHeight / 100) * 65
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
                              const EdgeInsets.only(left: 10, right: 10),
                              padding:
                              const EdgeInsets.only(left: 10, right: 5),
                              constraints: BoxConstraints(
                                  minWidth: (screenWidth / 100) * 85,
                                maxWidth: (screenWidth / 100) * 95,
                                minHeight: (screenHeight / 100) * 7.5,
                                maxHeight: (screenHeight / 100) * 7.5,
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
                                    fontSize: 25,
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
                          natija = "0.0 s\n"
                              "0.0 min\n"
                              "0.0 h\n"
                              "0.0 d\n"
                              "0.0 wk\n"
                              "0.0 y";
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
