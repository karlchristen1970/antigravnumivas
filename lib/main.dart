import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/dashboard_view.dart';
import 'views/concierge_view.dart';
import 'views/gallery_view.dart';
import 'views/support_view.dart';
import 'views/product_detail_view.dart';

void main() {
  runApp(const NumivasApp());
}

// Global key to access theme toggle from anywhere in the app
final GlobalKey<_NumivasAppState> numivasAppKey = GlobalKey<_NumivasAppState>();

class NumivasApp extends StatefulWidget {
  const NumivasApp({super.key});

  @override
  State<NumivasApp> createState() => _NumivasAppState();

  /// Toggle between light, dark, and system theme modes
  static void toggleTheme(BuildContext context) {
    numivasAppKey.currentState?.toggleTheme();
  }

  /// Get the current theme mode
  static ThemeMode getThemeMode(BuildContext context) {
    return numivasAppKey.currentState?._themeMode ?? ThemeMode.dark;
  }
}

class _NumivasAppState extends State<NumivasApp> {
  ThemeMode _themeMode = ThemeMode.dark; // Default to dark for luxury feel

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: numivasAppKey,
      title: 'Numivas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFFD4AF37), // Gold
        scaffoldBackgroundColor: const Color(0xFFF9FAFB), // gray-50
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFD4AF37),
          surface: Colors.white,
          onSurface: Color(0xFF374151), // charcoal/gray-700
        ),
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFD4AF37),
        scaffoldBackgroundColor: const Color(0xFF121212), // Charcoal/Black
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37),
          surface: Color(0xFF1E1E1E),
          onSurface: Colors.white,
        ),
        textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
      ),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/unit') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => ProductDetailView(unitId: args),
          );
        }
        return null;
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    const DashboardView(),
    const GalleryView(),
    const ConciergeView(),
    const SupportView(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _views,
          ),
          // Dark mode toggle button - top right corner
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            right: 16,
            child: GestureDetector(
              onTap: () => NumivasApp.toggleTheme(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? Colors.white.withOpacity(0.15)
                        : Colors.black.withOpacity(0.1),
                  ),
                ),
                child: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: isDark ? const Color(0xFFD4AF37) : const Color(0xFF374151),
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Vault',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_outlined),
            activeIcon: Icon(Icons.collections),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service_outlined),
            activeIcon: Icon(Icons.room_service),
            label: 'Concierge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent_outlined),
            activeIcon: Icon(Icons.support_agent),
            label: 'Support',
          ),
        ],
      ),
    );
  }
}
