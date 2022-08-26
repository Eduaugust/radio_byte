import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Radio byte Jr
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(22),
                  margin: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: Color(0xFF3E3E3E),
                  ),
                  child: Text('Radio Byte Jr.',
                      style: TextStyle(
                        color: Color(0xFFFEB388),
                        fontSize: 22,
                      )),
                ),
              ],
            ),

            // Imagem
            Container(
              padding: EdgeInsets.all(22),
              width: size.width * 0.72,
              height: size.width * 0.72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFABE2EA),
              ),
              child: Center(
                  child: Text('IMAGEM',
                      style: GoogleFonts.lato(
                          fontSize: 48, fontWeight: FontWeight.w300))),
            ),

            // Numero, nome e Slider e botoes para mudar de faixa
            SizedBox(width: size.width * 0.9, child: SliderCustomize()),

            Spacer(),

            Container(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 20, right: 20),
              margin: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Color(0xFF3E3E3E),
                borderRadius: BorderRadius.circular(30),
              ),
              child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/byte.png',
                      fit: BoxFit.fitHeight,
                    ),
                    Text('Projeto trainee 2022/2',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Color(0xFFFEB388),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderCustomize extends StatefulWidget {
  const SliderCustomize({Key? key}) : super(key: key);

  @override
  State<SliderCustomize> createState() => _SliderCustomizeState();
}

class _SliderCustomizeState extends State<SliderCustomize> {
  void move_right() {
    setState(() {
      slider_value += 0.1;
    });
  }

  void move_left() {
    setState(() {
      slider_value -= 0.1;
    });
  }

  double slider_value = 90.2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Nome e numero
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(slider_value.toStringAsFixed(1),
                  style: GoogleFonts.lato(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  )),
              Text('Radio Oceano',
                  style: GoogleFonts.lato(
                      fontSize: 32, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        // Slider
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbColor: Color(0xFFFEB388),
            activeTrackColor: Color(0xFF3E3E3E),
            inactiveTrackColor: Color(0xFF3E3E3E),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
          ),
          child: Slider(
            value: slider_value,
            min: 80,
            max: 120,
            onChanged: (double valor) {
              setState(() {
                slider_value = valor;
              });
            },
          ),
        ),

        // Botao para esquerda e Texto FM e Botao para direita
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: move_left,
              child: Icon(
                Icons.keyboard_double_arrow_left,
                color: Color(0xFF3E3E3E),
              ),
            ),
            Text("FM",
                style:
                    GoogleFonts.lato(fontSize: 32, color: Color(0xFFFEB388))),
            TextButton(
              onPressed: move_right,
              child: Icon(
                Icons.keyboard_double_arrow_right,
                color: Color(0xFF3E3E3E),
              ),
            ),
          ],
        )
      ],
    );
  }
}
