import 'dart:convert';

import 'package:chopper/chopper.dart';

// ignore_for_file: deprecated_member_use

class JsonToTypeConverter extends JsonConverter {
  const JsonToTypeConverter(this._typeToJsonFactoryMap);

  final Map<Type, Function> _typeToJsonFactoryMap;

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) =>
      response.replace(
        body: _fromJsonData<BodyType, InnerType>(
          utf8.decode(response.bodyBytes),
          _typeToJsonFactoryMap[InnerType],
        ),
      );

  T _fromJsonData<T, InnerType>(String jsonData, Function jsonParser) {
    var jsonMap = json.decode(jsonData);

    if (jsonMap is List) {
      return jsonMap
          .map((item) => jsonParser(item as Map<String, dynamic>) as InnerType)
          .toList() as T;
    }

    return jsonParser(jsonMap);
  }
}
