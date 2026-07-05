import 'package:dio/dio.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/reviews/models/products_specs_model.dart';
import 'package:lahza/features/reviews/models/review_phone_details_model.dart';
import 'package:lahza/features/reviews/models/review_phones_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
part 'reviews_client.g.dart';

@injectable
@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class ReviewsClient {
  @factoryMethod
  factory ReviewsClient(Dio dio) = _ReviewsClient;

  @GET(AppEndPoints.getAllReviews)
  Future<ReviewPhonesModel> getReviews();

  @GET('${AppEndPoints.getAllReviews}/{id}')
  Future<ReviewPhoneDetailsModel> getProductDetails(@Path("id") String id);

  @GET('${AppEndPoints.getProductSpecs}/{id}')
  Future<ProductsSpecsModel> getProductSpecs(@Path("id") String id);

}
