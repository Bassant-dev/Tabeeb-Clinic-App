import 'Doctor.dart';
import 'Patient.dart';

class AppointmentData {
  AppointmentData({
      this.id, 
      this.doctor, 
      this.patient, 
      this.appointmentTime, 
      this.appointmentEndTime, 
      this.status, 
      this.notes, 
      this.appointmentPrice,});

  AppointmentData.fromJson(dynamic json) {
    id = json['id'];
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    appointmentTime = json['appointment_time'];
    appointmentEndTime = json['appointment_end_time'];
    status = json['status'];
    notes = json['notes'];
    appointmentPrice = json['appointment_price'];
  }
  num? id;
  Doctor? doctor;
  Patient? patient;
  String? appointmentTime;
  String? appointmentEndTime;
  String? status;
  String? notes;
  num? appointmentPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (doctor != null) {
      map['doctor'] = doctor?.toJson();
    }
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
    map['appointment_time'] = appointmentTime;
    map['appointment_end_time'] = appointmentEndTime;
    map['status'] = status;
    map['notes'] = notes;
    map['appointment_price'] = appointmentPrice;
    return map;
  }

}