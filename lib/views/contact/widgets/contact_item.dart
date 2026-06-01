import 'package:ahmed_abdelfattah/utils/hover_extensions.dart';
import 'package:ahmed_abdelfattah/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconSize = context.responsive<double>(
      mobile: 22,
      tablet: 24,
      desktop: 28,
    );
    final fontSize = context.responsive<double>(
      mobile: 14,
      tablet: 16,
      desktop: 18,
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: HoverScaleWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: iconSize, color: theme.colorScheme.primary),
              const SizedBox(width: 14),
              Flexible(
                child: Text(
                  label,
                  style: GoogleFonts.roboto(
                    textStyle: theme.textTheme.headlineSmall,
                    fontSize: fontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  Icons.copy,
                  size: iconSize * 0.7,
                  color: theme.colorScheme.primary,
                ),
                tooltip: 'Copy',
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: label));
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Copied to clipboard'),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
