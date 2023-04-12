import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/routes.dart';
import '../../../core/common.dart';
import '../../../data/accounts/model/account.dart';
import '../../../data/category/model/category.dart';
import '../../../data/expense/model/expense.dart';

class ExpenseItemWidget extends StatelessWidget {
  const ExpenseItemWidget({
    Key? key,
    required this.expense,
    required this.account,
    required this.category,
  }) : super(key: key);

  final Account account;
  final Expense expense;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => context.goNamed(
          editExpensePath,
          params: <String, String>{'eid': expense.superId.toString()},
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor:
                Color(category.color ?? Colors.amber.shade100.value)
                    .withOpacity(0.25),
            child: Icon(
              IconData(
                category.icon,
                fontFamily: 'Material Design Icons',
                fontPackage: 'material_design_icons_flutter',
              ),
              color: Color(category.color ?? Colors.amber.shade100.value),
            ),
          ),
          title: Text(expense.name),
          subtitle: Text(
            '${account.bankName} • ${expense.time.shortDayString}',
          ),
          trailing: Text(
            '${expense.type?.sign}${expense.currency.toCurrency()}',
            style: GoogleFonts.manrope(
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: expense.type?.color(context),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
