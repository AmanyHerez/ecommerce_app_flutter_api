class SettingsModel {
  bool? status;

  SettingData? data;

  SettingsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? new SettingData.fromJson(json['data']) : null;
  }
}

class SettingData {
  String? about;
  String? terms;

  SettingData.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    terms = json['terms'];
  }
}
