import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wealth_lens/features/auth/presentation/bloc/bloc.dart';
import 'package:wealth_lens/features/auth/presentation/bloc/events.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LoggedOut());
            },
          )
        ],
      ),
      body: const Center(
        child: Text('Logged In Successfully'),
      ),
    );
  }
}