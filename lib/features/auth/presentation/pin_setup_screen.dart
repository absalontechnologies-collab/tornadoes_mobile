import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key});

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  String pin = "";

  void _onKeypadPressed(String val) {
    if (val == "backspace") {
      if (pin.isNotEmpty) {
        setState(() {
          pin = pin.substring(0, pin.length - 1);
        });
      }
    } else if (val == "fingerprint") {
      // Logic for biometric
    } else {
      if (pin.length < 4) {
        setState(() {
          pin += val;
        });
        if (pin.length == 4) {
          // Complete
          Future.delayed(const Duration(milliseconds: 200), () {
            if (mounted) context.push('/kyc');
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF2D3435) : const Color(0xFF4A4A4A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('Sécurité', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            const Text('Saisissez votre code PIN', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: -0.5)),
            const SizedBox(height: 8),
            const Text('Pour sécuriser vos transactions', style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 48),

            // PIN Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                bool isActive = index < pin.length;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isActive ? theme.primaryColor : Colors.grey.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: isActive ? Border.all(color: theme.primaryColor.withOpacity(0.3), width: 4) : null,
                  ),
                );
              }),
            ),
            
            const SizedBox(height: 64),

            // Keypad
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Column(
                children: [
                  _buildKeypadRow(['1', '2', '3'], theme),
                  const SizedBox(height: 16),
                  _buildKeypadRow(['4', '5', '6'], theme),
                  const SizedBox(height: 16),
                  _buildKeypadRow(['7', '8', '9'], theme),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildKeypadBtn('fingerprint', theme, isIcon: true),
                      _buildKeypadBtn('0', theme),
                      _buildKeypadBtn('backspace', theme, isIcon: true),
                    ],
                  ),
                ],
              ),
            ),
            
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text('CODE OUBLIÉ ?', style: TextStyle(fontWeight: FontWeight.bold, color: theme.primaryColor, letterSpacing: 2.0, fontSize: 12)),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypadRow(List<String> keys, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: keys.map((k) => _buildKeypadBtn(k, theme)).toList(),
    );
  }

  Widget _buildKeypadBtn(String key, ThemeData theme, {bool isIcon = false}) {
    return GestureDetector(
      onTap: () => _onKeypadPressed(key),
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: isIcon ? Colors.transparent : Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: isIcon
            ? Icon(key == 'fingerprint' ? Icons.fingerprint : Icons.backspace, size: 32, color: Colors.grey)
            : Text(key, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
