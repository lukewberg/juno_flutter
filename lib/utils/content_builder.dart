import 'package:flutter/cupertino.dart';
import 'package:juno_flutter/api/legacy_api.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/components/config/component_api_config.dart';
import 'package:juno_flutter/components/config/component_config.dart';
import 'package:juno_flutter/utils/api_route.dart';
import 'package:juno_flutter/utils/request_type.dart';

class ContentBuilder {
  static Future<List<Content>> getContentList(
      ComponentApiConfig apiConfig) async {
    List<Content> content = await LegacyAPI().queryContent(
      REQUEST_TYPE.post,
      apiConfig.contentType.map((e) => BUCKETS.values.byName(e)).toList(),
      API_ROUTE.v2,
      apiConfig.requiredTags,
      apiConfig.slug,
      apiConfig.limit ?? 5,
    );
    return content;
  }

  static FutureBuilder<List<Content>> getContentListBuilder(
      ComponentConfig config, Widget Function(List<Content>) builder) {
    return FutureBuilder<List<Content>>(
      future: config.futureContentList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Text('Loading...');
        }
      },
    );
  }
}
