import 'package:flutter_test/flutter_test.dart';
import 'package:nyt/utils/date_convert.dart';

void main() {
  test("Data should be in format like: Nov 30, 2020", () {
    String initial = "2020-12-01";
    String formatted = DateConverter().formatDate(initial);
    expect(formatted, "Dec 1, 2020");
  });
}
