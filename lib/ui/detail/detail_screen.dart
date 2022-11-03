import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedx/const/poke_type_color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:pokedx/ui/detail/detail_controller.dart';
import 'package:pokedx/helper/extension_method.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(),
        builder: (controller) {
          int? pokeid = controller.pokemonDetail?.id;
          print("pokeid: ${pokeid}");

          return Scaffold(
            backgroundColor: fire,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: fire,
              foregroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              title:
              Text(controller.pokemonDetail?.name?.capitalizeFirst ?? '-'),
              actions: [
                Container(
                    padding: const EdgeInsets.only(right: 13),
                    alignment: Alignment.center,
                    child: Text('#${controller.formatter.format(pokeid ?? 0)}'))
              ],
            ),
            body: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: SvgPicture.asset(
                    "assets/ic_pokeball.svg",
                    height: 250,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                Positioned(
                    bottom: 25,
                    right: 0,
                    left: 0,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(15),
                      width: Get.width,
                      // height: 380,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: controller.types.map((e) =>
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                            color: fire,
                                            borderRadius: BorderRadius.circular(
                                                5)),
                                        child: Text(e.type?.name ?? '')
                                    )).toList(),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Container(
                              //       margin: const EdgeInsets.symmetric(horizontal: 5),
                              //       padding: const EdgeInsets.symmetric(
                              //           horizontal: 10, vertical: 2),
                              //       decoration: BoxDecoration(
                              //           color: fire,
                              //           borderRadius: BorderRadius.circular(5)),
                              //       child: Text(controller.pokemonDetail?.name?.capitalizeFirst ?? '-',
                              //         style: TextStyle(
                              //             color: Colors.white,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //     ),
                              //     Container(
                              //       margin: const EdgeInsets.symmetric(horizontal: 5),
                              //       padding: const EdgeInsets.symmetric(
                              //           horizontal: 10, vertical: 2),
                              //       decoration: BoxDecoration(
                              //           color: flying,
                              //           borderRadius: BorderRadius.circular(5)),
                              //       child: Text(
                              //         "Flying",
                              //         style: TextStyle(
                              //             color: Colors.white,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //     )
                              //   ],
                              // ),
                              Container(
                                  margin: const EdgeInsets.all(15),
                                  child: Text(
                                    "About",
                                    style: TextStyle(
                                        color: fire,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          style:
                                          TextStyle(color: Colors.black87),
                                          children: [
                                            WidgetSpan(
                                                child: SvgPicture.asset(
                                                  "assets/ic_weight.svg",
                                                  color: Colors.black87,
                                                )),
                                            TextSpan(text: ' 90,5 Kg'),
                                            TextSpan(text: '\n\nWeight')
                                          ])),
                                  VerticalDivider(
                                    width: 20,
                                    thickness: 1,
                                    indent: 20,
                                    endIndent: 0,
                                    color: Colors.black87,
                                  ),
                                  RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          style:
                                          TextStyle(color: Colors.black87),
                                          children: [
                                            WidgetSpan(
                                                child: SvgPicture.asset(
                                                  "assets/ic_height.svg",
                                                  color: Colors.black87,
                                                )),
                                            TextSpan(text: ' 1,7 m'),
                                            TextSpan(text: '\n\nHeight')
                                          ])),
                                ],
                              ),
                              RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 10),
                                      children: [
                                        TextSpan(
                                            text:
                                            "\nSpits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally."),
                                        TextSpan(
                                            text:
                                            " When expelling a blast of super hot fire, the red flame at the tip of its tail burns more intensely."),
                                        TextSpan(
                                            text:
                                            " If CHARIZARD be­ comes furious, the flame at the tip of its tail flares up in a whitish- blue color.")
                                      ])),
                              Container(
                                  margin: const EdgeInsets.all(15),
                                  child: Text(
                                    "Base Stats",
                                    style: TextStyle(
                                        color: fire,
                                        fontWeight: FontWeight.bold),
                                  )),
                              RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'ATK',
                                            style: TextStyle(
                                                color: fire,
                                                fontWeight: FontWeight.bold)),
                                        WidgetSpan(child: VerticalDivider()),
                                        TextSpan(text: "084 "),
                                        WidgetSpan(child: VerticalDivider()),
                                        WidgetSpan(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 5,
                                            ),
                                            width: 201,
                                            child: LinearProgressBar(
                                              maxSteps: 255,
                                              progressType: LinearProgressBar
                                                  .progressTypeLinear,
                                              // Use Linear progress
                                              currentStep: 84,
                                              progressColor: fire,
                                              backgroundColor: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ])),
                              RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'DEF',
                                            style: TextStyle(
                                                color: fire,
                                                fontWeight: FontWeight.bold)),
                                        WidgetSpan(child: VerticalDivider()),
                                        TextSpan(text: "078 "),
                                        WidgetSpan(child: VerticalDivider()),
                                        WidgetSpan(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 5,
                                            ),
                                            width: 201,
                                            child: LinearProgressBar(
                                              maxSteps: 255,
                                              progressType: LinearProgressBar
                                                  .progressTypeLinear,
                                              // Use Linear progress
                                              currentStep: 78,
                                              progressColor: fire,
                                              backgroundColor: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ])),
                              RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: 'HP',
                                            style: TextStyle(
                                                color: fire,
                                                fontWeight: FontWeight.bold)),
                                        WidgetSpan(child: VerticalDivider()),
                                        TextSpan(text: "078 "),
                                        WidgetSpan(child: VerticalDivider()),
                                        WidgetSpan(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 5,
                                            ),
                                            width: 201,
                                            child: LinearProgressBar(
                                              maxSteps: 255,
                                              progressType: LinearProgressBar
                                                  .progressTypeLinear,
                                              // Use Linear progress
                                              currentStep: 78,
                                              progressColor: fire,
                                              backgroundColor: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ])),
                            ],
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: CachedNetworkImage(
                    imageUrl:
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${pokeid}.png",
                    // "${item
                    // ?.url
                    // ?.split("pokemon")
                    // .last
                    // .replaceAll("/", "")}.png",
                    placeholder: (context, url) =>
                        Lottie.asset("assets/pokeball_lottie.json"),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                    height: 190,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
