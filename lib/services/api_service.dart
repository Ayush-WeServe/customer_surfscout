// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class ApiService {
//   RxBool isLoading = false.obs;
//   final String api;
//   ApiService._({required this.api});

//   Future<void> fetchData() async {
//     RxList<model> data = <model>[].obs;
//     isLoading.value = true;
//     try {
//       final response = await http.get(Uri.parse(api));

//       if (response.statusCode == 200) {
//         List<dynamic> jsonData = json.decode(response.body);
//         // print(response.body);

//         var finalData = jsonData.map((json) => model.fromJson(json)).toList();
//         data.value = finalData;
//       } else {
//         throw Exception("Network Error!!");
//       }
//     } catch (e) {
//       print('Error Occured ==== ${e.toString()}');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
