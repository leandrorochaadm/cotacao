class City {
  String name;
  double freteKg;
  double freteNf;
  double redespacho;
  double ajuste;

  City({this.name, this.freteKg, this.freteNf, this.redespacho, this.ajuste});

  City.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    freteKg = map['frete_kg'];
    freteNf = map['frete_nf'];
    redespacho = map['redespacho'];
    ajuste = map['ajuste'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['frete_kg'] = this.freteKg;
    data['frete_nf'] = this.freteNf;
    data['redespacho'] = this.redespacho;
    data['ajuste'] = this.ajuste;
    return data;
  }
}
