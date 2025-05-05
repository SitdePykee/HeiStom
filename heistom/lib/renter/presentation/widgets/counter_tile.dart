import 'package:flutter/material.dart';

class CounterTile extends StatelessWidget {
  final String label;
  final int value;
  final ValueChanged<int>
      onChanged; // Thay đổi phương thức từ VoidCallback thành ValueChanged<int>
  final IconData icon;

  const CounterTile({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xff0090FF)),
          const SizedBox(width: 30),
          DropdownButton<int>(
            value: value,
            onChanged: (newValue) {
              if (newValue != null) {
                onChanged(newValue);
              }
            },
            items: List.generate(
              10,
              (index) => DropdownMenuItem<int>(
                value: index + 1,
                child: Text('${index + 1}'),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(label),
        ],
      ),
    );
  }
}
