class Config {
  double seguro;
  double imposto;
  double minSeguro;

  Config({this.seguro, this.imposto, this.minSeguro});

  Config.fromMap(Map<String, dynamic> map) {
    seguro = map['seguro'];
    imposto = map['imposto'];
    minSeguro = map['min_seguro'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seguro'] = this.seguro;
    data['imposto'] = this.imposto;
    data['min_seguro'] = this.minSeguro;
    return data;
  }
}
