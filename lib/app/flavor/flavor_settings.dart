import 'package:flutter_clean_architecture/app/flavor/flavor.dart';
import 'package:models/settings/api_settings.dart';
import 'package:presentation/design/named_colors.dart';
import 'package:presentation/design/style.dart';

import 'settings.dart';

final Map<Flavor, Settings> flavorSettings = {
  Flavor.company1: _company1Settings,
  Flavor.company2: _company2Settings,
};

final _company1Settings = Settings(
  apiSettings: _developmentApiSettings,
  buildStyle: _buildCompany1Style,
);

final _company2Settings = Settings(
  apiSettings: _developmentApiSettings,
  buildStyle: _buildCompany2Style,
);

const _developmentApiSettings =
    ApiSettings(baseUrl: "http://accfdv.accesys.com.br/");

FlavorStyle _buildCompany1Style() =>
    FlavorStyle(appBarColor: NamedColors.damagedTan);

FlavorStyle _buildCompany2Style() =>
    FlavorStyle(appBarColor: NamedColors.postWorldWalnut);
