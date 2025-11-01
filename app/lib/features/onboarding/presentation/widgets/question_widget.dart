import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';

class QuestionWidget extends StatefulWidget {
  final String question;
  final List<String> options;
  final String? selectedOption;
  final Function(String) onOptionSelected;
  final VoidCallback? onPrevious;
  final double progress;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
    this.onPrevious,
    required this.progress,
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress bar and back button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (widget.onPrevious != null)
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: widget.onPrevious,
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowLeft01,
                    color: CupertinoColors.label,
                    size: 24,
                  ),
                ),
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey5,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: widget.progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGreen,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        // Question
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  widget.question,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.label,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 32),
                
                // Options
                ...widget.options.map((option) {
                  final isSelected = widget.selectedOption == option;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => widget.onOptionSelected(option),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? CupertinoColors.systemGreen.withOpacity(0.1)
                              : CupertinoColors.systemBackground,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? CupertinoColors.systemGreen
                                : CupertinoColors.separator,
                            width: isSelected ? 2 : 0.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? CupertinoColors.systemGreen
                                    : CupertinoColors.systemGrey5,
                              ),
                              child: isSelected
                                  ? HugeIcon(
                                      icon: HugeIcons.strokeRoundedCheckmarkCircle01,
                                      size: 16,
                                      color: CupertinoColors.white,
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                option,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                  color: CupertinoColors.label,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

