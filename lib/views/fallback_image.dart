import 'package:flutter/material.dart';

class FallbackImage extends StatelessWidget {
  const FallbackImage({
    super.key,
    required this.path,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.fallbackIcon = Icons.person,
  });

  final String path;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius borderRadius;
  final IconData fallbackIcon;

  @override
  Widget build(BuildContext context) {
    final image = path.startsWith('assets/')
        ? Image.asset(
            path,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: _buildFallback,
          )
        : Image.network(
            path,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: _buildFallback,
          );

    return ClipRRect(borderRadius: borderRadius, child: image);
  }

  Widget _buildFallback(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    return Container(
      width: width,
      height: height,
      color: const Color(0xFFE1E5EA),
      alignment: Alignment.center,
      child: Icon(
        fallbackIcon,
        color: const Color(0xFF77808A),
        size: height.isFinite ? height * 0.45 : 32,
      ),
    );
  }
}
