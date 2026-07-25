import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/app_router.dart';
import '../bloc/active_tables_bloc.dart';
import '../bloc/active_tables_event.dart';

class ActiveTablesFab extends StatelessWidget {
  const ActiveTablesFab({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 56.r,
      height: 56.r,
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () async {
            final result = await const OpenTableRoute().push<bool>(context);
            if (result == true && context.mounted) {
              context.read<ActiveTablesBloc>().add(
                const ActiveTablesEvent.refreshTables(),
              );
            }
          },
          child: Center(
            child: Icon(Icons.add, color: colorScheme.onPrimary, size: 28.r),
          ),
        ),
      ),
    );
  }
}
