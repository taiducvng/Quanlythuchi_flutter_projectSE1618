import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../../../core/common.dart';
import '../../../data/category/model/category.dart';
import '../../../data/expense/model/expense.dart';
import '../../widgets/widget_card.dart';

class BudgetItemTableWidget extends StatelessWidget {
  const BudgetItemTableWidget({
    Key? key,
    required this.category,
    required this.expenses,
  }) : super(key: key);
  final Category category;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return PaisaCard(
      child: InkWell(
        onTap: () => context.goNamed(addCategoryPath, extra: category),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                IconData(
                  category.icon,
                  fontFamily: 'Material Design Icons',
                  fontPackage: 'material_design_icons_flutter',
                ),
                color: Theme.of(context).colorScheme.secondary,
                size: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Sparkline(
                  data: expenses.map((e) => e.currency).toList(),
                  useCubicSmoothing: true,
                  cubicSmoothingFactor: 0.2,
                  lineWidth: 4,
                  lineColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                expenses.total.toCurrency(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
