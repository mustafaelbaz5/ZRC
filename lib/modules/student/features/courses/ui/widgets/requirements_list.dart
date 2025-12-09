import 'package:flutter/material.dart';

class RequirementsList extends StatelessWidget {
  const RequirementsList({super.key, required this.requirements});

  final List<String> requirements;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: requirements
          .map(
            (final String req) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Icon(Icons.circle, size: 6, color: Colors.black54),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      req,
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
