// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_imsak/models/jadwal_sholat_models/jadwal_sholat_models.dart';

class DetailWaktuPage extends StatefulWidget {
  const DetailWaktuPage({super.key});

  @override
  State<DetailWaktuPage> createState() => _DetailWaktuPageState();
}

class _DetailWaktuPageState extends State<DetailWaktuPage> {
  double getWidth = 0;
  String backgroundImgHeader = 'assets/bg_header_night.png';
  Dio dio = Dio();
  JadwalSholatModels? jadwalSholatModels;
  bool isLoading = true;

  Future<void> getJadwalSholatModels() async {
    await dio.get(
      'http://api.aladhan.com/v1/timingsByCity?',
      queryParameters: {
        'city': 'Indramayu',
        'country': 'Id',
        'method': 5,
      },
    ).then((value) {
      if (value.statusCode == 200) {
        setState(() {
          isLoading = false;
          jadwalSholatModels = JadwalSholatModels.fromJson(value.data);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(backgroundImgHeader),

                // Positioned(
                //   top: 80,
                //   left: 0,
                //   right: 0,
                // ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: 200,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 216, 208, 208),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
