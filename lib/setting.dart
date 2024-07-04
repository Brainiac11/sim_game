class Setting {
  Object? settingValue;
  bool? settingBool;
  String? settingString;
  double? settingDouble;
  String settingKey;
  Setting({
    required this.settingKey,
    this.settingValue,
    this.settingBool,
    this.settingString,
    this.settingDouble,
  });

  String? description;

  List<String> toStringList() {
    return List.of(
      <String>[
        settingValue.toString(),
        settingBool.toString(),
        settingString ?? "",
        settingDouble.toString()
      ],
    );
  }
}
