import 'package:verona_colledge/models/section_model.dart';

import '../../../models/midterm_model.dart';

abstract class ExamsStates {}

class ExamsInitialStates extends ExamsStates{}
//class SectionChangeItemState extends AppStates{}

/////////////get lectures////
class GetExamsDataSuccessState extends ExamsStates{
  ExamModel? examModel;
  GetExamsDataSuccessState(this.examModel);
}
class GetExamsDataErrorState extends ExamsStates{}


