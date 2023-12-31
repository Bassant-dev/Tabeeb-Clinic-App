part of 'doctor_details_cubit.dart';

@immutable
abstract class DoctorDetailsState {}

class DoctorDetailsInitial extends DoctorDetailsState {}
class DoctorDetailsShowSuccess extends DoctorDetailsState {}
class DoctorDetailsShowFailure extends DoctorDetailsState {}
class DateTimeChangedSuccess extends DoctorDetailsState {}
class TimeChangedSuccess extends DoctorDetailsState {}
class BookedSuccessfully extends DoctorDetailsState {}
class BookedFailed extends DoctorDetailsState {}
