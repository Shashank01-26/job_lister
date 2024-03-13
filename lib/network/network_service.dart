import 'package:job_lister/Utils/endpoint_constraints.dart';
import 'package:job_lister/screens/finders_module/data/get_job_list_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<GetJobs?> getJobs() async {
    var client = http.Client();

    var uri = Uri.parse(
        "https://job-search-api1.p.rapidapi.com/" + Endpoint.JOB_DETAILS);

    var headers = {
      'X-RapidAPI-Key': 'ed6fb77803mshd7e6ff7339a892fp16891djsn6a7248a88f8a',
      'X-RapidAPI-Host': 'job-search-api1.p.rapidapi.com'
    };

    try {
      var response = await client.get(uri, headers: headers);
      if (response.statusCode == 200) {
        var json = response.body;
        return getJobsFromJson(json);
      } else {
        // Handle error
        print('Failed to fetch jobs: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception occurred: $e');
      return null;
    } finally {
      // Close the client regardless of success or failure
      client.close();
    }
  }
}
