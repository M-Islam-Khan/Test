
class Employee {
  List<Employees>? employees;

  Employee({this.employees});

  Employee.fromJson(Map<String, dynamic> json) {
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employees != null) {
      data['employees'] = employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  String? name;
  int? age;
  int? salary;

  Employees({this.name, this.age, this.salary});

  Employees.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    salary = json['salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['salary'] =salary;
    return data;
  }
}