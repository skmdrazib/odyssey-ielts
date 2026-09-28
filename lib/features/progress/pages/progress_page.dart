import 'package:flutter/material.dart';

import '../data/progress_repository.dart';
import '../models/dashboard_stats.dart';

class ProgressPage
    extends StatefulWidget {

  const ProgressPage({
    super.key,
  });

  @override
  State<ProgressPage>
      createState() =>
          _ProgressPageState();
}

class _ProgressPageState
    extends State<ProgressPage> {

  final repository =
      ProgressRepository();

  @override
  Widget build(
    BuildContext context,
  ) {

    return FutureBuilder<
        DashboardStats>(
      future:
          repository.getStats(),

      builder:
          (context, snapshot) {

        if (!snapshot.hasData) {

          return const Center(
            child:
                CircularProgressIndicator(),
          );
        }

        final stats =
            snapshot.data!;

        return SingleChildScrollView(
          padding:
              const EdgeInsets.all(
            16,
          ),

          child: Column(
            children: [

              _buildCard(
                title:
                    'Quiz Attempts',
                value:
                    stats.attempts
                        .toString(),
                color:
                    Colors.blue,
              ),

              const SizedBox(
                height: 12,
              ),

              _buildCard(
                title:
                    'Highest Score',
                value: stats
                    .highestScore
                    .toString(),
                color:
                    Colors.green,
              ),

              const SizedBox(
                height: 12,
              ),

              _buildCard(
                title:
                    'Average Score',
                value: stats
                    .averageScore
                    .toStringAsFixed(
                        1),
                color:
                    Colors.orange,
              ),

              const SizedBox(
                height: 12,
              ),

              _buildCard(
                title:
                    'Latest Quiz',
                value: stats
                    .latestDate,
                color:
                    Colors.purple,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCard({
    required String title,
    required String value,
    required Color color,
  }) {

    return Card(
      child: ListTile(
        tileColor:
            color.withValues(
          alpha: 0.1,
        ),

        title: Text(title),

        subtitle: Text(
          value,
          style:
              const TextStyle(
            fontSize: 20,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
