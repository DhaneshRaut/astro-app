import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:astrologer_app/presentation/journal_cubit/journal_cubit.dart';
import 'package:astrologer_app/presentation/journal_cubit/journal_state.dart';
import 'package:astrologer_app/presentation/widgets/common/luck_number_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JournalCubit()..loadJournalData(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFBFD),
        body: BlocBuilder<JournalCubit, JournalState>(
          builder: (context, state) {
            if (state is! JournalLoaded) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.accentTeal),
              );
            }

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.journalHeaderBlue,
                          AppColors.lightBackground,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.only(top: 60, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Journal',
                                style: TextStyle(
                                  color: AppColors.ink,
                                  fontSize: 26,
                                  fontFamily: "Geist",

                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'A Space To Be You',
                                style: TextStyle(
                                  fontFamily: "Satoshi",

                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        Center(
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: SvgPicture.asset(
                              'assets/svg/book.svg',
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 35,
                    child: ListView.builder(
                      primary: false,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.months.length,
                      itemBuilder: (context, index) {
                        final month = state.months[index];
                        final isSelected = month == state.selectedMonth;
                        return Container(
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.deepTeal
                                : AppColors.journalChip,
                            borderRadius: BorderRadius.circular(20),

                            border: Border.all(
                              color: isSelected
                                  ? AppColors.journalBorder
                                  : AppColors.beigeBorder,
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            month,
                            style: TextStyle(
                              fontFamily: "Geist",

                              color: isSelected
                                  ? AppColors.textWhite
                                  : AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: CustomWidgets.leftLine()),
                      const SizedBox(width: 4),
                      CustomWidgets.dot(3, AppColors.luckyTeal),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          "✦",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      CustomWidgets.dot(3, AppColors.luckyTeal),
                      const SizedBox(width: 4),
                      Expanded(child: CustomWidgets.rightLine()),
                    ],
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 16)),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Entries',
                          style: TextStyle(
                            fontFamily: "Geist",
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 18,
                            color: AppColors.journalTeal,
                          ),
                          label: const Text(
                            'Add Entry',
                            style: TextStyle(
                              fontFamily: "Geist",
                              color: AppColors.journalTeal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  sliver: SliverList.builder(
                    itemCount: state.entries.length,
                    itemBuilder: (context, index) {
                      final entry = state.entries[index];
                      return _buildJournalListItem(entry);
                    },
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 40)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildJournalListItem(JournalEntry entry) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.entryGray, AppColors.entryAqua],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
        color: AppColors.entryAqua.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.entryBorder.withOpacity(0.4),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  entry.dayNumber,
                  style: const TextStyle(
                    fontSize: 30,
                    fontFamily: "Satoshi",

                    fontWeight: FontWeight.bold,
                    color: AppColors.entryDateTeal,
                  ),
                ),
                Text(
                  entry.monthStr,
                  style: TextStyle(
                    fontSize: 20,

                    fontFamily: "Satoshi",

                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  entry.weekdayStr,
                  style: const TextStyle(
                    fontSize: 11,
                    fontFamily: "Satoshi",

                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          Container(width: 1, height: 75, color: AppColors.black12),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        entry.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Satoshi",

                          fontWeight: FontWeight.bold,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: AppColors.black26,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  entry.description,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "Satoshi",

                    color: AppColors.black54,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  entry.timeStr,
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: "Satoshi",

                    color: AppColors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
