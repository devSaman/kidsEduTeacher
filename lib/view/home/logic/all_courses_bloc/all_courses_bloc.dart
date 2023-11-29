import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/common_models/courses_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';

part 'all_courses_event.dart';
part 'all_courses_state.dart';

class AllCoursesBloc extends Bloc<AllCoursesEvent, AllCoursesState> {
  AllCoursesBloc() : super(AllCoursesInitial()) {
    on<AllCoursesDataEvent>(allCourses);
  }

  Future<void> allCourses(
      AllCoursesDataEvent event, Emitter<AllCoursesState> emit) async {
    emit(AllCoursesInitial());
    final response = await MainRepository.allCourses();
    if (response is CoursesModel) {
      emit(AllCoursesSuccess(courseData: response));
    } else if (response is ErrorModel) {
      emit(AllCoursesFail(errorModel: response));
    }
  }
}
