import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class NetworkPrinterSetupCard extends StatefulWidget {
  final VoidCallback onDiscover;
  final VoidCallback onTestPrint;
  final bool isDiscovering;
  final String currentType;
  final ValueChanged<String> onTypeChanged;

  const NetworkPrinterSetupCard({
    super.key,
    required this.onDiscover,
    required this.onTestPrint,
    this.isDiscovering = false,
    required this.currentType,
    required this.onTypeChanged,
  });

  @override
  State<NetworkPrinterSetupCard> createState() => _NetworkPrinterSetupCardState();
}

class _NetworkPrinterSetupCardState extends State<NetworkPrinterSetupCard> {
  final List<String> _printerTypes = [
    'Cashier (Receipts)',
    'Kitchen (KDS)',
    'Bar / Drinks',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Header
          Row(
            children: [
              Icon(
                Icons.print_outlined,
                size: 18.r,
                color: colorScheme.onSurface,
              ),
              SizedBox(width: 8.w),
              Text(
                AppStrings.networkPrinterSetup,
                style: textTheme.titleMedium?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),

          // Printer Type Label
          Text(
            AppStrings.printerType,
            style: textTheme.labelSmall?.copyWith(
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              fontSize: 10.5.sp,
            ),
          ),
          SizedBox(height: 6.h),

          // Dropdown Container
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _printerTypes.contains(widget.currentType)
                    ? widget.currentType
                    : _printerTypes.first,
                isExpanded: true,
                style: textTheme.bodyMedium?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  color: colorScheme.onSurface,
                  fontSize: 13.sp,
                ),
                icon: Icon(Icons.keyboard_arrow_down_rounded, color: colorScheme.onSurface),
                items: _printerTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) {
                    widget.onTypeChanged(val);
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // 2 Buttons Row
          Row(
            children: [
              // Discover Printer Button
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: ElevatedButton.icon(
                    onPressed: widget.isDiscovering ? null : widget.onDiscover,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    icon: widget.isDiscovering
                        ? SizedBox(
                            width: 16.r,
                            height: 16.r,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.onPrimary,
                            ),
                          )
                        : Icon(Icons.search_rounded, size: 16.r, color: colorScheme.onPrimary),
                    label: Text(
                      AppStrings.discoverPrinter,
                      style: textTheme.labelMedium?.copyWith(
                        fontFamily: 'JetBrains Mono',
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimary,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),

              // Test Print Button
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: OutlinedButton.icon(
                    onPressed: widget.onTestPrint,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: colorScheme.surface,
                      side: BorderSide(
                        color: colorScheme.onSurface,
                        width: 1.2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    icon: Icon(Icons.print_outlined, size: 16.r, color: colorScheme.onSurface),
                    label: Text(
                      AppStrings.testPrint,
                      style: textTheme.labelMedium?.copyWith(
                        fontFamily: 'JetBrains Mono',
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),

          // Status & IP Footer Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8.r,
                    height: 8.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.secondary,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    AppStrings.statusConnected,
                    style: textTheme.labelSmall?.copyWith(
                      fontFamily: 'JetBrains Mono',
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
              Text(
                AppStrings.defaultPrinterIp,
                style: textTheme.labelSmall?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
