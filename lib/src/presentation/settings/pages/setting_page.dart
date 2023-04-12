import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moneyApp/src/app/routes.dart';
import '../../../data/settings/authenticate.dart';
import '../../widgets/future_resolve.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/common.dart';
import '../../../core/enum/box_types.dart';
import '../../../service_locator.dart';
import '../widgets/biometrics_auth_widget.dart';
import '../widgets/currency_change_widget.dart';
import '../widgets/setting_option.dart';
import '../widgets/settings_color_picker_widget.dart';
import '../widgets/settings_group_card.dart';
import '../widgets/version_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.materialYouAppBar(
        context.loc.settingsLabel,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SettingsGroup(
            title: context.loc.colorsLabel,
            options: [
              SettingsColorPickerWidget(
                settings: locator.get(
                  instanceName: BoxType.settings.name,
                ),
              ),
            ],
          ),
          SettingsGroup(
            title: context.loc.othersLabel,
            options: [
              const CurrencyChangeWidget(),
              const Divider(),
              FutureResolve<Authenticate>(
                future: locator.getAsync<Authenticate>(),
                builder: (value) => FutureResolve<bool>(
                  future: value.auth.isDeviceSupported(),
                  builder: (supported) {
                    return Visibility(
                      visible: supported,
                      child: Column(
                        children: [
                          BiometricAuthWidget(
                            authenticate: locator.get<Authenticate>(),
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SettingsOption(
                title: context.loc.backupAndRestoreLabel,
                subtitle: context.loc.backupAndRestoreDescLabel,
                onTap: () {
                  // ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                  //   SnackBar(
                  //     content: Text(
                  //       'Disabled',
                  //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  //             color: Theme.of(context)
                  //                 .colorScheme
                  //                 .onPrimaryContainer,
                  //           ),
                  //     ),
                  //     backgroundColor:
                  //         Theme.of(context).colorScheme.primaryContainer,
                  //     elevation: 6,
                  //     behavior: SnackBarBehavior.floating,
                  //   ),
                  // );
                  GoRouter.of(context).pushNamed(exportAndImport);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
