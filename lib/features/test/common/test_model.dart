class TestModel {
  final String testName;
  final String testId;

  TestModel({required this.testName, required this.testId});

  Map<String, dynamic> toJson() => {
        'testName': testName,
        'testId': testId,
      };

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        testName: json['testName'] as String,
        testId: json['testId'] as String,
      );
}
