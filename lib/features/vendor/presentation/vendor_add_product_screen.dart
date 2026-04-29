import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorAddProductScreen extends StatelessWidget {
  const VendorAddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F5E5E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('Ajouter un Produit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: 32, height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white24, width: 2),
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuB0-v0voUeG7T473ixOYX4XZDATi-zA__rNyuqplvsE2bPUIv5OPaxY_meNs6HogyUDqAhAHQjLX8GdStEyX823jagR_JZpQIYoKksp275v3X9Ql7AmnTdoW66K332X5Gc3oTcYLWWhl2CBAj4VqLyc-c3hyxtDUOQINkMmQHAMpU13KO-uw8bgbI5uFfS0j01V_sZbuGYNiNMU1jim8b8Q2aoD8S8yujC7T3MZRQkhj7GKABU5_pkyQSf3mz1yIuolJ4UGS5Eu2rh-'),
                  fit: BoxFit.cover
                )
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Basic Info Section
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2122) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Informations Générales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Saisissez les détails essentiels de votre nouveau produit.', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                    const SizedBox(height: 24),
                    
                    _buildTextField('NOM DU PRODUIT', 'Ex: Montre de luxe Heritage', isDark),
                    const SizedBox(height: 16),
                    
                    Row(
                      children: [
                        Expanded(child: _buildDropdownField('CATÉGORIE', 'Mode & Accessoires', isDark)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildTextField('MARQUE', 'Marque', isDark)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    _buildTextField('DESCRIPTION', 'Décrivez les caractéristiques uniques de votre produit...', isDark, maxLines: 5),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Pricing & Stock
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2122) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Prix & Stock', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 24),
                    
                    Row(
                      children: [
                        Expanded(child: _buildTextField('PRIX DE VENTE (FCFA)', '0', isDark, keyboardType: TextInputType.number)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildTextField('QUANTITÉ EN STOCK', '10', isDark, keyboardType: TextInputType.number)),
                      ],
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Media Upload
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2122) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Médias', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Ajoutez jusqu\'à 5 photos haute qualité.', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                    const SizedBox(height: 24),
                    
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.withOpacity(0.3), style: BorderStyle.solid, width: 2), // Dashed imitation
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add_a_photo, size: 48, color: Colors.grey),
                            const SizedBox(height: 8),
                            Text('Télécharger l\'image principale', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) => 
                        Container(
                          width: 60, height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.withOpacity(0.2)),
                          ),
                          child: const Icon(Icons.add, color: Colors.grey),
                        )
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Enregistrer le produit', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: TextButton(
                        onPressed: () => context.pop(),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.withOpacity(0.1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Annuler', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                      ),
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildTextField(String label, String hint, bool isDark, {int maxLines = 1, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            filled: true,
            fillColor: isDark ? const Color(0xFF121212) : Colors.grey.shade100,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        )
      ],
    );
  }

  Widget _buildDropdownField(String label, String hint, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF121212) : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(hint, style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.5))),
              items: [],
              onChanged: (val) {},
            ),
          ),
        )
      ],
    );
  }
}
