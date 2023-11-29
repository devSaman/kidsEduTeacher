part of 'all_courses_bloc.dart';

class AllCoursesState extends Equatable {
  const AllCoursesState();

  @override
  List<Object> get props => [];
}

class AllCoursesInitial extends AllCoursesState {}

class AllCoursesSuccess extends AllCoursesState {
  final CoursesModel courseData;

  const AllCoursesSuccess({required this.courseData});
}

class AllCoursesFail extends AllCoursesState {
  final ErrorModel errorModel;

  const AllCoursesFail({required this.errorModel});
}
