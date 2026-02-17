import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/constants.dart';
import '../models/types.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  // Simulating localStorage for vaultArt
  final Map<String, String> _vaultArt = {};

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF374151);
    final subTextColor = isDark ? Colors.grey[400] : Colors.grey[500];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Your Vault',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome back, James. Your collection remains under active biometric protection.',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: subTextColor,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 48),

              // Stats Grid
              // On mobile, we might want a vertical list or a 2-col grid. 
              // The design says md:grid-cols-3. Mobile usually 1 col.
              _buildStatCard(
                context,
                label: 'Total Value',
                value: '\$142,500',
                icon: Icons.account_balance,
              ),
              const SizedBox(height: 16),
              _buildStatCard(
                context,
                label: 'Active Displays',
                value: '3 Units',
                icon: Icons.grid_view,
              ),
              const SizedBox(height: 16),
              _buildStatCard(
                context,
                label: 'System Status',
                value: 'All Secure',
                icon: Icons.verified_user,
                isSecure: true,
              ),

              const SizedBox(height: 48),

              // Active Installations Header
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Active Installations',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Units List
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: kUnits.length,
                separatorBuilder: (context, index) => const SizedBox(height: 32),
                itemBuilder: (context, index) {
                  return _buildUnitCard(context, kUnits[index]);
                },
              ),

              const SizedBox(height: 64),

              // Register Button
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    // Logic to register new unit
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    side: BorderSide(
                      color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                      width: 2,
                      style: BorderStyle.solid, // Should be dashed strictly speaking but solid is fine for simple implementation
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_circle_outline, color: subTextColor),
                      const SizedBox(width: 16),
                      Text(
                        'REGISTER NEW NUMIVAS UNIT',
                        style: TextStyle(
                          color: subTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    bool isSecure = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = Theme.of(context).colorScheme.surface;
    final borderColor = isDark ? Colors.grey[800] : Colors.grey[200];
    
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isSecure ? Colors.green : (isDark ? Colors.white : const Color(0xFF374151)),
                ),
              ),
            ],
          ),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: isSecure 
                  ? (isDark ? Colors.green.withOpacity(0.1) : Colors.green[50])
                  : (Theme.of(context).primaryColor.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: isSecure ? Colors.green : Theme.of(context).primaryColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitCard(BuildContext context, Unit unit) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = Theme.of(context).colorScheme.surface;
    final borderColor = isDark ? Colors.grey[800] : Colors.grey[200];

    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: borderColor!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Image Area
          Container(
            height: 320,
            width: double.infinity,
            color: const Color(0xFF0A0A0A),
            padding: const EdgeInsets.all(40),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Backing Art (simulated)
                // if (_vaultArt.containsKey(unit.id)) ...
                
                // Secure Badge
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(color: Colors.green.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.security, color: Colors.green, size: 14),
                        const SizedBox(width: 8),
                        const Text(
                          'SECURE',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Main Image
                Image.network(
                  unit.image,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          // Content Area
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          unit.name,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF374151),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          unit.location.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[50],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'COINS',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2.0,
                              color: Colors.grey[500],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            unit.coinCount.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : const Color(0xFF374151),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                
                // Stats
                Row(
                  children: [
                    _buildUnitStat(context, Icons.thermostat, '${unit.temp}°F'),
                    const SizedBox(width: 24),
                    _buildUnitStat(context, Icons.water_drop, '${unit.humidity}% RH'),
                  ],
                ),

                const SizedBox(height: 40),

                // Manage Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/unit', arguments: unit.id);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      side: BorderSide(color: isDark ? Colors.grey[700]! : Colors.grey[300]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      'MANAGE DISPLAY',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5,
                        color: isDark ? Colors.white : const Color(0xFF374151),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitStat(BuildContext context, IconData icon, String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 18),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
