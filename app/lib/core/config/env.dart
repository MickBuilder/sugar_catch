import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'MIXPANEL_PROJECT_TOKEN')
  static const String mixpanelProjectToken = _Env.mixpanelProjectToken;
  
  @EnviedField(varName: 'ENVIRONMENT')
  static const String environment = _Env.environment;
}
