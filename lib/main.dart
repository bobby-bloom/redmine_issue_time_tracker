import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ritt/app/ui/pages/issues.dart';
import 'package:ritt/app/ui/pages/settings.dart';
import 'package:ritt/app/ui/pages/timers.dart';
import 'package:ritt/app/providers/shared_preferences.dart';
import 'package:ritt/app/theme/theme_extensions.dart';
import 'package:shadcn_flutter/shadcn_flutter_experimental.dart' as shadcn;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windows_single_instance/windows_single_instance.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await WindowsSingleInstance.ensureSingleInstance(
    args,
    "ritt-app",
    onSecondWindow: (args) {},
  );

  final sharedPrefs = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    retry: (retryCount, error) => null,
    overrides: [sharedPreferencesProvider.overrideWithValue(sharedPrefs)],
  );

  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return shadcn.ShadcnApp(
      title: 'redmine issue time tracker',
      home: const MainPage(),
    );
  }
}

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabCtl = useTabController(initialLength: 3);
    useListenable(tabCtl);

    return Scaffold(
      body: Padding(
        padding: context.paddingMD,
        child: Column(
          spacing: context.paddingSM.left,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Card(
                  color: context.colorScheme.primary,
                  margin: EdgeInsets.all(0),
                  child: Padding(
                    padding: context.paddingMD,
                    child: Text(
                      'redmine issue time tracker',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: context.colorScheme.surfaceContainerLow,
                  child: Center(
                    heightFactor: 1.65,
                    child: shadcn.Tabs(
                      onChanged: (idx) => tabCtl.animateTo(idx),
                      index: tabCtl.index,
                      children: const [
                        shadcn.TabItem(child: Text('Settings')),
                        shadcn.TabItem(child: Text('Timers')),
                        shadcn.TabItem(child: Text('Issues')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.paddingXS.top),
            Expanded(
              child: Card(
                color: context.colorScheme.surfaceBright,
                margin: const EdgeInsets.all(0),
                child: TabBarView(
                  controller: tabCtl,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: context.paddingMD,
                          child: const UserCard(),
                        ),
                        const SettingsPage(),
                      ],
                    ),
                    const TimersPage(),
                    const IssuesPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
