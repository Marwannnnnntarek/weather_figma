import 'dart:convert';
import 'dart:async'; // For timeout
import 'package:http/http.dart' as http;
import 'package:myapp/features/home/data/models/weather/weather_model.dart';

class WeatherApiService {
  final String _baseUrl = 'http://api.weatherapi.com/v1';
  final String _apiKey = 'b04dd1e3b4cb4bca9fa191423241511';

  Future<WeatherModel> fetchWeather(String city) async {
    try {
      final response = await http
          .get(Uri.parse(
              '$_baseUrl/forecast.json?key=$_apiKey&q=$city&days=7&aqi=no&alerts=no'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherModel(
          location: _parseLocation(data['location']),
          current: _parseCurrent(data['current']),
          forecast: _parseForecast(data['forecast']),
        );
      } else {
        throw Exception('Failed to fetch weather data: ${response.statusCode} ${response.body}');
      }
    } on TimeoutException {
      throw Exception('Request to weather API timed out');
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Location _parseLocation(dynamic json) {
    return Location(
      name: json['name']?.toString() ?? '',
      region: json['region']?.toString() ?? '',
      country: json['country']?.toString() ?? '',
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      tzId: json['tz_id']?.toString() ?? '',
      localtimeEpoch: json['localtime_epoch'] as int? ?? 0,
      localtime: json['localtime']?.toString() ?? '',
    );
  }

  Current _parseCurrent(dynamic json) {
    return Current(
      lastUpdated: json['last_updated']?.toString() ?? '',
      lastUpdatedEpoch: json['last_updated_epoch'] as int? ?? 0,
      tempC: (json['temp_c'] as num?)?.toDouble() ?? 0.0,
      tempF: (json['temp_f'] as num?)?.toDouble() ?? 0.0,
      isDay: json['is_day'] as int? ?? 1,
      // condition: Condition(
      //   text: _parseText(json['condition']['text']),
      //   icon: 'https:${json['condition']['icon']}',
      //   code: json['condition']['code'] as int? ?? 0,
      // ),
      condition: Condition(
  text: json['condition']['text'] ?? '',
  icon: 'https:${json['condition']['icon'] ?? ''}',
  code: json['condition']['code'] ?? 0,
),

      windMph: (json['wind_mph'] as num?)?.toDouble() ?? 0.0,
      windKph: (json['wind_kph'] as num?)?.toDouble() ?? 0.0,
      windDegree: json['wind_degree'] as int? ?? 0,
      windDir: _parseWindDir(json['wind_dir']),
      pressureMb: (json['pressure_mb'] as num?)?.toDouble() ?? 0.0,
      pressureIn: (json['pressure_in'] as num?)?.toDouble() ?? 0.0,
      precipMm: (json['precip_mm'] as num?)?.toDouble() ?? 0.0,
      precipIn: (json['precip_in'] as num?)?.toDouble() ?? 0.0,
      humidity: json['humidity'] as int? ?? 0,
      cloud: json['cloud'] as int? ?? 0,
      feelslikeC: (json['feelslike_c'] as num?)?.toDouble() ?? 0.0,
      feelslikeF: (json['feelslike_f'] as num?)?.toDouble() ?? 0.0,
      windchillC: (json['windchill_c'] as num?)?.toDouble() ?? 0.0,
      windchillF: (json['windchill_f'] as num?)?.toDouble() ?? 0.0,
      heatindexC: (json['heatindex_c'] as num?)?.toDouble() ?? 0.0,
      heatindexF: (json['heatindex_f'] as num?)?.toDouble() ?? 0.0,
      dewpointC: (json['dewpoint_c'] as num?)?.toDouble() ?? 0.0,
      dewpointF: (json['dewpoint_f'] as num?)?.toDouble() ?? 0.0,
      visKm: (json['vis_km'] as num?)?.toDouble() ?? 0.0,
      visMiles: (json['vis_miles'] as num?)?.toDouble() ?? 0.0,
      uv: (json['uv'] as num?)?.toDouble() ?? 0.0,
      gustMph: (json['gust_mph'] as num?)?.toDouble() ?? 0.0,
      gustKph: (json['gust_kph'] as num?)?.toDouble() ?? 0.0,
      time: json['last_updated']?.toString() ?? '',
    );
  }

  Forecast _parseForecast(dynamic json) {
    final forecastDays = (json['forecastday'] as List).map((day) {
      return Forecastday(
        date: DateTime.parse(day['date']),
        dateEpoch: day['date_epoch'] as int? ?? 0,
        day: Day(
          maxtempC: (day['day']['maxtemp_c'] as num?)?.toDouble() ?? 0.0,
          maxtempF: (day['day']['maxtemp_f'] as num?)?.toDouble() ?? 0.0,
          mintempC: (day['day']['mintemp_c'] as num?)?.toDouble() ?? 0.0,
          mintempF: (day['day']['mintemp_f'] as num?)?.toDouble() ?? 0.0,
          avgtempC: (day['day']['avgtemp_c'] as num?)?.toDouble() ?? 0.0,
          avgtempF: (day['day']['avgtemp_f'] as num?)?.toDouble() ?? 0.0,
          maxwindMph: (day['day']['maxwind_mph'] as num?)?.toDouble() ?? 0.0,
          maxwindKph: (day['day']['maxwind_kph'] as num?)?.toDouble() ?? 0.0,
          totalprecipMm: (day['day']['totalprecip_mm'] as num?)?.toDouble() ?? 0.0,
          totalprecipIn: (day['day']['totalprecip_in'] as num?)?.toDouble() ?? 0.0,
          totalsnowCm: (day['day']['totalsnow_cm'] as num?)?.toDouble() ?? 0.0,
          avgvisKm: (day['day']['avgvis_km'] as num?)?.toDouble() ?? 0.0,
          avgvisMiles: (day['day']['avgvis_miles'] as num?)?.toDouble() ?? 0.0,
          avghumidity: day['day']['avghumidity'] as int? ?? 0,
          dailyWillItRain: day['day']['daily_will_it_rain'] as int? ?? 0,
          dailyChanceOfRain: day['day']['daily_chance_of_rain'] as int? ?? 0,
          dailyWillItSnow: day['day']['daily_will_it_snow'] as int? ?? 0,
          dailyChanceOfSnow: day['day']['daily_chance_of_snow'] as int? ?? 0,
          // condition: Condition(
          //   text: _parseText(day['day']['condition']['text']),
          //   icon: 'https:${day['day']['condition']['icon']}',
          //   code: day['day']['condition']['code'] as int? ?? 0,
          // ),
          condition: Condition(
  text: day['day']['condition']['text'] ?? '',
  icon: 'https:${day['day']['condition']['icon'] ?? ''}',
  code: day['day']['condition']['code'] ?? 0,
),

          uv: (day['day']['uv'] as num?)?.toDouble() ?? 0.0,
        ),
        astro: Astro(
          sunrise: day['astro']['sunrise']?.toString() ?? '',
          sunset: day['astro']['sunset']?.toString() ?? '',
          moonrise: day['astro']['moonrise']?.toString() ?? '',
          moonset: day['astro']['moonset']?.toString() ?? '',
          moonPhase: day['astro']['moon_phase']?.toString() ?? '',
          moonIllumination: int.tryParse(day['astro']['moon_illumination']?.toString() ?? '0') ?? 0,
          isMoonUp: day['astro']['is_moon_up'] as int? ?? 0,
          isSunUp: day['astro']['is_sun_up'] as int? ?? 0,
        ),
        hour: (day['hour'] as List).map((h) => _parseCurrent(h)).toList(),
      );
    }).toList();

    return Forecast(forecastday: forecastDays);
  }
  WindDir _parseWindDir(String? value) {
    if (value == null) return WindDir.e;
    return WindDir.values.firstWhere(
      (e) => e.name.toUpperCase() == value.toUpperCase(),
      orElse: () => WindDir.e,
    );
  }
}
