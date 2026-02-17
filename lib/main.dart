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

class NumivasApp extends StatelessWidget {
  const NumivasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numivas',
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
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        // We will handle dynamic routes in onGenerateRoute if needed, 
        // but for now let's just use a simple map and pass arguments.
        '/unit': (context) => const ProductDetailView(),
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
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _views,
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
