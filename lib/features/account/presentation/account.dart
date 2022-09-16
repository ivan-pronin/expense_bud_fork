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
import 'package:expense_bud/features/settings/presentation/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() => context.read<ExpenseProvider>().getEntries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  getAppBar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      backgroundColor: AppColors.kPrimary,
      title: const Text('My super app!'),
    );
  }

  getBody() {
    return const Center(
      child: Text(
        'This is the home page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
