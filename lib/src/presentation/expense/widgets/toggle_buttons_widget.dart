import 'package:flutter/material.dart';

import '../../../core/enum/transaction.dart';
import '../../widgets/paisa_chip.dart';

class TransactionToggleButtons extends StatefulWidget {
  const TransactionToggleButtons({
    Key? key,
    required this.onSelected,
    required this.selectedType,
  }) : super(key: key);

  final Function(TransactionType) onSelected;
  final TransactionType selectedType;
  @override
  TransactionToggleButtonsState createState() =>
      TransactionToggleButtonsState();
}

class TransactionToggleButtonsState extends State<TransactionToggleButtons> {
  late TransactionType selectedType = widget.selectedType;

  @override
  void initState() {
    super.initState();
    widget.onSelected(selectedType);
  }

  void _update(TransactionType type) {
    selectedType = type;
    setState(() {});
    widget.onSelected(type);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: TransactionType.values.map((type) {
          final isSelected = selectedType == type;
          return PaisaMaterialYouChip(
            title: type.name(context),
            isSelected: isSelected,
            onPressed: () => _update(type),
          );
        }).toList(),
      ),
    );
  }
}
