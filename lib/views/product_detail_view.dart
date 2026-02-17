import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/types.dart';
import '../data/constants.dart';

class ProductDetailView extends StatefulWidget {
  final String? unitId;
  const ProductDetailView({super.key, this.unitId});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  late Unit unit;
  String? activeArt; // Simulate local storage
  
  // Curator State
  bool showCurator = false;
  bool isCuratorLoading = false;
  String? curatorInsight;

  @override
  void initState() {
    super.initState();
    // content of finding unit
    final id = widget.unitId ?? kUnits.first.id;
    unit = kUnits.firstWhere((u) => u.id == id, orElse: () => kUnits.first);
  }

  Future<void> _getCuratorInsight() async {
    setState(() {
      isCuratorLoading = true;
      showCurator = true;
    });

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isCuratorLoading = false;
      curatorInsight = "The 1933 Double Eagle represents the pinnacle of American numismatic tragedy and triumph. Its surfaces—matte gold against a backdrop of obsidian—reflect a turbulent era of economic transformation.\n\n"
          "This secure housing does not merely protect; it contextualizes. The controlled humidity ensures the localized atmosphere remains chemically inert, preserving the original mint luster that has survived nearly a century of legal and physical peril.\n\n"
          "Our preservationist recommendation: Maintain current lux levels. The visual symbiosis between the Saint-Gaudens relief and the minimalist display framing creates a dialogue between Art Deco mastery and modern security architecture.";
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showCurator) {
      return _buildCuratorOverlay();
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF374151);
    final cardBg = Theme.of(context).colorScheme.surface;
    final borderColor = isDark ? Colors.grey[800] : Colors.grey[200];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumb
              Row(
                children: [
                   InkWell(
                     onTap: () => Navigator.pop(context),
                     child: Text(
                       'VAULT',
                       style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 3.0, color: Colors.grey[500]),
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 16),
                     child: Text('/', style: TextStyle(color: Colors.grey)),
                   ),
                   Text(
                     'DISPLAY UNIT #${unit.id.split("-").last}',
                     style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 3.0, color: Theme.of(context).primaryColor),
                   ),
                ],
              ),
              const SizedBox(height: 24),

              // Header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    unit.name,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.lato(fontSize: 18, color: Colors.grey[500]),
                      children: [
                        TextSpan(text: unit.location),
                        const TextSpan(text: ' • '),
                        TextSpan(
                          text: 'Biometric Active',
                          style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Actions
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.verified, size: 18, color: isDark ? Colors.white : Colors.black),
                      label: Text('CERTIFICATION', style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 10, letterSpacing: 2.0, fontWeight: FontWeight.w900)),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        side: BorderSide(color: borderColor!),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.sync, size: 18),
                      label: const Text('SYNC HARDWARE'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        textStyle: const TextStyle(fontSize: 10, letterSpacing: 2.0, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 48),

              // Main Display View
              Container(
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: borderColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Status Badge
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.green.withOpacity(0.2)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                              const SizedBox(width: 8),
                              const Text('ACTIVE', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 2.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    // Image
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFF121212),
                      ),
                      padding: const EdgeInsets.all(40),
                      child: Image.network(unit.image, fit: BoxFit.contain),
                    ),

                    // Info
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('CONFIGURATION', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 3.0, color: Colors.grey[500])),
                              Text('${unit.slots}-SLOT ELITE CHASSIS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 2.0, color: Theme.of(context).primaryColor)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 16),
                          Text('"${unit.description}"', style: GoogleFonts.lato(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey)),
                          const SizedBox(height: 24),
                          
                          ElevatedButton.icon(
                            onPressed: _getCuratorInsight,
                            icon: const Icon(Icons.auto_awesome, size: 16),
                            label: const Text('EXPERT CURATOR'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDark ? Theme.of(context).primaryColor : const Color(0xFF374151),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Reduced vertical padding
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              textStyle: const TextStyle(fontSize: 10, letterSpacing: 2.0, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Environmental Status
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Environmental Status', style: GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.bold, color: textColor)),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildEnvStat(context, Icons.thermostat, '${unit.temp}°F', 'Temp'),
                        _buildEnvStat(context, Icons.water_drop, '${unit.humidity}%', 'Humidity'),
                        _buildEnvStat(context, Icons.lock, unit.status, 'Status', highlight: true),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Active Inventory
              Container(
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Active Inventory', style: GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.bold, color: textColor)),
                              const SizedBox(height: 4),
                              Text('DETECTED VIA ENCRYPTED NFC', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 2.0, color: Colors.grey[500])),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.blue.withOpacity(0.2)),
                            ),
                            child: const Text('VAL: \$142,500', style: TextStyle(color: Colors.blue, fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 2.0)),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: kInventory.length,
                      itemBuilder: (context, index) {
                        final coin = kInventory[index];
                        return Padding(
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[100],
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: borderColor),
                                ),
                                child: Image.network(coin.image),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(coin.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
                                    const SizedBox(height: 4),
                                    Text('${coin.grade} • ${coin.metal}', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                                    const SizedBox(height: 4),
                                    Text('CERT ${coin.certNumber}', style: TextStyle(fontSize: 10, fontFamily: 'monospace', color: Colors.grey[400], letterSpacing: 1.5)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: coin.agency == 'PCGS' ? Theme.of(context).primaryColor : Colors.transparent,
                                  border: Border.all(color: coin.agency == 'PCGS' ? Colors.transparent : borderColor),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(coin.agency, style: TextStyle(color: coin.agency == 'PCGS' ? Colors.white : textColor, fontSize: 9, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
              
              Text('Security Protocol Log', style: TextStyle(fontSize: 24, fontFamily: GoogleFonts.playfairDisplay().fontFamily, fontWeight: FontWeight.bold, color: textColor)),
              const SizedBox(height: 16),
              // Simple Log List since Table might be too wide
              Container(
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: borderColor),
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: kLogs.length,
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final log = kLogs[index];
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(log.event, style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
                              const SizedBox(height: 4),
                              Text(log.time, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: log.status == 'Success' 
                                  ? Colors.green.withOpacity(0.1) 
                                  : (log.status == 'Resolved' ? Colors.orange.withOpacity(0.1) : Colors.blue.withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              log.status.toUpperCase(),
                              style: TextStyle(
                                fontSize: 9, 
                                fontWeight: FontWeight.bold, 
                                color: log.status == 'Success' ? Colors.green : (log.status == 'Resolved' ? Colors.orange : Colors.blue)
                              )
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnvStat(BuildContext context, IconData icon, String value, String label, {bool highlight = false}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: highlight 
                ? Theme.of(context).primaryColor 
                : (isDark ? Colors.white.withOpacity(0.05) : Colors.grey[50]),
            borderRadius: BorderRadius.circular(16),
            boxShadow: highlight ? [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.3), blurRadius: 10)] : [],
          ),
          child: Icon(icon, color: highlight ? Colors.white : Theme.of(context).primaryColor),
        ),
        const SizedBox(height: 12),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: highlight ? Theme.of(context).primaryColor : (isDark ? Colors.white : const Color(0xFF374151)))),
        const SizedBox(height: 4),
        Text(label.toUpperCase(), style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 2.0, color: Colors.grey[500])),
      ],
    );
  }

  Widget _buildCuratorOverlay() {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: const Color(0xFF050505),
                automaticallyImplyLeading: false,
                floating: true,
                title: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.auto_stories, color: Color(0xFFD4AF37), size: 20),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("The Curator's Study", style: TextStyle(fontFamily: 'Playfair Display', fontSize: 18, color: Colors.white)),
                        Text("BESPOKE NUMISMATIC ANALYSIS", style: TextStyle(fontSize: 9, letterSpacing: 2.0, color: Color(0xFFD4AF37), fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => setState(() => showCurator = false),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      // Highlight Image with Glow
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.white.withOpacity(0.1)),
                          boxShadow: [
                            BoxShadow(color: const Color(0xFFD4AF37).withOpacity(0.2), blurRadius: 40),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                             // This would be the active Art
                             const Positioned.fill(
                               child: Opacity(
                                 opacity: 0.2,
                                 child: DecoratedBox(decoration: BoxDecoration(color: Colors.blueAccent)), // placeholder for art
                               ),
                             ),
                             Image.network(unit.image, fit: BoxFit.contain),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),

                      if (isCuratorLoading)
                        const Center(child: CircularProgressIndicator(color: Color(0xFFD4AF37)))
                      else ...[
                        Text(
                          "Preserving the\nIntrinsic Legacy",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 36,
                            color: Colors.white,
                            height: 1.1,
                          ),
                        ),
                       const SizedBox(height: 32),
                       Text(
                         curatorInsight ?? "",
                         style: GoogleFonts.lato(
                           fontSize: 16,
                           height: 1.8,
                           color: Colors.grey[400],
                           fontStyle: FontStyle.italic,
                         ),
                       ),
                       const SizedBox(height: 48),
                       
                       // Curator Signature
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const CircleAvatar(
                             radius: 24,
                             backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuC9EjlB1biRigTyPmpdo6flTpulZLvR57Wy1kfJpcgdghon2uqlvRKL8Lz4CtevxeyRQ2Dz-xLGoI8uujpnht6bCUoXbwJWkfCfGZLDOXW5wP7aAaeWemTtEvpJMciCCC8lo_0EdLKweEI8nt0Png_2ML9UPF2NXTcdFaLK7ew-JI0lhirvNFF0jOokthloxaPfzes566ia7LYaTlYFgLTPdOEfmCzlabjEJszfn9T-tNooa4BIkweAasaJHiedjLMx2v3c1vccbRw'),
                           ),
                           const SizedBox(width: 16),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               const Text("ALEXANDER STERLING", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2.0, fontSize: 10)),
                               Text("SENIOR CURATORIAL LEAD", style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w900, letterSpacing: 2.0, fontSize: 9)),
                             ],
                           )
                         ],
                       ),
                       const SizedBox(height: 64),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
