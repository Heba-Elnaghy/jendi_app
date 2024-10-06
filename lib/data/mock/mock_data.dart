import '../models/score_model.dart';

final mockScoreResponse = ScoreResponse(
  inferences: [
    ScoreModel(
      id: "26051AB2-867F-4F8D-B134-0031C20D3FDC",
      type: "stress",
      state: "low",
      score: 0.34,
      factors: [
        Factor(name: "active_hours", value: 0.017),
        Factor(name: "daily_steps", value: 0.045),
        Factor(name: "activity_goals", value: -0.002),
        Factor(name: "sedentary_periods", value: -0.057),
        Factor(name: "activity_deviation", value: 0.031),
      ],
      inputData: ["age", "sleep", "steps", "heart_rate"],
    ),
    ScoreModel(
      id: "601ADC2F-4830-45E7-B538-F7821EC009EA",
      type: "depression",
      state: "none",
      score: 0.14,
      factors: [
        Factor(name: "active_hours", value: 0.017),
        Factor(name: "daily_steps", value: 0.045),
        Factor(name: "activity_goals", value: -0.002),
        Factor(name: "sedentary_periods", value: -0.007),
        Factor(name: "activity_deviation", value: 0.001),
      ],
      inputData: ["age", "sleep", "steps"],
    ),
    ScoreModel(
      id: "601ADC2F-4830-45E7-B538-F7821EC009EA",
      type: "anxiety",
      state: "medium",
      score: 0.62,
      factors: [
        Factor(name: "active_hours", value: 0.034),
        Factor(name: "daily_steps", value: 0.015),
        Factor(name: "activity_goals", value: -0.004),
        Factor(name: "sedentary_periods", value: -0.007),
        Factor(name: "activity_deviation", value: 0.02),
      ],
      inputData: ["age", "sleep", "steps", "screen"],
    ),
    ScoreModel(
      id: "acde070d-8c4c-4f0d-9d8a-162843c10333",
      type: "sleep",
      state: "high",
      score: 0.75,
      factors: [
        Factor(name: "active_hours", value: 0.015),
        Factor(name: "daily_steps", value: 0.085),
        Factor(name: "activity_goals", value: -0.011),
        Factor(name: "sedentary_periods", value: -0.007),
        Factor(name: "activity_deviation", value: 0.021),
      ],
      inputData: ["age", "gender", "sleep", "activity"],
    ),
  ],
  createdAt: DateTime.parse("2023-07-31T12:00:35+12:00"),
);