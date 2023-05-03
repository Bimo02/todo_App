import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';
import '../providers/themeProvider.dart';
class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var providerTH=Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                providerTH.swapthemes();
              },
              child: providerTH.apptheme == ThemeMode.light
                  ? getSelectedItemwidget(
                  context, AppLocalizations.of(context)!.light)
                  : getUnSelectedItemwidget(
                  context, AppLocalizations.of(context)!.light),
            ),
          ),
          Divider(
            thickness: 2,
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:InkWell(
              onTap: () {
                providerTH.swapthemes();
              },
              child: providerTH.apptheme == ThemeMode.dark
                  ? getSelectedItemwidget(
                  context, AppLocalizations.of(context)!.dark)
                  : getUnSelectedItemwidget(
                  context, AppLocalizations.of(context)!.dark),
            ),
          ),
          Divider(
            thickness: 2,
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:InkWell(
              onTap: () {
                providerTH.swapthemes();
              },
              child: providerTH.apptheme == ThemeMode.system
                  ? getSelectedItemwidget(
                  context, AppLocalizations.of(context)!.system)
                  : getUnSelectedItemwidget(
                  context, AppLocalizations.of(context)!.system),
            ),
          ),
        ],
      ),
    );
  }
  Widget getSelectedItemwidget(context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline2,
        ),
        Icon(
          Icons.check_box_rounded,
          color: Theme.of(context).primaryColorLight,
        )
      ],
    );
  }

  Widget getUnSelectedItemwidget(context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline2,
        ),
        Icon(
          Icons.check_box_rounded,
          color: Colors.transparent,
        )
      ],
    );
  }
}
