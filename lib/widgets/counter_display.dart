
import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  final int counter;

  const CounterDisplay({
    super.key,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1D20),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFF35363A),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                color: Color(0xFFE89A55),
                size: 17,
              ),
              SizedBox(width: 9),
              Text(
                'CURRENT VALUE',
                style: TextStyle(
                  color: Color(0xFF999BA0),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              Spacer(),
              Text(
                '01 / 01',
                style: TextStyle(
                  color: Color(0xFF65676C),
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: Tween<double>(
                    begin: 0.85,
                    end: 1,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: Text(
              '$counter',
              key: ValueKey<int>(counter),
              style: const TextStyle(
                fontSize: 88,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1,
                letterSpacing: -5,
              ),
            ),
          ),

          const SizedBox(height: 25),

          Container(
            width: 48,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFE89A55),
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          const SizedBox(height: 16),

          Text(
            counter == 0
                ? 'Belum ada perubahan'
                : 'Perubahan berhasil tercatat',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF92949A),
            ),
          ),
        ],
      ),
    );
  }
}
