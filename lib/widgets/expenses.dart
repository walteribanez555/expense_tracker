import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
        category: Category.work,
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now()),
    Expense(
        category: Category.leisure,
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now())
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Gastos Propios"),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.white60,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 20),
          backgroundColor: const Color.fromARGB(255, 174, 27, 16),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
          ]),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text('The chart'),
          const SizedBox(
            height: 30,
          ),
          Expanded(child: ExpensesList(expenses: _registerExpenses))
        ],
      ),
    );
  }
}
