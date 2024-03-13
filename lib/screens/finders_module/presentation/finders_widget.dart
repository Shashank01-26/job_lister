import 'dart:math';
import 'package:flutter/material.dart';
import 'package:job_lister/network/network_service.dart';
import 'package:job_lister/screens/finders_module/data/get_job_list_model.dart';
import 'package:job_lister/screens/job_details/job_details_widget.dart';
import 'package:job_lister/screens/saved_job_widget.dart';

class FinderPage extends StatefulWidget {
  const FinderPage({Key? key}) : super(key: key);

  @override
  State<FinderPage> createState() => _FinderPageState();
}

class _FinderPageState extends State<FinderPage> with TickerProviderStateMixin {
  bool isLoaded = false;
  late GetJobs getJobs = GetJobs(jobs: []); // Initialize with empty list

  late ScrollController _scrollController;

  List<Widget> _buildRecommendedJobs() {
    List<Widget> recommendedJobs = [];
    Random random = Random();
    for (int i = 0; i < 5; i++) {
      recommendedJobs.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JobDetailsPage()),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Recommended Job ${random.nextInt(100)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Description of the job',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Salary: \$${random.nextInt(10000)}',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return recommendedJobs;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    getData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {}
  }

   void getData() async {
    var jobs = await RemoteService().getJobs();
    if (jobs != null) {
      setState(() {
        getJobs.jobs = jobs as List<Job>;
      });
    } else {
      // Handle error
      print('Failed to fetch jobs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.person_outline,
                  size: 20,
                  color: Colors.blue,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey There!!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'UserName',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Recommended Jobs',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 1.0),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _buildRecommendedJobs(),
              ),
            ),
            const Divider(thickness: 1.0),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: getJobs.jobs.length,
                itemBuilder: (context, index) {
                  var job = getJobs.jobs[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JobDetailsPage()),
                        );
                      },
                      child: _buildListItem(job),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(Job job) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: const Icon(Icons.image),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.title),
            Text(job.location.toString()),
            Text(job.plainTextDescription),
          ],
        ),
      ),
    );
  }
}
