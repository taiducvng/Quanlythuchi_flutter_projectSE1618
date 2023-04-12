import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../app/routes.dart';
import '../../../core/common.dart';
import '../../../service_locator.dart';
import '../../widgets/future_resolve.dart';
import '../../widgets/paisa_text_field.dart';
import '../bloc/currency_selector_bloc.dart';
import '../widgets/local_grid_view_widget.dart';

class CurrencySelectorPage extends StatelessWidget {
  const CurrencySelectorPage({
    Key? key,
    this.forceChangeCurrency = false,
  }) : super(key: key);

  final bool forceChangeCurrency;

  @override
  Widget build(BuildContext context) => FutureResolve<CurrencySelectorBloc>(
        future: locator.getAsync<CurrencySelectorBloc>(),
        builder: (splashCubit) {
          splashCubit
              .add(CheckLoginEvent(forceChangeCurrency: forceChangeCurrency));
          return Scaffold(
            appBar: forceChangeCurrency ? AppBar() : null,
            body: SafeArea(
              child: BlocListener(
                bloc: splashCubit,
                listener: (context, state) {
                  if (state is NavigateToHome) {
                    context.push(landingPath);
                  }
                },
                child: Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.language_rounded,
                              size: 72,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(
                            context.loc.selectedCountryLabel,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PaisaTextFormField(
                        hintText: context.loc.searchLabel,
                        controller: TextEditingController(),
                        keyboardType: TextInputType.name,
                        onChanged: (value) =>
                            splashCubit.add(FilterLocaleEvent(value)),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder(
                        bloc: splashCubit,
                        builder: (context, state) {
                          if (state is CountryLocalesState) {
                            final locales = state.locales;
                            return ScreenTypeLayout(
                              mobile: LocaleGridView(
                                locales: locales,
                                onPressed: (locale) =>
                                    splashCubit.selectedLocale = locale,
                                crossAxisCount: 2,
                              ),
                              tablet: LocaleGridView(
                                locales: locales,
                                onPressed: (locale) =>
                                    splashCubit.selectedLocale = locale,
                                crossAxisCount: 3,
                              ),
                              desktop: LocaleGridView(
                                locales: locales,
                                onPressed: (locale) =>
                                    splashCubit.selectedLocale = locale,
                                crossAxisCount: 6,
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                splashCubit.add(SelectedLocaleEvent());
              },
              extendedPadding: const EdgeInsets.symmetric(horizontal: 24),
              label: const Icon(MdiIcons.arrowRight),
              icon: Text(
                context.loc.nextLabel,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
              ),
            ),
          );
        },
      );
}
