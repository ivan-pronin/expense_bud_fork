import 'package:expense_bud/features/account/presentation/account.dart';
import 'package:expense_bud/features/expense/presentation/expenses.dart';
import 'package:expense_bud/features/history/presentation/history.dart';
import 'package:expense_bud/features/insights/presentation/insights.dart';
import 'package:expense_bud/features/settings/presentation/settings.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppPageState();

  static _AppPageState of(BuildContext context) =>
      context.read<_AppPageState>();
}

class _AppPageState extends State<AppPage> {
  final List<Widget> tabs = const [
    AccountPage(),
    ExpensesPage(),
    HistoryPage(),
    ReportPage(),
  ];

  int _currentIndex = 0;
  void selectTab(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          // select 'main' tab
          selectTab(0);
          // back button handled by app
          return false;
        }
        // let system handle back button if we're on the first route
        return true;
      },
      child: Scaffold(
        body: Provider.value(
          value: this,
          child: IndexedStack(
            index: _currentIndex,
            children: tabs,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 27,
          currentIndex: _currentIndex,
          onTap: selectTab,
          items: _bottomNavigationBarItems
              .map(
                (item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  activeIcon: Icon(item.activeIcon),
                  label: item.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

const _bottomNavigationBarItems = <_Item>[
  _Item(
    'Accounts',
    icon: PhosphorIcons.wallet,
    activeIcon: PhosphorIcons.walletFill,
  ),
  _Item(
    'Transactions',
    icon: PhosphorIcons.plusCircleLight,
    activeIcon: PhosphorIcons.plusCircleFill,
  ),
  _Item(
    'History',
    icon: PhosphorIcons.list,
    activeIcon: PhosphorIcons.listFill,
  ),
  _Item(
    'Report',
    icon: PhosphorIcons.chartBar,
    activeIcon: PhosphorIcons.chartBarFill,
  ),
];

class _Item {
  final String label;
  final IconData icon, activeIcon;
  const _Item(this.label, {required this.icon, required this.activeIcon});
}
