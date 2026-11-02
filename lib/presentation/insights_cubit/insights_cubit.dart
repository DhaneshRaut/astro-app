import 'package:flutter_bloc/flutter_bloc.dart';
import 'insights_state.dart';

class InsightsCubit extends Cubit<InsightsState> {
  InsightsCubit() : super(InsightsInitial());

  void loadInsightsData() {
    emit(InsightsLoaded(
      userName: "Gilli Gaurav Singh",
      birthday: "Sept 23, 2001",
      sunSign: "Cancer",
      moonSign: "Leo",
      ascendantSign: "Leo",
      focusOfTheDay: "Career",
      luckyNumber: 5,
      destinyNumber: 7,
    ));
  }
}
