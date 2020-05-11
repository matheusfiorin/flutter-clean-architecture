import 'package:common/platform/build_config/build_config.dart';
import 'package:common/platform/network_connectivity/network_connectivity.dart';
import 'package:common_flutter/platform/analytics/analytics.dart';
import 'package:data/data_sources/user_session/user_session_data_source.dart';
import 'package:data/repositories/storage/secure_storage_repo.dart';
import 'package:data/repositories/user_session/user_session_repo.dart';
import 'package:data_sources/api_service/api_service.dart';
import 'package:data_sources/api_service/interceptors/token_interceptor.dart';
import 'package:data_sources/user_session/user_session_data_source.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:platform/analytics/analytics.dart';
import 'package:platform/build_config/build_config.dart';
import 'package:platform/network_connectivity/network_connectivity.dart';
import 'package:platform/secure_storage/secure_storage_repo.dart';
import 'package:presentation/features/home/page/home_view_model.dart';
import 'package:presentation/features/home/tabs/tabs_home_page.dart';
import 'package:presentation/features/profile/profile_view_model.dart';
import 'package:presentation/navigation/main_navigator.dart';
import 'package:presentation/navigation/navigation_stack.dart';
import 'package:repositories/user_session/user_session_repo.dart';

import '../flavor/settings.dart';
import 'sub_modules/home_module.dart';
import 'sub_modules/login_module.dart';
import 'sub_modules/profile_module.dart';
import 'sub_modules/reports_module.dart';

class AppModule {
  AppModule(this._settings) {
    _injector = Injector.getInjector(runtimeType.toString());

    _mapPlatform();
    _mapApiService();
    _mapDataSources();
    _mapRepositories();
    _mapSubModules();
    _mapNavigators();
  }

  final Settings _settings;
  Injector _injector;

  void _mapPlatform() {
    _injector.map<Analytics>(
      (i) => AnalyticsImpl(),
      isSingleton: true,
    );

    _injector.map<BuildConfig>(
      (i) => BuildConfigImpl(),
      isSingleton: true,
    );

    _injector.map<NetworkConnectivity>(
      (i) => NetworkConnectivityImpl(),
      isSingleton: true,
    );
  }

  void _mapApiService() {
    _injector.map<TokenInterceptor>(
      (i) => TokenInterceptor(() => userSessionRepo.currentUserSession().token),
      isSingleton: true,
    );

    _injector.map<ApiService>(
      (i) => createApiService(settings.apiSettings.baseUrl, tokenInterceptor),
      isSingleton: true,
    );
  }

  void _mapDataSources() {
    _injector.map<UserSessionDataSource>(
      (i) => UserSessionDataSourceImpl(apiService),
      isSingleton: true,
    );
  }

  void _mapRepositories() {
    _injector.map<SecureStorageRepo>(
      (i) => SecureStorageRepoImpl(),
      isSingleton: true,
    );

    _injector.map<UserSessionRepo>(
      (i) => UserSessionRepoImpl(
        secureStorageRepo,
        userSessionDataSource,
      ),
      isSingleton: true,
    );
  }

  void _mapSubModules() {
    _injector.map<LoginModule>(
      (i) => LoginModule(this),
      isSingleton: true,
    );

    _injector.map<HomeModule>(
      (i) => HomeModule(this),
      isSingleton: true,
    );

    _injector.map<ReportsModule>(
      (i) => ReportsModule(),
      isSingleton: true,
    );

    _injector.map<ProfileModule>(
      (i) => ProfileModule(this),
      isSingleton: true,
    );
  }

  void _mapNavigators() {
    _injector.map<NavigationStack>(
      (i) => NavigationStack(),
      isSingleton: true,
      key: _mainNavigationStackKey,
    );

    _injector.map<MainNavigator>(
      (i) => MainNavigator(
        mainNavigationStack,
        loginModule.loginPage,
        tabsHomePage,
        homeModule.drawerHomePage,
        reportsModule.reportsPage,
        profileModule.profilePage,
      ),
      isSingleton: true,
    );
  }

  Settings get settings => _settings;

  SecureStorageRepo get secureStorageRepo => _injector.get<SecureStorageRepo>();

  BuildConfig get buildConfig => _injector.get<BuildConfig>();

  NetworkConnectivity get networkConnectivity =>
      _injector.get<NetworkConnectivity>();

  UserSessionDataSource get userSessionDataSource =>
      _injector.get<UserSessionDataSource>();

  UserSessionRepo get userSessionRepo => _injector.get<UserSessionRepo>();

  TokenInterceptor get tokenInterceptor => _injector.get<TokenInterceptor>();

  ApiService get apiService => _injector.get<ApiService>();

  LoginModule get loginModule => _injector.get<LoginModule>();

  HomeModule get homeModule => _injector.get<HomeModule>();

  ReportsModule get reportsModule => _injector.get<ReportsModule>();

  ProfileModule get profileModule => _injector.get<ProfileModule>();

  NavigationStack get mainNavigationStack =>
      _injector.get<NavigationStack>(key: _mainNavigationStackKey);

  MainNavigator get mainNavigator => _injector.get<MainNavigator>();

  TabsHomePage tabsHomePage(
    HomeOutput homeOutput,
    ProfileOutput profileOutput,
  ) =>
      TabsHomePage(
        () => homeModule.homePage(homeOutput),
        () => reportsModule.reportsPage(),
        () => profileModule.profilePage(profileOutput),
      );
}

const _mainNavigationStackKey = "mainNavigationStack";
