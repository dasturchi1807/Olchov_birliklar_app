import 'package:flutter/services.dart';
import 'package:measure_app/importers.dart';


class Liquid extends StatefulWidget {
  const Liquid({super.key});

  @override
  State<Liquid> createState() => LiquidState();
}

class LiquidState extends State<Liquid> {
  final textController = TextEditingController();
  List<String> toplam = ["ml", "cl", "dl", "l", "t"];
  String info = """
ml  ->  Millilitr
cl   ->  Santilitr
dl  ->  Ditsilitr
l    ->  Litr
t    ->  Tonna""";

  var drdwn = '--';
  var natija = "0.0 ml\n"
      "0.0 cl\n"
      "0.0 dl\n"
      "0.0 l\n"
      "0.0 t";

  String data(String dr, String val) {
    if (val.isNotEmpty) {
      switch (dr) {
        case "ml":
          {
            double edtValue = double.tryParse(val)!;
            var cl = edtValue / 10;
            var dl = edtValue / 100;
            var l = edtValue / 1000;
            var t = edtValue / 1000000;

            return natija = "${cl.toStringAsFixed(2)} cl\n"
                "${dl.toStringAsFixed(2)} dl\n"
                "${l.toStringAsFixed(2)} l\n"
                "${t.toStringAsFixed(2)} t";
          }
        case "cl":
          {
            double edtValue = double.tryParse(val)!;
            var ml = edtValue * 10;
            var dl = edtValue / 10;
            var l = edtValue / 100;
            var t = edtValue / 100000;

            return natija = "${ml.toStringAsFixed(2)} ml\n"
                "${dl.toStringAsFixed(2)} dl\n"
                "${l.toStringAsFixed(2)} l\n"
                "${t.toStringAsFixed(2)} t";

          }
        case "dl":
          {
            double edtValue = double.tryParse(val)!;
            var ml = edtValue * 100;
            var cl = edtValue * 10;
            var l = edtValue / 10;
            var t = edtValue / 10000;

            return natija = "${ml.toStringAsFixed(2)} ml\n"
                "${cl.toStringAsFixed(2)} cl\n"
                "${l.toStringAsFixed(2)} l\n"
                "${t.toStringAsFixed(2)} t";
          }
        case "l":
          {
            double edtValue = double.tryParse(val)!;
            var ml = edtValue * 1000;
            var cl = edtValue * 100;
            var dl = edtValue * 10;
            var t = edtValue / 1000;

            return natija = "${ml.toStringAsFixed(2)} ml\n"
                "${cl.toStringAsFixed(2)} cl\n"
                "${dl.toStringAsFixed(2)} dl\n"
                "${t.toStringAsFixed(2)} t";
          }
        case "t":
          {
            double edtValue = double.tryParse(val)!;
            var ml = edtValue * 1000000;
            var cl = edtValue * 100000;
            var dl = edtValue * 10000;
            var l = edtValue * 1000;

            return natija = "${ml.toStringAsFixed(2)} ml\n"
                "${cl.toStringAsFixed(2)} cl\n"
                "${dl.toStringAsFixed(2)} dl\n"
                "${l.toStringAsFixed(2)} l";
          }
        default :
          {
            return natija = "Qiymatni tanlang!";
          }
      }
    } else {
      return natija = "0.0 ml\n"
          "0.0 cl\n"
          "0.0 dl\n"
          "0.0 l\n"
          "0.0 t";
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
          // HAQIDA TUGMASI VA OYNASI
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: (screenHeight / 100) * 42,
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
                                    height: (screenHeight / 100) * 37.5,
                                    width: (screenWidth / 100) * 95,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage("images/board.jpg"),
                                      fit: BoxFit.cover
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey.shade200, width: 3),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 20,
                                        spreadRadius: 5
                                      )
                                    ]
                                  ),
                                  child: Center(
                                      child: Text(info, style: GoogleFonts.aBeeZee(
                                    fontSize: 30,
                                        color: Colors.white
                                  ),)),)
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
          "Suyuqlik",
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
                          maxWidth: (screenWidth / 100) * 65,
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
                              data(drdwn, matn);
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
                                data(drdwn, matn);
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
                              margin: const
                              EdgeInsets.only(left: 10, right: 10),
                              padding: const
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
                          natija = "0.0 ml\n"
                              "0.0 cl\n"
                              "0.0 dl\n"
                              "0.0 l\n"
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
          ],
          ),
        ),
    );
  }
}
