class Settings {
  bool infiniteMode;
  bool haptics;
  bool isDarkMode;

  Settings({
    this.infiniteMode = false,
    this.haptics = false,
    this.isDarkMode = true,
  });

  Settings copy({
    bool? infiniteMode,
    bool? haptics,
    bool? isDarkMode,
  }) =>
      Settings(
        infiniteMode: infiniteMode ?? this.infiniteMode,
        haptics: haptics ?? this.haptics,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
