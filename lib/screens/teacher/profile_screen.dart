import 'package:flutter/material.dart';
import 'package:schoop_app/screens/auth/login_screen.dart';
import '../../constants/colors.dart';
import '../../models/user.dart';
import '../../ui/profile_info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _onEditProfile(BuildContext context) {
    // TODO: Implémenter la logique de modification de profil
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Modifier le profil - fonctionnalité à implémenter")),
    );
  }

  void _onLogout(BuildContext context) {
    // TODO: Implémenter la logique de déconnexion
     Navigator.pushReplacement(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen())
            );
  }

  @override
  Widget build(BuildContext context) {
    // Utilisateur fictif local (professeur)
    final user = UserModel(
      id: '1',
      firstName: 'Armand',
      lastName: 'Ngom',
      role: UserRole.teacher,
      email: 'armand.ngom@ecole.com',
      department: 'Informatique',
      createdAt: DateTime(2022, 9, 15),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Mon Profil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CircleAvatar(
                radius: 45,
                backgroundColor: AppColors.secondary.withOpacity(0.1),
                child: const Icon(Icons.person, size: 45, color: AppColors.secondary),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                user.fullName,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                user.email,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),

            ProfileInfoCard(
              icon: Icons.work,
              title: "Informations Professionnelles",
              infos: [
                InfoItem(label: "Rôle", value: "Enseignant"),
                InfoItem(label: "Département", value: user.department ?? "Non spécifié"),
              ],
            ),

            const SizedBox(height: 30),

            ProfileInfoCard(
              icon: Icons.calendar_today,
              title: "Détails du Compte",
              infos: [
                InfoItem(
                  label: "Compte créé le",
                  value:
                      '${user.createdAt.day.toString().padLeft(2, '0')}/'
                      '${user.createdAt.month.toString().padLeft(2, '0')}/'
                      '${user.createdAt.year}',
                ),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _onEditProfile(context),
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text("Modifier le profil", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _onLogout(context),
                    icon: const Icon(Icons.logout, color: AppColors.secondary),
                    label: const Text("Déconnexion", style: TextStyle(color: AppColors.secondary)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: AppColors.secondary, width: 0.1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
