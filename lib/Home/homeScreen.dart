import 'package:flutter/material.dart';
import 'package:islamiapp/Home/TasksTab/add_task_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../Setteings/settingsTab.dart';
import '../providers/app_config_provider.dart';
import '../providers/themeProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'TasksTab/taskstab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0 ;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var providerTH=Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title, style: Theme.of(context).textTheme.headline1),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomAppBar(
          notchMargin:8,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            currentIndex: selectedindex,
            onTap: (index){
              selectedindex=index;
              setState(() {
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/Icon awesome-list.png")),
                  label: AppLocalizations.of(context)!.tasks,),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/Icon feather-settings.png")),
                  label: AppLocalizations.of(context)!.settings),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color(0xFF5D9CEC) ,
        onPressed: (){
          showaddbottomSheet();
        },
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedindex],
    );
  }
  List<Widget> tabs =[TasksTab(),SettingsTab()];

  void showaddbottomSheet() {
    showModalBottomSheet(context: context, builder: (context) {
        return AddTaskBottomSheet();
    });
  }
}
