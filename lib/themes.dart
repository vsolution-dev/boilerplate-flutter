import 'package:flutter/material.dart';
import 'package:flutter_app/styles/custom_colors.dart';
import 'package:flutter_app/styles/custom_text_styles.dart';

// see https://dartling.dev/dynamic-theme-color-material-3-you-flutter
class Themes {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,

      colorScheme: const ColorScheme.light(
        primary: CustomColors.blueBlack,
        background: Colors.white,
        error: CustomColors.error,
      ),

      cardTheme: const CardTheme(),
      textTheme: const TextTheme(),
      appBarTheme: const AppBarTheme(),
      dialogTheme: const DialogTheme(),
      bottomAppBarTheme: const BottomAppBarTheme(),
      inputDecorationTheme: InputDecorationTheme(
        isCollapsed: true,
        isDense: true,

        contentPadding: const EdgeInsets.all(18),

        hintStyle: CustomTextStyles.body2.copyWith(
          color: Color(0xFF525E7B),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffB9C1D3)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffB9C1D3)),
          borderRadius: BorderRadius.circular(12),
        ),

        // error
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.error),
          borderRadius: BorderRadius.circular(12),
        ),
        errorStyle: CustomTextStyles.footnote.copyWith(
          color: CustomColors.error,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.error),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(),

      scrollbarTheme: const ScrollbarThemeData(),
      textSelectionTheme: const TextSelectionThemeData(),

      // layout
      bottomSheetTheme: const BottomSheetThemeData(),
      bannerTheme: const MaterialBannerThemeData(),
      actionIconTheme: const ActionIconThemeData(),
      drawerTheme: const DrawerThemeData(),

      // element
      iconTheme: const IconThemeData(),
      chipTheme: const ChipThemeData(),
      badgeTheme: const BadgeThemeData(),
      dividerTheme: const DividerThemeData(),
      dataTableTheme: const DataTableThemeData(),
      expansionTileTheme: const ExpansionTileThemeData(),
      buttonBarTheme: const ButtonBarThemeData(),
      listTileTheme: const ListTileThemeData(),
      tooltipTheme: const TooltipThemeData(),
      tabBarTheme: const TabBarTheme(),
      snackBarTheme: const SnackBarThemeData(),
      searchBarTheme: const SearchBarThemeData(),
      searchViewTheme: const SearchViewThemeData(),
      progressIndicatorTheme: const ProgressIndicatorThemeData(),

      navigationDrawerTheme: const NavigationDrawerThemeData(),
      navigationBarTheme: const NavigationBarThemeData(),
      navigationRailTheme: const NavigationRailThemeData(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(),

      menuTheme: const MenuThemeData(),
      menuBarTheme: const MenuBarThemeData(),
      menuButtonTheme: const MenuButtonThemeData(),
      dropdownMenuTheme: const DropdownMenuThemeData(),
      popupMenuTheme: const PopupMenuThemeData(),

      // input
      sliderTheme: const SliderThemeData(),
      radioTheme: const RadioThemeData(),
      checkboxTheme: const CheckboxThemeData(),
      switchTheme: const SwitchThemeData(),
      datePickerTheme: const DatePickerThemeData(),
      timePickerTheme: const TimePickerThemeData(),

      // button
      buttonTheme: const ButtonThemeData(),

      outlinedButtonTheme: OutlinedButtonThemeData(),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.25,
          ),
        ),
      ),
      textButtonTheme: const TextButtonThemeData(),

      elevatedButtonTheme: const ElevatedButtonThemeData(),
      iconButtonTheme: const IconButtonThemeData(),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      toggleButtonsTheme: const ToggleButtonsThemeData(),
      segmentedButtonTheme: const SegmentedButtonThemeData(),
    );
  }
}
