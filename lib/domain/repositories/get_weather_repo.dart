import '../../utils/links.dart';

abstract class GetWeatherRepo {
  Future<Either<Failure, String>> getInstructions();
}
