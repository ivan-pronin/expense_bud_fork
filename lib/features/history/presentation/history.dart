import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:expense_bud/config/constants.dart';
import 'package:expense_bud/config/theme.dart';
import 'package:expense_bud/core/utils/extensions.dart';
import 'package:expense_bud/core/widgets/gap.dart';
import 'package:expense_bud/features/expense/presentation/add_entry.dart';
import 'package:expense_bud/features/expense/presentation/expense_tab.dart';
import 'package:expense_bud/features/expense/presentation/provider/expense_provider.dart';
import 'package:expense_bud/features/settings/domain/entities/user_preference.dart';
import 'package:expense_bud/features/settings/presentation/providers/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() => context.read<ExpenseProvider>().getEntries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            expandedHeight: 220,
            backgroundColor: AppColors.kPrimary,
            actions: [
              IconButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => const AddEntryPage(),
                  );
                },
                icon: const Icon(
                  PhosphorIcons.plusFill,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              // const ExpenseTab(),
            ],
          )),
        ],
      ),
    );
  }
}

