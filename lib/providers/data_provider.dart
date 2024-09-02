import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/data_model.dart';

final dataProvider = FutureProvider<List<DataModel>>((ref) async {
  final response = await http.get(Uri.parse(
      'https://api.data.gov.in/resource/46ee6707-5b9d-4d25-8fe7-20f05997d74d?api-key=579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b&format=json'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final records = data['records'] as List;

    return records.map((item) => DataModel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load data');
  }
});
