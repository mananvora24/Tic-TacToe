import 'package:cut_my_carbon/viewmodels/home_viewmodel.dart';
import 'package:cut_my_carbon/core/services/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'viewmodels/home_viewmodel.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  _setupViewModels();
  _setupServices();
}


  Future _setupViewModels() async {
    locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
}
Future _setupServices() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationServiceImpl());
}