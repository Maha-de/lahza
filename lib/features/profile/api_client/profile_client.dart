import 'package:dio/dio.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/profile/models/profile_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
part 'profile_client.g.dart';

@injectable
@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class ProfileClient {
  @factoryMethod
  factory ProfileClient(Dio dio) = _ProfileClient;

  @GET(AppEndPoints.getProfile)
  Future<ProfileModel> getProfile();
  @PUT(AppEndPoints.updateImageProfile)
  @MultiPart()
  Future<ProfileModel> updateImageProfile({
    @Part(name: "avatar") required MultipartFile avatar,
  });

  @PUT(AppEndPoints.getProfile)
  Future<ProfileModel> editProfile(
    // @Path("id") String id,
    @Body() Map<String, dynamic> body,
  );
}
