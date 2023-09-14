import '../../utils/links.dart';
import '../datasources/weather_remote_data_source.dart';

class WeatherRepoImpl implements GetWeatherRepo {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> getInstructions() async {
    try {
      final data = await remoteDataSource.getInstructions();
      return Right(data);
    } on ServerFailure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
