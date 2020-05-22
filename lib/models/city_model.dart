class City {
  String name;
  double freteKg;
  double freteNf;
  double redespacho;
  double ajuste;
  double freteMin;
  String obs;

  City(
      {this.name,
      this.freteKg,
      this.freteNf,
      this.redespacho,
      this.ajuste,
      this.freteMin,
      this.obs});

  City.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    freteKg = map['freteKg'];
    freteNf = map['freteNf'];
    redespacho = map['redespacho'];
    ajuste = map['ajuste'];
    freteMin = map['frete_min'];
    obs = map['obs'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['freteKg'] = this.freteKg;
    data['freteNf'] = this.freteNf;
    data['redespacho'] = this.redespacho;
    data['ajuste'] = this.ajuste;
    data['frete_min'] = this.freteMin;
    data['obs'] = this.obs;
    return data;
  }
}
