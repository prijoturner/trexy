import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_text_styles.dart';
import '../../services/google_auth_service.dart';
import '../../../injection_container.dart' as di;

class ProfilePage extends StatefulWidget {
  final VoidCallback? onAuthStateChanged;

  const ProfilePage({super.key, this.onAuthStateChanged});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool pushNotifications = true;
  bool allowTransaction = true;
  late final GoogleAuthService _googleAuthService;

  @override
  void initState() {
    super.initState();
    _googleAuthService = di.sl<GoogleAuthService>();
  }

  Future<void> _handleSignOut() async {
    final result = await _googleAuthService.signOut();
    result.fold(
      (error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Failed to sign out')));
      },
      (_) {
        // Notify parent to rebuild
        widget.onAuthStateChanged?.call();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = _googleAuthService.currentUser;
    final displayName = user?.displayName ?? 'User';
    final email = user?.email ?? 'No email';
    final photoURL = user?.photoURL;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'Profile',
          style: AppTextStyles.semiBold(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(FluentIcons.edit_24_regular, color: Colors.white),
            onPressed: () {
              // Handle edit profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Profile Avatar
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.textSecondary,
                  image: photoURL != null
                      ? DecorationImage(
                          image: NetworkImage(photoURL),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: photoURL == null
                    ? const Icon(
                        FluentIcons.person_24_filled,
                        size: 60,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            // Name
            Text(
              displayName,
              style: AppTextStyles.bold(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 8),
            // Email
            Text(
              email,
              style: AppTextStyles.regular(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            // General Settings Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'General settings',
                        style: AppTextStyles.bold(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    _buildSettingItem(
                      title: 'Language',
                      trailing: 'English',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildSettingItem(
                      title: 'Theme',
                      trailing: 'Dark',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildSwitchItem(
                      title: 'Push notifications',
                      value: pushNotifications,
                      onChanged: (value) {
                        setState(() {
                          pushNotifications = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Card Settings Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Card settings',
                        style: AppTextStyles.bold(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    _buildSettingItem(title: 'Change your pin', onTap: () {}),
                    _buildDivider(),
                    _buildSettingItem(title: 'Replace your card', onTap: () {}),
                    _buildDivider(),
                    _buildSwitchItem(
                      title: 'Allow transaction',
                      value: allowTransaction,
                      onChanged: (value) {
                        setState(() {
                          allowTransaction = value;
                        });
                      },
                    ),
                    _buildDivider(),
                    _buildSettingItem(
                      title: 'Replace your card',
                      onTap: () {},
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Sign Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: _handleSignOut,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.onBackground,
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: AppColors.surface, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    'Sign Out',
                    style: AppTextStyles.semiBold(
                      fontSize: 16,
                      color: AppColors.onBackground,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    String? trailing,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 16, 20, isLast ? 20 : 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.regular(fontSize: 16, color: Colors.white),
            ),
            Row(
              children: [
                if (trailing != null) ...[
                  Text(
                    trailing,
                    style: AppTextStyles.regular(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                Icon(
                  FluentIcons.chevron_right_24_regular,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchItem({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.regular(fontSize: 16, color: Colors.white),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.primary,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(color: AppColors.surfaceVariant, height: 1, thickness: 1),
    );
  }
}
