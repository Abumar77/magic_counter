import 'package:magic_counter/utils/geolocator.dart';

import '../../utils/const.dart';
import '../../utils/links.dart';

abstract class WeatherRemoteDataSource {
  Future<String> getInstructions();
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  @override
  Future<String> getInstructions() async {
    var formData = {"key": WeatherKey};

    final currentPosition = await determinePosition();
    final response = await HttpClientProvider.getInstance.client.get(
      '$weatherApi/current?lat=${currentPosition.latitude}&lon=${currentPosition.longitude}',
      queryParameters: formData,
    );

    try {
      if ((response.statusCode == 200 || response.statusCode == 201)) {
        final WeatherModel data = WeatherModel.fromJson(response.data);
        double fahrenheit = (data.data![0].temp! * 9 / 5) + 32;
        String result =
            "Weather for ${data.data?[0].cityName},${data.data?[0].countryCode}, Current Weather: ${data.data![0].temp}°C ($fahrenheit°F)";
        return result;
      }
      throw ServerFailure(
        response.statusMessage ?? 'no message',
      );
    } catch (e) {
      print(e);
      throw ServerFailure(
        e.toString(),
      );
    }
  }
}
