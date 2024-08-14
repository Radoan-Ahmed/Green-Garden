import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/core/network/connection_checker.dart';
import 'package:food_recipe/features/profile_page/data/model/get_user_info_response_model.dart';
import 'package:food_recipe/features/profile_page/data/remote/get_user_info_remote.dart';
import 'package:food_recipe/features/profile_page/data/repository_impl/get_user_info_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUserInfoRemote extends Mock implements GetUserInfoRemote {}

class MockConnectionChecker extends Mock implements ConnectionChecker {}

void main() {
  late GetUserInfoRepositoryImpl sut;
  late MockGetUserInfoRemote mockGetUserInfoRemote;
  late MockConnectionChecker mockConnectionChecker;
  late GetUserInfoResponseModel getUserInfoResponseModel;


  setUp(() {
    mockGetUserInfoRemote = MockGetUserInfoRemote();
    mockConnectionChecker = MockConnectionChecker();
    sut = GetUserInfoRepositoryImpl(mockConnectionChecker, mockGetUserInfoRemote);
    getUserInfoResponseModel = GetUserInfoResponseModel(
      data: Data(
        id: "12",
        email: "r@gmail.com",
        role: "user",
        phone: "01766364737",
      )
    );
    
  });

  test(
    "method call",
    () async{
      when(() => mockConnectionChecker.isConnected()).thenAnswer((_) => Future.value(true));
      when(() => mockGetUserInfoRemote.getUserInfo()).thenAnswer((_) => Future.value(getUserInfoResponseModel));
      await sut.getUserInfo();
      verify(()=>mockGetUserInfoRemote.getUserInfo()).called(1);
    },
  );

  test(
    "get api response",
    () async{
      when(() => mockConnectionChecker.isConnected()).thenAnswer((_) => Future.value(true));
      when(() => mockGetUserInfoRemote.getUserInfo()).thenAnswer((_) => Future.value(getUserInfoResponseModel));
      final response =  await sut.getUserInfo();
      expect(response, getUserInfoResponseModel);
      
    },
  );
  
}
