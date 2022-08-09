import 'package:entertainment_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:entertainment_app/core/usecase/base_usecase.dart';
import 'package:entertainment_app/movies_module/domain/entities/recommendation.dart';
import 'package:entertainment_app/movies_module/domain/repository/base_movies_repository.dart';
import 'package:equatable/equatable.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository _baseMoviesRepository;

  GetRecommendationUseCase(this._baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await _baseMoviesRepository.getRecommendations(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object?> get props => [id];
}
