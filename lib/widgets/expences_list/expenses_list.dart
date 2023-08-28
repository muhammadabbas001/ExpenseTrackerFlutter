import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expences_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error,
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expense: expenses[index]),
        );
      },
    );
  }
}