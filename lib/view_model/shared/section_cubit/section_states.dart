import 'package:verona_colledge/models/section_model.dart';

abstract class SectionStates {}

class SectionInitialStates extends SectionStates{}
//class SectionChangeItemState extends AppStates{}

/////////////get lectures////
class GetSectionDataSuccessState extends SectionStates{
  SectionModel? sectionModel;
  GetSectionDataSuccessState(this.sectionModel);
}
class GetSectionDataErrorState extends SectionStates{}


