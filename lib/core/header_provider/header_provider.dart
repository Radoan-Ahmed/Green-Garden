
import 'package:food_recipe/features/common/data/data_source/local/token_sorce.dart';

abstract class HeaderProvider {
  Map<String, String> call();
}

class HeaderProviderImpl implements HeaderProvider {
  @override
  Map<String, String> call() {
    return {
      "Content-Type": "application/json",
      // "X-RapidAPI-Key": "1a2bd7d529msh513ba3b70195a79p1acf77jsned01ab52cffa",
    };
  }
}


class AuthHeaderProvider extends HeaderProviderImpl {
  final TokenSource _tokenSource;

  AuthHeaderProvider(this._tokenSource);
  @override
  Map<String, String> call() {
    return Map.from(super.call())
      ..putIfAbsent(
          "Authorization", () => "Bearer ${_tokenSource.getToken()}");
  }
}


