class StudentModel {
  int? id;
  final String name;
  final String className;
  final String father;
  final String pNumber;
  final String imagex;
 
  StudentModel(
      {this.id,
      required this.name,
      required this.className,
      required this.father,
      required this.pNumber,
      required this.imagex});

  static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final classname = map['classname'] as String;
    final father = map['father'] as String;
    final pnumber = map['pnumber'] as String;
    final imagex = map['imagex'] as String;
    return StudentModel(
        id: id,
        name: name,
        className: classname,
        father: father,
        pNumber: pnumber,
        imagex: imagex);
  }
}
