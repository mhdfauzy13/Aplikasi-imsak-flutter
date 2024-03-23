// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_imsak/detail_waktu.dart';
import 'package:flutter_imsak/models/jadwal_sholat_models/jadwal_sholat_models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  void changeBackgroundImage() {
    final DateTime datetimeNow = DateTime.now();
    debugPrint(datetimeNow.toString());
    if (datetimeNow.hour > 10) {
      setState(() {
        backgroundImgHeader = 'assets/bg_header_night.png';
      });
    } else {
      backgroundImgHeader = 'assets/bg_header_night.png';
    }
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      changeBackgroundImage();
    });
    Future.microtask(() => getJadwalSholatModels());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(backgroundImgHeader),
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Waktu Imsak Hari Ini',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        isLoading
                            ? CircularProgressIndicator.adaptive()
                            : Text(
                                jadwalSholatModels?.data?.timings?.imsak ?? '',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.white),
                                Text(
                                  'Indramayu',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(children: [
                              Icon(Icons.date_range,
                                  color: Colors.white, size: 30),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        jadwalSholatModels
                                                ?.data?.date?.readable ??
                                            '',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white)),
                                    Text(
                                        jadwalSholatModels
                                                ?.data?.date?.hijri?.date ??
                                            '',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white)),
                                  ])
                            ])
                          ],
                        )
                      ]),
                )
              ],
            ),
            SizedBox(height: 5),
            Container(
              width: getWidth - 10,
              height: 70,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 235, 235),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.1,
                      blurRadius: 0.5,
                      offset: Offset(1, 2),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Subuh',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          jadwalSholatModels?.data?.timings?.fajr ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dzuhur'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          jadwalSholatModels?.data?.timings?.dhuhr ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Asyar'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          jadwalSholatModels?.data?.timings?.asr ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Maghrib'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          jadwalSholatModels?.data?.timings?.maghrib ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Isya'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          jadwalSholatModels?.data?.timings?.isha ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ]),
                ],
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 13,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailWaktuPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    width: getWidth - 20,
                    height: 70,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 235, 235, 235),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.1,
                          blurRadius: 0.5,
                          offset: Offset(1, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            jadwalSholatModels?.data?.date?.hijri?.month?.en ??
                                '',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 5),
                        Text('DateNow',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            )),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
