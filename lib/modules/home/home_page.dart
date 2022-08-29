import 'package:flutter/material.dart';
import 'package:radio_byte/shared/themes/app_image.dart';
import 'package:radio_byte/shared/widgets/header.dart';
import '../../shared/themes/app_colors.dart';
import 'package:radio_byte/shared/themes/app_text_style.dart';
import '../../shared/widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nameImage = AppImages.noSignal;
  String nameChannel = 'Sem sinal';
  double sliderValue = 90.2;
  @override
  Widget build(BuildContext context) {
    void changeImage() {
      switch (sliderValue.toStringAsFixed(1)) {
        case '96.9':
          nameImage = AppImages.band;
          nameChannel = "Band news FM";
          break;
        case '90.5':
          nameImage = AppImages.cbn;
          nameChannel = "Rádio CBN";
          break;
        case '100.9':
          nameImage = AppImages.jovemPan;
          nameChannel = "Rádio Jovem Pan";
          break;

        default:
          nameChannel = "Sem sinal";
          nameImage = AppImages.noSignal;
      }
    }

    void moveSlider(double value) {
      setState(() {
        sliderValue += value;
        changeImage();
      });
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.fundo), fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              const Header(),
              // Imagem
              Container(
                padding: const EdgeInsets.all(22),
                width: size.width * 0.72,
                height: size.width * 0.72,
                constraints:
                    const BoxConstraints(maxWidth: 800, maxHeight: 400),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.ciano,
                ),
                child: Center(child: Image.asset(nameImage)),
              ),

              // Slider
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  children: [
                    // Nome e numero
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                          '${sliderValue.toStringAsFixed(1)} $nameChannel',
                          style: AppTextStyle.sliderValue),
                    ),
                    // Numero, nome e Slider e botoes para mudar de faixa
                    // Slider
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: AppColors.bege,
                        activeTrackColor: AppColors.black,
                        inactiveTrackColor: AppColors.black,
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 0),
                      ),
                      child: Slider(
                        value: sliderValue,
                        min: 90,
                        max: 101,
                        onChanged: (double value) {
                          setState(() {
                            sliderValue = value;
                            changeImage();
                          });
                        },
                      ),
                    ),

                    // Botao para esquerda e Texto FM e Botao para direita
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            moveSlider(-0.1);
                          },
                          child: const Icon(
                            Icons.keyboard_double_arrow_left,
                            color: AppColors.black,
                          ),
                        ),
                        Text("FM", style: AppTextStyle.fm),
                        TextButton(
                          onPressed: () {
                            moveSlider(0.1);
                          },
                          child: const Icon(
                            Icons.keyboard_double_arrow_right,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
