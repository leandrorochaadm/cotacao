class Config {
  double seguro;
  double imposto;
  double minSeguro;

  Config({this.seguro, this.imposto, this.minSeguro});

  Config.fromJson(Map<String, dynamic> json) {
    seguro = json['seguro'];
    imposto = json['imposto'];
    minSeguro = json['min_seguro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seguro'] = this.seguro;
    data['imposto'] = this.imposto;
    data['min_seguro'] = this.minSeguro;
    return data;
  }
}
