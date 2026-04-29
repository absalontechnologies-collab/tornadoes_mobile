import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeliveryChatScreen extends StatelessWidget {
  const DeliveryChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF2D3435) : const Color(0xFF5F5E5E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Aissatou Fall', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            Text('ORDER #BD-92831', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 10, letterSpacing: 1.0)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
                    child: const Text('AUJOURD\'HUI, 14:22', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Received Message
                _buildMessageBubble(
                  isMe: false, 
                  message: 'Bonjour ! J\'ai commandé pour l\'immeuble C, je suis au 3ème étage.', 
                  time: '14:23', 
                  theme: theme, 
                  isDark: isDark
                ),
                const SizedBox(height: 16),
                
                // Sent Message
                _buildMessageBubble(
                  isMe: true, 
                  message: 'Bien reçu. Je termine une livraison à 5 minutes de chez vous et j\'arrive.', 
                  time: '14:25', 
                  theme: theme, 
                  isDark: isDark
                ),
                const SizedBox(height: 16),
                
                // Received Message
                _buildMessageBubble(
                  isMe: false, 
                  message: 'Parfait, merci beaucoup. Le code de la porte est le 45A2.', 
                  time: '14:26', 
                  theme: theme, 
                  isDark: isDark
                ),
                
                const SizedBox(height: 24),
                
                // Info Card Insight
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.map, color: theme.primaryColor),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('PROXIMITÉ CLIENT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                            const SizedBox(height: 2),
                            Text('Vous êtes à 800m de la destination.', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                          ],
                        ),
                      ),
                      Text('2 min', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Sent Message
                _buildMessageBubble(
                  isMe: true, 
                  message: 'Entendu, je note le code. À tout de suite.', 
                  time: '14:28', 
                  theme: theme, 
                  isDark: isDark
                ),
              ],
            ),
          ),
          
          // Bottom Input Area
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 32, left: 16, right: 16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2122) : Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildQuickReply('Je suis arrivé', isDark),
                      const SizedBox(width: 8),
                      _buildQuickReply('En route', isDark),
                      const SizedBox(width: 8),
                      _buildQuickReply('J\'ai du retard', isDark),
                      const SizedBox(width: 8),
                      _buildQuickReply('Où êtes-vous ?', isDark),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                      child: IconButton(icon: const Icon(Icons.add), onPressed: () {}),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Tapez votre message...',
                          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.1),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: theme.primaryColor.withOpacity(0.3), blurRadius: 8)]),
                      child: IconButton(icon: const Icon(Icons.send, color: Colors.white, size: 20), onPressed: () {}),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Widget _buildMessageBubble({required bool isMe, required String message, required String time, required ThemeData theme, required bool isDark}) {
    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 280),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isMe ? theme.primaryColor : (isDark ? const Color(0xFF323A3B) : Colors.grey.shade200),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft: isMe ? const Radius.circular(20) : Radius.zero,
              bottomRight: isMe ? Radius.zero : const Radius.circular(20),
            ),
          ),
          child: Text(
            message,
            style: TextStyle(color: isMe ? Colors.white : (isDark ? Colors.white : Colors.black87), fontSize: 14, height: 1.4),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            if (isMe) ...[
              const SizedBox(width: 4),
              Icon(Icons.done_all, size: 12, color: theme.primaryColor),
            ]
          ],
        )
      ],
    );
  }
  
  Widget _buildQuickReply(String text, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}
