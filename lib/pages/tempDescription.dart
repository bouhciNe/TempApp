import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class tempDescription extends StatelessWidget {
  var temp, temp_min, temp_max, pressure, humidity,country,temperature,iconCode,descreption,cityname;

  tempDescription(
      {Key? key,
      this.temp,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity,
      this.country,
      this.temperature,
      this.iconCode,
      this.descreption,
      this.cityname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Température Description'),
      ),
      body: Container(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      "https://countryflagsapi.com/png/$country",
                      height: 50,
                      width: 50,),
                  Text(
                    "   $cityname",
                    style: GoogleFonts.questrial(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Image(
                  image: NetworkImage(
                      "http://openweathermap.org/img/wn/$iconCode@2x.png")),
              Text(
                "$temperature˚C",
                style: GoogleFonts.questrial(
                  color: temperature <= 0
                      ? Colors.blue
                      : temperature > 0 && temperature <= 15
                          ? Colors.indigo
                          : temperature > 15 && temperature < 30
                              ? Colors.pink
                              : Colors.red,
                  fontSize: 40,
                ),
              ),
              Text(
                "$descreption",
                style: GoogleFonts.questrial(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,//Center Column contents vertically,
                children: [
                  Text(
                    "min:         $temp_min˚C",
                    style: GoogleFonts.questrial(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "max:       $temp_max˚C",
                    style: GoogleFonts.questrial(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  Text(
                    "pressure: $pressure",
                    style: GoogleFonts.questrial(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  Text(
                    "humidity:      $humidity",
                    style: GoogleFonts.questrial(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
