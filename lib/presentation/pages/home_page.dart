import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/health_cubit.dart';
import '../../logic/cubits/health_state.dart';
import '../widgets/score_card.dart';
import '../../core/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Jendi Health'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomButton(
              text: 'Enable Sensors',
              onPressed: () => context.read<HealthCubit>().enableSensors(),
            ),
            CustomButton(
              text: 'Get Scores',
              onPressed: () => context.read<HealthCubit>().getScores(),
            ),
            CustomButton(
              text: 'Load Mock Data',
              onPressed: () {
                context.read<HealthCubit>().loadMockData();
              },
            ),
            Expanded(
              child: BlocBuilder<HealthCubit, HealthState>(
                builder: (context, state) {
                  if (state is HealthScoresLoaded) {
                    return ListView.builder(
                      itemCount: state.scores.length,
                      itemBuilder: (context, index) {
                        return ScoreCard(score: state.scores[index]);
                      },
                    );
                  } else if (state is HealthError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return const Center(child: Text('No scores available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
