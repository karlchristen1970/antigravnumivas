import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  // Chat State
  bool isChatOpen = false;
  final List<Map<String, String>> messages = [
    {'role': 'model', 'text': 'Greetings. I am your Numivas Technical Specialist. How may I assist you with your collection security or display installation today?'}
  ];
  final TextEditingController _textController = TextEditingController();
  bool isLoading = false;

  final steps = [
     {'title': 'Measure & Mark', 'icon': Icons.straighten, 'desc': 'Identify a load-bearing stud. Use the template to mark four anchor points at eye level.'},
     {'title': 'Install Anchors', 'icon': Icons.hardware, 'desc': 'Drill 1/4" pilot holes. Insert heavy-duty titanium wall anchors flush with surface.'},
     {'title': 'Secure & Lock', 'icon': Icons.lock, 'desc': 'Mount chassis onto anchors. Tighten security bolts until the locking mechanism clicks.'}
  ];

  final questions = [
    {'q': 'Security Features & Biometrics', 'a': 'The Numivas Vault Edition features a dual-layer biometric lock requiring both a fingerprint scan and a unique encrypted proximity signal from your mobile device.'},
    {'q': 'Museum-Grade Glass Care', 'a': 'Our glass is multi-layered and anti-reflective. Clean only with the provided Numivas microfiber cloth and high-purity ammonia-free solution to preserve the optical clarity.'},
    {'q': 'Coin Slab Compatibility', 'a': 'Inserts are CNC-milled specifically for standard NGC and PCGS slabs. Bespoke modular inserts are available for odd-sized historical artifacts via our concierge.'}
  ];

  void _sendMessage() {
    if (_textController.text.trim().isEmpty) return;

    final text = _textController.text;
    setState(() {
      messages.add({'role': 'user', 'text': text});
      isLoading = true;
    });
    _textController.clear();

    // Mock AI Response
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
        messages.add({'role': 'model', 'text': 'I understand you are asking about "$text". As a secure automated system, I recommend checking the Knowledge Base for immediate assistance, or contacting our Concierge for specialized support.'});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isChatOpen) {
      return _buildChatInterface();
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
            children: [
              Text(
                'Installation & Care',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Expert guidance for your Numivas Vault Edition. Ensure your collection is displayed with precision and absolute security.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.grey),
              ),
              const SizedBox(height: 64),

              // Mounting Guide
              Row(
                children: [
                  Icon(Icons.build, color: Theme.of(context).primaryColor, size: 28),
                  const SizedBox(width: 16),
                  Text('MOUNTING GUIDE', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2.0, color: textColor, fontSize: 18)),
                ],
              ),
              const SizedBox(height: 32),
              
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: steps.length,
                separatorBuilder: (context, index) => const SizedBox(height: 32),
                itemBuilder: (context, index) {
                  final step = steps[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: borderColor!),
                    ),
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.4), blurRadius: 10)],
                          ),
                          child: Center(child: Text('${index + 1}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Playfair Display'))),
                        ),
                        const SizedBox(height: 24),
                        Text(step['title'] as String, style: GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.bold, color: textColor)),
                        const SizedBox(height: 12),
                        Text(step['desc'] as String, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[500], height: 1.5)),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 64),

              // FAQ
              Row(
                children: [
                  Icon(Icons.help_outline, color: Theme.of(context).primaryColor, size: 28),
                  const SizedBox(width: 16),
                  Text('KNOWLEDGE BASE', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2.0, color: textColor, fontSize: 18)),
                ],
              ),
              const SizedBox(height: 32),
              ...questions.map((q) => Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: borderColor!),
                ),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  title: Text(q['q']!, style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
                  childrenPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  children: [
                    Text(q['a']!, style: const TextStyle(color: Colors.grey, height: 1.5)),
                  ],
                ),
              )),

              const SizedBox(height: 32),
              
              // Action Buttons
              GestureDetector(
                onTap: () => setState(() => isChatOpen = true),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: cardBg,
                    border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
                        child: Icon(Icons.smart_toy, color: Theme.of(context).primaryColor, size: 32),
                      ),
                      const SizedBox(height: 16),
                      Text('AI Technical Desk', style: GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.bold, color: textColor)),
                      const SizedBox(height: 8),
                      const Text('Synchronized support available 24/7.', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.3), blurRadius: 10)],
                        ),
                        child: const Center(child: Text('INITIATE AI SESSION', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 2.0, fontSize: 10))),
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

  Widget _buildChatInterface() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        leading: const Icon(Icons.security, color: Color(0xFFD4AF37)),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SPECIALIST AI', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2.0, color: Colors.white)),
            Text('TELEMETRY ACTIVE', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 2.0, color: Color(0xFFD4AF37))),
          ],
        ),
        actions: [
          IconButton(onPressed: () => setState(() => isChatOpen = false), icon: const Icon(Icons.close, color: Colors.white)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: messages.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == messages.length) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.black26 : Colors.grey[50],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
                }
                final m = messages[index];
                final isUser = m['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    constraints: const BoxConstraints(maxWidth: 300),
                    decoration: BoxDecoration(
                      color: isUser ? Theme.of(context).primaryColor : (isDark ? Colors.black26 : Colors.grey[100]),
                      borderRadius: BorderRadius.only(
                        topLeft: isUser ? const Radius.circular(16) : Radius.zero,
                        topRight: isUser ? Radius.zero : const Radius.circular(16),
                        bottomLeft: const Radius.circular(16),
                        bottomRight: const Radius.circular(16),
                      ),
                      boxShadow: isUser ? [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.2), blurRadius: 10)] : [],
                    ),
                    child: Text(
                      m['text']!,
                      style: TextStyle(
                        color: isUser ? Colors.white : (isDark ? Colors.white : const Color(0xFF374151)),
                        height: 1.4,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white,
              border: Border(top: BorderSide(color: isDark ? Colors.white10 : Colors.grey[200]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: (_) => _sendMessage(),
                    decoration: InputDecoration(
                      hintText: 'Message technical desk...',
                      filled: true,
                      fillColor: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[50],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 0,
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
