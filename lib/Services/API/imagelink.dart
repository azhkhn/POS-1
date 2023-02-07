import 'dart:convert';

import 'package:http/http.dart' as http;

getimage(String imglink) async {
   var response = await http.get(
    Uri.parse(imglink),
   );

   if(response.statusCode == 200){
    return jsonDecode(response.body);
   }
   else{
    return {'status' : 'N'};
   }
  
  }