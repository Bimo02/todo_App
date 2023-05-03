import 'package:flutter/material.dart';
import 'package:islamiapp/Setteings/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';
import '../providers/themeProvider.dart';
import 'Theme_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var providerTH = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Container(
          color: Theme.of(context).hoverColor,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).unselectedWidgetColor,
                    border: Border.all(color: Theme.of(context).hoverColor)),
                child: InkWell(
                  onTap: () {
                    showBottom_Sheet(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          provider.appLanguage == 'en'
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                          style: Theme.of(context).textTheme.labelMedium),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Theme.of(context).hoverColor,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  AppLocalizations.of(context)!.theme,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).unselectedWidgetColor,
                    border: Border.all(color: Theme.of(context).hoverColor)),
                child: InkWell(
                  onTap: () {
                    showBottom_Sheet_Th(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Thememodename(providerTH.apptheme, context),
                          style: Theme.of(context).textTheme.labelMedium),
                      Icon(Icons.arrow_drop_down_rounded,
                          color: Theme.of(context).hoverColor)
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void showBottom_Sheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        },
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))));
  }

  void showBottom_Sheet_Th(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }

  String Thememodename(ThemeMode theme, context) {
    if (theme == ThemeMode.light) {
      return AppLocalizations.of(context)!.light;
    } else if (theme == ThemeMode.dark) {
      return AppLocalizations.of(context)!.dark;
    }
    return AppLocalizations.of(context)!.system;
  }
}
