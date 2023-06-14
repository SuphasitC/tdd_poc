import 'dart:convert';

import 'package:tdd_poc/domain/entities/greeting_entity.dart';

GreetingModel greetingModelFromJson(String str) => GreetingModel.fromJson(json.decode(str));
String greetingModelToJson(GreetingModel data) => json.encode(data.toJson());

class GreetingModel extends GreetingEntity{
    GreetingModel({
        required String greetingString,
    }) : super(greetingString);

    factory GreetingModel.fromJson(Map<String, dynamic> json) => GreetingModel(
        greetingString: json["greeting_string"],
    );

    Map<String, dynamic> toJson() => {
        "greeting_string": greetingString,
    };
}
