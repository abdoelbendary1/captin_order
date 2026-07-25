// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/constants/app_strings.dart';

// class ZoneSelector extends StatelessWidget {
//   const ZoneSelector({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Wrap in BlocBuilder to listen to selected state
//     return Row(
//       children: [
//         Expanded(
//           child: _ZoneCard(
//             title: AppStrings.zoneBar,
//             icon: Icons.local_bar,
//             isSelected: false,
//           ),
//         ),
//         SizedBox(width: 12.w),
//         Expanded(
//           child: _ZoneCard(
//             title: AppStrings.zoneDining,
//             icon: Icons.restaurant,
//             isSelected: true,
//           ),
//         ),
//         SizedBox(width: 12.w),
//         Expanded(
//           child: _ZoneCard(
//             title: AppStrings.zoneTerrace,
//             icon: Icons.deck,
//             isSelected: false,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _ZoneCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final bool isSelected;

//   const _ZoneCard({
//     required this.title,
//     required this.icon,
//     required this.isSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return InkWell(
//       onTap: () {},
//       borderRadius: BorderRadius.circular(8.r),
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 16.h),
//         decoration: BoxDecoration(
//           color: isSelected
//               ? colorScheme.surfaceContainerHighest
//               : colorScheme.surface,
//           borderRadius: BorderRadius.circular(8.r),
//           border: Border.all(
//             color: isSelected
//                 ? colorScheme.outline
//                 : colorScheme.outlineVariant,
//           ),
//         ),
//         child: Column(
//           children: [
//             Icon(icon, color: colorScheme.onSurface, size: 24.r),
//             SizedBox(height: 8.h),
//             Text(
//               title,
//               style: theme.textTheme.labelMedium?.copyWith(
//                 color: colorScheme.onSurface,
//                 fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
