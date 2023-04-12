import 'package:flutter/material.dart';

import '../../../data/accounts/data_sources/account_local_data_source.dart';
import '../../../data/category/data_sources/category_local_data_source.dart';
import '../../../data/expense/model/expense.dart';
import 'expense_item_widget.dart';

class ExpenseListWidget extends StatelessWidget {
  const ExpenseListWidget({
    Key? key,
    required this.expenses,
    required this.categoryLocalDataSource,
    required this.accountLocalDataSource,
  }) : super(key: key);

  final List<Expense> expenses;
  final LocalAccountManagerDataSource accountLocalDataSource;
  final LocalCategoryManagerDataSource categoryLocalDataSource;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: expenses.length,
      itemBuilder: (_, index) {
        final expense = expenses[index];
        final account = accountLocalDataSource.fetchAccount(expense.accountId);
        final category =
            categoryLocalDataSource.fetchCategory(expense.categoryId);
        return ExpenseItemWidget(
          expense: expense,
          account: account,
          category: category,
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(indent: 52, height: 0),
    );
  }
}
