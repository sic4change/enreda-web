
class Test {
  Test({
    required this.testId,
  });

  factory Test.fromMap(Map<String, dynamic> data, String documentId) {
    final String testId = data['testId'];

    return Test(
      testId: testId,
    );
  }

  final String testId;


}