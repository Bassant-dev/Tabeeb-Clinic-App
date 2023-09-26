class Service1Model
{
  String name;
  Service1Model({required this.name});

  factory Service1Model.fromjson(dynamic data) {
    return Service1Model(name: 'laila');
  }
}