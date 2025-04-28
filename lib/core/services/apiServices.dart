import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:myapp/features/home/data/models/weather/weather_model.dart';

class WeatherApiService {
//http://api.weatherapi.com/v1/forecast.json?key=b04dd1e3b4cb4bca9fa191423241511&q=london&days=7&aqi=no&alerts=no
  final String _baseUrl = 'http://api.weatherapi.com/v1';
  final String _apiKey = 'b04dd1e3b4cb4bca9fa191423241511';

  Future<WeatherModel> fetchWeather(String city) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl/forecast.json?key=$_apiKey&q=$city&days=7&aqi=no&alerts=no'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WeatherModel(
        location: Location(
          name: data['location']['name'].toString(),
          region: data['location']['region'].toString(),
          country: data['location']['country'].toString(),
          lat: data['location']['lat']?.toDouble() ?? 0.0,
          lon: data['location']['lon']?.toDouble() ?? 0.0,
          tzId: data['location']['tz_id'].toString(),
          localtimeEpoch: data['location']['localtime_epoch'] as int,
          localtime: data['location']['localtime'].toString(),
        ),
        current: parseCurrent(data['current']),
        forecast: parseForecast(data['forecast']),
      );
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  Current parseCurrent(dynamic json) {
    return Current(
      lastUpdated: json['last_updated']?.toString(),
      lastUpdatedEpoch: json['last_updated_epoch'] as int?,
      tempC: json['temp_c']?.toDouble() ?? 0.0,
      tempF: json['temp_f']?.toDouble() ?? 0.0,
      isDay: json['is_day'] as int,
     
      condition: 
      Condition(
        text: Text.values.firstWhere(
          (e) => e.name == json['condition']['text'].toUpperCase().replaceAll(' ', '_'),
          orElse: () => Text.TEXT_CLEAR,
        ),
         icon: 'https:${json['condition']['icon']}',
        code: json['condition']['code'] as int,
      ),
      windMph: json['wind_mph']?.toDouble() ?? 0.0,
      windKph: json['wind_kph']?.toDouble() ?? 0.0,
      windDegree: json['wind_degree'] as int,
      windDir: WindDir.values.firstWhere(
        (e) => e.name == json['wind_dir'],
        orElse: () => WindDir.e,
      ),
      pressureMb: json['pressure_mb']?.toDouble() ?? 0.0,
      pressureIn: json['pressure_in']?.toDouble() ?? 0.0,
      precipMm: json['precip_mm']?.toDouble() ?? 0.0,
      precipIn: json['precip_in']?.toDouble() ?? 0.0,
      humidity: json['humidity'] as int,
      cloud: json['cloud'] as int,
      feelslikeC: json['feelslike_c']?.toDouble() ?? 0.0,
      feelslikeF: json['feelslike_f']?.toDouble() ?? 0.0,
      windchillC: json['windchill_c']?.toDouble() ?? 0.0,
      windchillF: json['windchill_f']?.toDouble() ?? 0.0,
      heatindexC: json['heatindex_c']?.toDouble() ?? 0.0,
      heatindexF: json['heatindex_f']?.toDouble() ?? 0.0,
      dewpointC: json['dewpoint_c']?.toDouble() ?? 0.0,
      dewpointF: json['dewpoint_f']?.toDouble() ?? 0.0,
      visKm: json['vis_km']?.toDouble() ?? 0.0,
      visMiles: json['vis_miles']?.toDouble() ?? 0.0,
      uv: json['uv']?.toDouble() ?? 0.0,
      gustMph: json['gust_mph']?.toDouble() ?? 0.0,
      gustKph: json['gust_kph']?.toDouble() ?? 0.0,
      time: json['last_updated']?.toString(),
    );
  }

  Forecast parseForecast(dynamic json) {
    List<Forecastday> days = (json['forecastday'] as List).map((day) {
      return Forecastday(
        date: DateTime.parse(day['date']),
        dateEpoch: day['date_epoch'] as int,
        day: Day(
          maxtempC: day['day']['maxtemp_c']?.toDouble() ?? 0.0,
          maxtempF: day['day']['maxtemp_f']?.toDouble() ?? 0.0,
          mintempC: day['day']['mintemp_c']?.toDouble() ?? 0.0,
          mintempF: day['day']['mintemp_f']?.toDouble() ?? 0.0,
          avgtempC: day['day']['avgtemp_c']?.toDouble() ?? 0.0,
          avgtempF: day['day']['avgtemp_f']?.toDouble() ?? 0.0,
          maxwindMph: day['day']['maxwind_mph']?.toDouble() ?? 0.0,
          maxwindKph: day['day']['maxwind_kph']?.toDouble() ?? 0.0,
          totalprecipMm: day['day']['totalprecip_mm']?.toDouble() ?? 0.0,
          totalprecipIn: day['day']['totalprecip_in']?.toDouble() ?? 0.0,
          totalsnowCm: day['day']['totalsnow_cm']?.toDouble() ?? 0.0,
          avgvisKm: day['day']['avgvis_km']?.toDouble() ?? 0.0,
          avgvisMiles: day['day']['avgvis_miles']?.toDouble() ?? 0.0,
          avghumidity: day['day']['avghumidity'] as int,
          dailyWillItRain: day['day']['daily_will_it_rain'] as int,
          dailyChanceOfRain: day['day']['daily_chance_of_rain'] as int,
          dailyWillItSnow: day['day']['daily_will_it_snow'] as int,
          dailyChanceOfSnow: day['day']['daily_chance_of_snow'] as int,
          condition: Condition(
            text: Text.values.firstWhere(
              (e) => e.name == day['day']['condition']['text'].toUpperCase().replaceAll(' ', '_'),
              orElse: () => Text.TEXT_CLEAR,
            ),
            // icon: Icon.values.firstWhere(
            //   (e) => e.name == day['day']['condition']['icon'].toUpperCase().replaceAll('/', '_').replaceAll('.', '_'),
            //   orElse: () => Icon.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_113_PNG,
            // ),
            code: day['day']['condition']['code'] as int, icon: '',
          ),
          uv: day['day']['uv']?.toDouble() ?? 0.0,
        ),
        astro: Astro(
          sunrise: day['astro']['sunrise'].toString(),
          sunset: day['astro']['sunset'].toString(),
          moonrise: day['astro']['moonrise'].toString(),
          moonset: day['astro']['moonset'].toString(),
          moonPhase: day['astro']['moon_phase'].toString(),
          moonIllumination: int.tryParse(day['astro']['moon_illumination'].toString()) ?? 0,
          isMoonUp: day['astro']['is_moon_up'] as int,
          isSunUp: day['astro']['is_sun_up'] as int,
        ),
        hour: (day['hour'] as List)
            .map((h) => parseCurrent(h))
            .toList(),
      );
    }).toList();

    return Forecast(forecastday: days);
  }
}
