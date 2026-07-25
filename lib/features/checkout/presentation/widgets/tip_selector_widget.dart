import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

class TipSelectorWidget extends StatefulWidget {
  final double selectedTipPercentage;
  final double customTipAmount;
  final ValueChanged<double> onTipPercentageSelected;
  final ValueChanged<double> onCustomTipAmountChanged;

  const TipSelectorWidget({
    super.key,
    required this.selectedTipPercentage,
    required this.customTipAmount,
    required this.onTipPercentageSelected,
    required this.onCustomTipAmountChanged,
  });

  @override
  State<TipSelectorWidget> createState() => _TipSelectorWidgetState();
}

class _TipSelectorWidgetState extends State<TipSelectorWidget> {
  final TextEditingController _customController = TextEditingController();
  bool _showCustomInput = false;

  @override
  void initState() {
    super.initState();
    if (widget.selectedTipPercentage == -1.0) {
      _showCustomInput = true;
      if (widget.customTipAmount > 0) {
        _customController.text = widget.customTipAmount.toStringAsFixed(0);
      }
    }
  }

  @override
  void dispose() {
    _customController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.addTip,
            style: textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: colorScheme.onSurfaceVariant,
              fontSize: 11.0,
            ),
          ),
          const SizedBox(height: 12.0),

          // 4 Horizontal Buttons: 15%, 20%, 25%, Custom
          Row(
            children: [
              Expanded(child: _buildTipButton(AppStrings.tip15Percent, 0.15)),
              const SizedBox(width: 8.0),
              Expanded(child: _buildTipButton(AppStrings.tip20Percent, 0.20)),
              const SizedBox(width: 8.0),
              Expanded(child: _buildTipButton(AppStrings.tip25Percent, 0.25)),
              const SizedBox(width: 8.0),
              Expanded(child: _buildCustomButton()),
            ],
          ),

          if (_showCustomInput) ...[
            const SizedBox(height: 12.0),
            TextField(
              controller: _customController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: AppStrings.customTipLabel,
                hintText: AppStrings.customTipHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
              ),
              onChanged: (val) {
                final amount = double.tryParse(val) ?? 0.0;
                widget.onCustomTipAmountChanged(amount);
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTipButton(String label, double percentage) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isSelected = !_showCustomInput && widget.selectedTipPercentage == percentage;

    return GestureDetector(
      onTap: () {
        setState(() {
          _showCustomInput = false;
        });
        widget.onTipPercentageSelected(percentage);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected ? theme.primaryColor : colorScheme.outlineVariant,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isSelected = _showCustomInput || widget.selectedTipPercentage == -1.0;

    return GestureDetector(
      onTap: () {
        setState(() {
          _showCustomInput = true;
        });
        final amount = double.tryParse(_customController.text) ?? 0.0;
        widget.onCustomTipAmountChanged(amount);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected ? theme.primaryColor : colorScheme.outlineVariant,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Center(
          child: Text(
            AppStrings.tipCustom,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
