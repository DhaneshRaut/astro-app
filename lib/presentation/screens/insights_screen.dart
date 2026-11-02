import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:astrologer_app/presentation/insights_cubit/insights_cubit.dart';
import 'package:astrologer_app/presentation/insights_cubit/insights_state.dart';
import 'package:astrologer_app/presentation/widgets/common/insight_widget.dart';
import 'package:astrologer_app/presentation/widgets/common/luck_number_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InsightsCubit()..loadInsightsData(),
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        body: BlocBuilder<InsightsCubit, InsightsState>(
          builder: (context, state) {
            if (state is! InsightsLoaded) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.accentTeal),
              );
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InsightWidget.buildNatalChartSection(state, context),

                  SizedBox(height: 10),
                  InsightWidget.buildCenterLayout(),

                  InsightWidget.buildSectionHeader("ASTROLOGY"),
                  InsightWidget.buildFocusCardNew(state.focusOfTheDay),

                  InsightWidget.buildHoroscopeNarrativeCard(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InsightWidget.buildMetricCard(
                            "Favorable Direction",
                            "assets/png/direction.png",

                            AppColors.deepBlueTeal,
                            "North",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: InsightWidget.buildMetricCard(
                            "Lucky Color",
                            "assets/png/lucky_color.png",

                            AppColors.pink,
                            "Pink",
                          ),
                        ),
                      ],
                    ),
                  ),

                  InsightWidget.buildFunFactsBanner(),

                  InsightWidget.buildSectionHeader("NUMEROLOGY"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CustomWidgets.numerologyCard(
                      "Stay open to unexpected opportunities. Trust your instincts, explore something new, and avoid overthinking your next move.",
                    ),
                  ),

                  InsightWidget.buildDestinyPathwayCardNew(state.destinyNumber),

                  const SizedBox(height: 60),
                ],
              ),
            );
          },
        ),
      ),
    );
  }





}
