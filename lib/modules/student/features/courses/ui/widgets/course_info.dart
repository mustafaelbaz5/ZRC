import 'package:flutter/material.dart';

class CourseInfo extends StatelessWidget {
  const CourseInfo({
    super.key,
    required this.instructor,
    required this.duration,
    required this.lessons,
    required this.level,
    required this.rating,
    required this.students,
  });

  final String instructor;
  final String duration;
  final String lessons;
  final String level;
  final double rating;
  final String students;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: [
        _MetaChip(icon: Icons.person_outline, label: instructor),
        _MetaChip(icon: Icons.schedule_outlined, label: duration),
        _MetaChip(icon: Icons.play_circle_outline, label: lessons),
        _MetaChip(icon: Icons.signal_cellular_alt, label: level),
      ],
    );
  }


}
class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey[700]),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}