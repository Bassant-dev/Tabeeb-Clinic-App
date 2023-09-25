class SearchModel{
  final String name;
  final String photo;
  final Specialization specialization;

  SearchModel({required this.name,required this.photo,required this.specialization});
  factory SearchModel.fromJson(dynamic json)
  {
    return SearchModel(name: json['name'], photo: json['photo'],
    specialization: Specialization.fromJson(json['specialization']));
  }
}
class Specialization{
  final String name;

  Specialization({required this.name});
  factory Specialization.fromJson(dynamic json)
  {
    return Specialization(name: json['name']);
  }
}