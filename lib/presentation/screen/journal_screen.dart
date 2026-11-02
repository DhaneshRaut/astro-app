import 'package:astrologer_app/core/constants/app_colors_constants.dart';
import 'package:astrologer_app/presentation/journal_cubit/journal_cubit.dart';
import 'package:astrologer_app/presentation/journal_cubit/journal_state.dart';
import 'package:astrologer_app/presentation/screen/widgets/resusable_widget.dart';
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
        backgroundColor: const Color(
          0xFFFAFBFD,
        ), // Light ambient cream/white layout background
        body: BlocBuilder<JournalCubit, JournalState>(
          builder: (context, state) {
            if (state is! JournalLoaded) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.accentTeal),
              );
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Header & Book Display Area with Linear Soft Ambient Blend
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFE8F3F5), Color(0xFFFAFBFD)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.only(top: 50, bottom: 20),
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
                                  color: Color(0xFF021B22),
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'A Space To Be You',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: SvgPicture.asset(
                            'assets/svg/book.svg',
                            width: MediaQuery.of(context).size.width,
                            height:  MediaQuery.of(context).size.width,
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                          ),
                        ), // Centered Book Render Wireframe
                        // Centered Book Render Wireframe
                      ],
                    ),
                  ),

                  // 2. Month Selector Horizontal Axis Scroller
                  SizedBox(
                    height: 35,
                    child: ListView.builder(
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
                                ? const Color(0xFF144750)
                                : const Color(0xFFFEFDF8), //0xFFE7E5DB
                            borderRadius: BorderRadius.circular(20),

                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF0F4D5C)
                                  : const Color(0xFFE7E5DB),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            month,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF000000),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: LuckNumberCard.leftLineWidget()),
                      const SizedBox(width: 4),
                      LuckNumberCard.dot(3, Color(0xFF27828E)),
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
                      LuckNumberCard.dot(3, Color(0xFF27828E)),
                      const SizedBox(width: 4),
                      Expanded(child: LuckNumberCard.RightLineWidget()),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // 3. Section Action Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Entries',
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 18,
                            color: Color(0xFF1D7E90),
                          ),
                          label: const Text(
                            'Add Entry',
                            style: TextStyle(
                              color: Color(0xFF1D7E90),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 4. Vertical Ledger Entry List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    itemCount: state.entries.length,
                    itemBuilder: (context, index) {
                      final entry = state.entries[index];
                      return _buildJournalListItem(entry);
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Master Graphic Implementation wrapper for the detailed Notebook cover presentation

  // Component Builder representing specific item element rows within ledger metrics
  Widget _buildJournalListItem(JournalEntry entry) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF4F4F4), Color(0xFFB8E2E2)],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
        color: const Color(0xFFB8E2E2).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD0E2E5).withOpacity(0.4),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Date Stamp Segment Box Block
          SizedBox(
            width: 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  entry.dayNumber,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF298EA0),
                  ),
                ),
                Text(
                  entry.monthStr,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
                Text(
                  entry.weekdayStr,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF000000),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Vertical Accent Line separator matching interface requirements
          Container(width: 1, height: 75, color: Colors.black12),
          const SizedBox(width: 16),
          // Core Content Context
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
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF021B22),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.black26,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  entry.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
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
                    color: Colors.black38,
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
