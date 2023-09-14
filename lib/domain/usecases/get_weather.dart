import '../../utils/links.dart';

class GetWeather implements UseCase<String, NoParams> {
  final GetWeatherRepo repo;

  GetWeather(this.repo);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repo.getInstructions();
  }
}
