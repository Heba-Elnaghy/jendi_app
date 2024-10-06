class ScoreResponse {
  final List<ScoreModel> inferences;
  final DateTime createdAt;

  ScoreResponse({required this.inferences, required this.createdAt});

  factory ScoreResponse.fromJson(Map<String, dynamic> json) {
    return ScoreResponse(
      inferences: (json['inferences'] as List)
          .map((i) => ScoreModel.fromJson(i))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class ScoreModel {
  final String id;
  final String type;
  final String state;
  final double score;
  final List<Factor> factors;
  final List<String> inputData;

  ScoreModel({
    required this.id,
    required this.type,
    required this.state,
    required this.score,
    required this.factors,
    required this.inputData,
  });

  factory ScoreModel.fromJson(Map<String, dynamic> json) {
    return ScoreModel(
      id: json['id'],
      type: json['type'],
      state: json['state'],
      score: json['score'].toDouble(),
      factors: (json['factors'] as List)
          .map((i) => Factor.fromJson(i))
          .toList(),
      inputData: List<String>.from(json['inputData']),
    );
  }
}

class Factor {
  final String name;
  final double value;

  Factor({required this.name, required this.value});

  factory Factor.fromJson(Map<String, dynamic> json) {
    return Factor(
      name: json['name'],
      value: json['value'].toDouble(),
    );
  }
}