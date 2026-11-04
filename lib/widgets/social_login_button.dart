import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

enum SocialProvider { google, microsoft, apple }

/// Outlined button for Single Sign-On (SSO) providers.
class SocialLoginButton extends StatelessWidget {
  final SocialProvider provider;
  final String label;
  final VoidCallback? onPressed;

  const SocialLoginButton({
    super.key,
    required this.provider,
    required this.label,
    this.onPressed,
  });

  Widget _buildProviderIcon() {
    switch (provider) {
      case SocialProvider.google:
        return const _GoogleIcon();
      case SocialProvider.microsoft:
        return const _MicrosoftIcon();
      case SocialProvider.apple:
        return const Icon(
          Icons.apple,
          size: 22,
          color: AppColors.textPrimary,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        backgroundColor: Colors.white,
        side: const BorderSide(color: AppColors.border, width: 1.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildProviderIcon(),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom vector representation for Google brand icon
class _GoogleIcon extends StatelessWidget {
  const _GoogleIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.border, width: 0.8),
      ),
      child: const Text(
        'G',
        style: TextStyle(
          color: Color(0xFF4285F4),
          fontWeight: FontWeight.w900,
          fontSize: 13,
          fontFamily: 'sans-serif',
        ),
      ),
    );
  }
}

/// Custom vector representation for Microsoft brand 4-square icon
class _MicrosoftIcon extends StatelessWidget {
  const _MicrosoftIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _square(const Color(0xFFF25022)),
              const SizedBox(width: 2),
              _square(const Color(0xFF7FBA00)),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _square(const Color(0xFF00A4EF)),
              const SizedBox(width: 2),
              _square(const Color(0xFFFFB900)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _square(Color color) {
    return Container(
      width: 7,
      height: 7,
      color: color,
    );
  }
}
