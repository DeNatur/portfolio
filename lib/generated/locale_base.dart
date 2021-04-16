import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  Map<String, dynamic> _data;
  String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }
  
  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  Localemain _main;
  Localemain get main => _main;
  Localehome _home;
  Localehome get home => _home;
  Localeabout _about;
  Localeabout get about => _about;

  void initAll() {
    _main = Localemain(Map<String, String>.from(_data['main']));
    _home = Localehome(Map<String, String>.from(_data['home']));
    _about = Localeabout(Map<String, String>.from(_data['about']));
  }
}

class Localemain {
  final Map<String, String> _data;
  Localemain(this._data);

  String getByKey(String key) {
    return _data[key];
  }

  String get home => _data["home"];
  String get about => _data["about"];
  String get experience => _data["experience"];
  String get contact => _data["contact"];
}

class Localehome {
  final Map<String, String> _data;
  Localehome(this._data);

  String getByKey(String key) {
    return _data[key];
  }

  String get my_name_is => _data["my_name_is"];
  String get szymon_stasik => _data["szymon_stasik"];
  String get born_in_poland => _data["born_in_poland"];
  String get mobile_applications => _data["mobile_applications"];
  String get to_be_more_than => _data["to_be_more_than"];
  String get coder => _data["coder"];
  String get besides_writing => _data["besides_writing"];
  String get clear_code => _data["clear_code"];
  String get and => _data["and"];
  String get tests => _data["tests"];
  String get i_strive => _data["i_strive"];
  String get beautiful_designs => _data["beautiful_designs"];
  String get animations => _data["animations"];
}

class Localeabout {
  final Map<String, String> _data;
  Localeabout(this._data);

  String getByKey(String key) {
    return _data[key];
  }

  String get about_me => _data["about_me"];
  String get szymon_stasik => _data["szymon_stasik"];
  String get desc_title => _data["desc_title"];
  String get desc => _data["desc"];
  String get my_resume => _data["my_resume"];
  String get about => _data["about"];
  String get technical_skills => _data["technical_skills"];
  String get backend => _data["backend"];
  String get flutter => _data["flutter"];
  String get android => _data["android"];
  String get other => _data["other"];
  String get backend_desc => _data["backend_desc"];
  String get flutter_desc => _data["flutter_desc"];
  String get android_desc => _data["android_desc"];
  String get other_desc => _data["other_desc"];
  String get achivments => _data["achivments"];
  String get intel_isef_2019 => _data["intel_isef_2019"];
  String get in_phoenix => _data["in_phoenix"];
  String get largest_international => _data["largest_international"];
  String get science_competition => _data["science_competition"];
  String get amsd => _data["amsd"];
  String get explory => _data["explory"];
  String get nationwide => _data["nationwide"];
  String get science_competition_explory => _data["science_competition_explory"];
  String get finalist => _data["finalist"];
  String get and_accredited => _data["and_accredited"];
  String get in_2020 => _data["in_2020"];
  String get with_project => _data["with_project"];
  String get aider_mobile_application => _data["aider_mobile_application"];
  String get international_invention => _data["international_invention"];
  String get interg => _data["interg"];
  String get main_honorary => _data["main_honorary"];
  String get ministry => _data["ministry"];
  String get in_2020_intarg => _data["in_2020_intarg"];
  String get bronze_medal => _data["bronze_medal"];
  String get for_the_project => _data["for_the_project"];
  String get special_distinction => _data["special_distinction"];
  String get young_inventor => _data["young_inventor"];
  String get for_the_project_aider => _data["for_the_project_aider"];
  String get aider_intarg => _data["aider_intarg"];
  String get google => _data["google"];
  String get tech_mentoring => _data["tech_mentoring"];
  String get program => _data["program"];
  String get programmer_skills => _data["programmer_skills"];
  String get under => _data["under"];
  String get see_my_project => _data["see_my_project"];
}

