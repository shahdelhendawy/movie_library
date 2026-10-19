import 'package:flutter/material.dart';

import 'movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final int fans;
  final bool isFavorite;
  final bool isBookmarked;
  final bool isList;
  final VoidCallback onFavoriteTap;
  final VoidCallback onBookmarkTap;
  final VoidCallback onFansTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.fans,
    required this.isFavorite,
    required this.isBookmarked,
    this.isList = false,
    required this.onFavoriteTap,
    required this.onBookmarkTap,
    required this.onFansTap,
  });

  static const List<Color> _pastelColors = [
    Color(0xFFD6E9FA),
    Color(0xFFCDECE5),
    Color(0xFFE3D8F5),
    Color(0xFFF6D5E2),
    Color(0xFFF6E3C5),
    Color(0xFFD9DFF7),
    Color(0xFFD4E9D1),
    Color(0xFFF3D9CD),
    Color(0xFFCBE7F2),
    Color(0xFFE8D8EC),
    Color(0xFFE7E6C5),
    Color(0xFFF2D5D0),
  ];

  static const List<Color> _frameColors = [
    Color(0xFF5798C8),
    Color(0xFF398D7E),
    Color(0xFF8970B7),
    Color(0xFFC65F87),
    Color(0xFFC28A43),
    Color(0xFF6579C2),
    Color(0xFF679A62),
    Color(0xFFBA795E),
    Color(0xFF438CA5),
    Color(0xFF9A6DA6),
    Color(0xFF929447),
    Color(0xFFBB6D68),
  ];

  int get _colorIndex {
    switch (movie.title) {
      case 'Gumball':
        return 0;
      case 'We Bare Bears':
        return 1;
      case 'Powerpuff Girls':
        return 2;
      case 'Teen Titans Go!':
        return 3;
      case 'Scooby-Doo':
        return 4;
      case 'Clarence':
        return 5;
      case 'Ben 10':
        return 6;
      case 'Uncle Grandpa':
        return 7;
      case 'Regular Show':
        return 8;
      case 'Adventure Time':
        return 9;
      case 'Angelo Rules':
        return 10;
      case 'Tom and Jerry':
        return 11;
      default:
        return 0;
    }
  }

  Color get cardColor => _pastelColors[_colorIndex];

  Color get frameColor => _frameColors[_colorIndex];

  @override
  Widget build(BuildContext context) {
    return isList ? _listCard() : _gridCard();
  }

  Widget _poster() {
    return Container(
      decoration: BoxDecoration(
        color: frameColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.8),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: frameColor.withValues(alpha: 0.4),
            blurRadius: 9,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.55),
            blurRadius: 3,
            spreadRadius: -1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              movie.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const ColoredBox(
                color: Color(0xFFE0F4FF),
                child: Icon(Icons.broken_image, size: 36),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: _badge(
                Icons.star_rounded,
                movie.rating.toStringAsFixed(1),
                const Color(0xFF24324B),
                iconColor: const Color(0xFFFFD166),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: _badge(
                Icons.calendar_month_rounded,
                '${movie.year}',
                const Color(0xFF087EA4),
              ),
            ),
            Positioned(
              top: 3,
              right: 3,
              child: Material(
                color: const Color(0xFF24324B).withValues(alpha: 0.78),
                shape: const CircleBorder(),
                child: IconButton(
                  tooltip: isBookmarked ? 'Remove bookmark' : 'Bookmark',
                  onPressed: onBookmarkTap,
                  icon: Icon(
                    isBookmarked
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    color: isBookmarked
                        ? const Color(0xFFFFD166)
                        : Colors.white,
                  ),
                  iconSize: 22,
                  constraints: const BoxConstraints(
                    minWidth: 38,
                    minHeight: 38,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(
    IconData icon,
    String label,
    Color background, {
    Color iconColor = Colors.white,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 15),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _details({bool compact = false}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, cardColor],
        ),
      ),
      padding: EdgeInsets.all(compact ? 10 : 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: compact ? 16 : 13,
              height: 1.15,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF24324B),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: frameColor.withValues(alpha: 0.22)),
            ),
            child: Text(
              movie.genre,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: frameColor,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: Text(
              movie.description,
              maxLines: compact ? 4 : 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: compact ? 12 : 11,
                height: 1.3,
                color: const Color(0xFF526174),
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: onFavoriteTap,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: isFavorite
                        ? const Color(0xFFE85D8E)
                        : const Color(0xFF64748B),
                    size: 21,
                  ),
                ),
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Text(
                  '$fans fans',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: onFansTap,
                borderRadius: BorderRadius.circular(20),
                child: const Padding(
                  padding: EdgeInsets.all(3),
                  child: Icon(
                    Icons.add_circle_rounded,
                    color: Color(0xFF00AEEF),
                    size: 21,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _gridCard() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shadowColor: frameColor.withValues(alpha: 0.2),
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: frameColor.withValues(alpha: 0.55), width: 1.3),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: _poster(),
            ),
          ),
          Expanded(flex: 5, child: _details()),
        ],
      ),
    );
  }

  Widget _listCard() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shadowColor: frameColor.withValues(alpha: 0.2),
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
        side: BorderSide(color: frameColor.withValues(alpha: 0.55), width: 1.3),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 125,
            height: double.infinity,
            child: Padding(padding: const EdgeInsets.all(5), child: _poster()),
          ),
          Expanded(child: _details(compact: true)),
        ],
      ),
    );
  }
}
