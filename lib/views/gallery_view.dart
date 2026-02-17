import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final categories = {
    'Displays': [
      { 
        'name': 'Grand Horizon Vault', 
        'price': '\$5,850', 
        'tag': 'NEW ARRIVAL', 
        'img': 'https://images.unsplash.com/photo-1615873968403-89e068629265?auto=format&fit=crop&q=80&w=800',
        'desc': 'Our widest biometric unit designed for full sets. Integrated climate control and 12-slot capacity.'
      },
      { 
        'name': 'The Obsidian Pillar', 
        'price': '\$3,400', 
        'tag': 'LIMITED', 
        'img': 'https://images.unsplash.com/photo-1594026112284-02bb6f3352fe?auto=format&fit=crop&q=80&w=800',
        'desc': 'Vertical 4-slot orientation with matte black obsidian framing and reinforced security glass.'
      },
      { 
        'name': 'Heritage Console', 
        'price': '\$4,100', 
        'tag': 'BESTSELLER', 
        'img': 'https://images.unsplash.com/photo-1540638349517-3abd5afc5847?auto=format&fit=crop&q=80&w=800',
        'desc': 'Mid-sized 8-slot display featuring walnut trim and dual-layer ballistic protection.'
      }
    ],
    'Art': [
      {
        'name': 'The Alchemist Path',
        'price': '\$450',
        'tag': 'CURATED',
        'img': 'https://images.unsplash.com/photo-1578301978693-85fa9c0320b9?auto=format&fit=crop&q=80&w=800',
        'desc': 'Deep gold and emerald abstract print, specifically rendered to enhance the luster of ancient gold coinage.'
      },
      {
        'name': 'Celestial Cartography',
        'price': '\$600',
        'tag': 'LIMITED',
        'img': 'https://images.unsplash.com/photo-1582555172866-f73bb12a2ab3?auto=format&fit=crop&q=80&w=800',
        'desc': 'Stellar map inspiration. The perfect backdrop for nautical or early modern European collections.'
      },
      {
        'name': 'Abstract Ember',
        'price': '\$380',
        'tag': 'POPULAR',
        'img': 'https://images.unsplash.com/photo-1541701494587-cb58502866ab?auto=format&fit=crop&q=80&w=800',
        'desc': 'Vibrant crimson and copper tones, designed to make copper-alloy and bronze coins stand out.'
      }
    ],
    'Accessories': [
      {
        'name': 'Titanium Anchor Set',
        'price': '\$220',
        'tag': 'HARDWARE',
        'img': 'https://images.unsplash.com/photo-1581244277943-fe4a9c777189?auto=format&fit=crop&q=80&w=800',
        'desc': 'Reinforced mounting kit designed for secure installation into any wall type, including masonry.'
      },
      {
        'name': 'Curator Gloves (Pair)',
        'price': '\$45',
        'tag': 'ESSENTIAL',
        'img': 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?auto=format&fit=crop&q=80&w=800',
        'desc': 'Pure Egyptian cotton gloves to prevent oils and fingerprints from damaging sensitive numismatic surfaces.'
      },
      {
        'name': 'Replacement Inserts',
        'price': '\$150',
        'tag': 'CUSTOM',
        'img': 'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?auto=format&fit=crop&q=80&w=800',
        'desc': 'Set of 4 custom-milled velvet inserts, available in various depths to accommodate different slab sizes.'
      }
    ]
  };

  final userArtCollection = [
    { 'id': 'art-1', 'title': 'Golden Ratio Abstract', 'img': 'https://images.unsplash.com/photo-1550684848-fac1c5b4e853?auto=format&fit=crop&q=80&w=400' },
    { 'id': 'art-2', 'title': 'Ancient Sands Landscape', 'img': 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&q=80&w=400' },
    { 'id': 'art-3', 'title': 'Imperial Red Texture', 'img': 'https://images.unsplash.com/photo-1515405295579-ba7b45403062?auto=format&fit=crop&q=80&w=400' },
    { 'id': 'art-4', 'title': 'Midnight Navy Depth', 'img': 'https://images.unsplash.com/photo-1494438639946-1ebd1d20bf85?auto=format&fit=crop&q=80&w=400' }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF374151);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 64, 24, 32),
                child: Column(
                  children: [
                    Text(
                      'The Art of',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        height: 1.0,
                      ),
                    ),
                    Text(
                      'Preservation',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontStyle: FontStyle.italic,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Curated displays and bespoke digital backings designed to elevate the visual narrative of your collection.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TabBar(
                      controller: _tabController,
                      labelColor: Theme.of(context).primaryColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Theme.of(context).primaryColor,
                      labelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 2.0),
                      tabs: const [
                        Tab(text: 'DISPLAYS'),
                        Tab(text: 'ART'),
                        Tab(text: 'ACCESSORIES'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildGrid('Displays'),
            _buildGrid('Art'),
            _buildGrid('Accessories'),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(String category) {
    final items = categories[category]!;
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: items.length + 1, // +1 for the collection section at the bottom
      itemBuilder: (context, index) {
        if (index == items.length) {
          return _buildCollectionSection();
        }
        
        final item = items[index];
        return _buildProductCard(item);
      },
    );
  }

  Widget _buildProductCard(Map<String, String> item) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = Theme.of(context).colorScheme.surface;
    final borderColor = isDark ? Colors.grey[800] : Colors.grey[200];
    final textColor = isDark ? Colors.white : const Color(0xFF374151);

    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: borderColor!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 4 / 5,
                child: Image.network(
                  item['img']!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 24,
                left: 24,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
                  ),
                  child: Text(
                    item['tag']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item['name']!,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      item['price']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  '"${item['desc']}"',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'AVAILABLE TO SHIP',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2.0,
                        color: Colors.grey,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text('Transaction for ${item['name']} initiated...')),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Theme.of(context).primaryColor),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Text(
                        'ACQUIRE NOW',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollectionSection() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Surface dark
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Curated Collection',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Manage your custom artwork and print backings.',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.upload_file, color: Theme.of(context).primaryColor)),
            ],
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: userArtCollection.length + 1,
            itemBuilder: (context, index) {
              if (index == userArtCollection.length) {
                // Add button
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.1), style: BorderStyle.solid), // dashed in design
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         Icon(Icons.add_photo_alternate, color: Colors.grey[700], size: 32),
                         const SizedBox(height: 8),
                         const Text(
                           'Expand Range',
                           style: TextStyle(color: Colors.grey, fontSize: 10),
                         )
                      ],
                    ),
                  ),
                );
              }
              final art = userArtCollection[index];
              return GestureDetector(
                onTap: () {
                  _showAssignModal(context, art['img']!);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: NetworkImage(art['img']!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    art['title']!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showAssignModal(BuildContext context, String imgUrl) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          ),
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assign Art Backing',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Select which unit chassis will feature this digital narrative.',
                style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 32),
              ...['vault-042', 'classic-001', 'collector-008'].map((id) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Art piece assigned successfully.')),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.security, color: Theme.of(context).primaryColor),
                            const SizedBox(width: 16),
                            Text(
                              id.replaceAll('-', ' ').toUpperCase(),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.chevron_right, color: Theme.of(context).primaryColor),
                      ],
                    ),
                  ),
                ),
              )),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('CANCEL REQUEST', style: TextStyle(letterSpacing: 2.0, fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
