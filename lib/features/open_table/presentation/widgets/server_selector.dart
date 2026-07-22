import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServerSelector extends StatelessWidget {
  const ServerSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final servers = ['Mike', 'Sarah', 'Leo', 'Elena'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(servers.length, (index) {
        final isSelected = servers[index] == 'Mike'; // Mock selected state
        return _ServerAvatar(
          name: servers[index],
          isSelected: isSelected,
        );
      }),
    );
  }
}

class _ServerAvatar extends StatelessWidget {
  final String name;
  final bool isSelected;

  const _ServerAvatar({required this.name, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isSelected ? theme.colorScheme.primary : Colors.transparent,
                width: 2.w,
              ),
              image: const DecorationImage(
                // Replace with actual network/asset images
                image: NetworkImage('https://via.placeholder.com/150'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            name,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}