import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/app_page_route_provider.dart';



// extension AppLocalizationsApp on BuildContext{
//   AppLocalizations get localizations => AppLocalizations.of(this)!;
// }



extension AppConfigProviderApp on BuildContext {
  AppConfigProvider get appConfigProvider =>
      Provider.of<AppConfigProvider>(this, listen: false);
}