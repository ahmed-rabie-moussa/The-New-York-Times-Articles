import "dart:convert";

import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";
import "package:nyt/models/article.dart";

class MockClient extends Mock implements http.Client {}

final url =
    "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9";

main() {
  group("fetchArticles", () {
    test("returns a list of articles if the http call completes successfully",
        () async {
      final client = MockClient();

      when(client.get(url)).thenAnswer((_) async => http.Response(
          "{\"id\": 100000007479053,\"source\": \"New York Times\",\"published_date\": \"2020-12-04\",\"updated\": \"2020-12-06 19:41:31\"," +
              "\"byline\": \"By Nicholas Kristof\",\"title\":" +
              " \"The Children of Pornhub\",\"abstract\": \"Why does Canada allow this company to profit off videos of exploitation and assault?\"," +
              "\"media\": [" +
              "{\"caption\": \"Serena K. Fleites, 19, was 14 when a boy she had a crush" +
              " on asked her to make a naked video and send it to him. She did, and it ended up on Pornhub.\"," +
              "\"media-metadata\": [" +
              "{\"url\": \"https://static01.nyt.com/images/2020/12/06/opinion/04kristof-2-R/04kristof-2-thumbStandard.jpg\"}," +
              "{\"url\": \"https://static01.nyt.com/images/2020/12/06/opinion/04kristof-2-R/04kristof-2-mediumThreeByTwo210.jpg\"}," +
              "{\"url\": \"https://static01.nyt.com/images/2020/12/06/opinion/04kristof-2-R/04kristof-2-mediumThreeByTwo440.jpg\"}]" +
              " }]}",
          200));
      final response = await client.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
      expect(Article.fromJson(data), isA<Article>());
    });
  });
}
