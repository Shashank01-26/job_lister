import 'package:flutter/material.dart';
import 'package:job_lister/screens/recruiter_screens/job_form.dart';

class RecruiterPage extends StatefulWidget {
  const RecruiterPage({Key? key}) : super(key: key);

  @override
  State<RecruiterPage> createState() => _RecruiterPageState();
}

class _RecruiterPageState extends State<RecruiterPage> {
  List<JobApplication>? jobApplications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recruiters Page'),
      ),
      body: jobApplications != null && jobApplications!.isNotEmpty
          ? ListView.builder(
              itemCount: jobApplications!.length,
              itemBuilder: (context, index) {
                final application = jobApplications![index];
                return ListTile(
                  title: Text(application.jobRole),
                  subtitle: Text(application.companyName),
                );
              },
            )
          : Center(
              child: Text('No applications till now!!'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostJobScreen(),
            ),
          );
        },
        child: Icon(Icons.post_add),
      ),
    );
  }
}

class JobApplication {
  final String jobRole;
  final String companyName;

  JobApplication({
    required this.jobRole,
    required this.companyName,
  });
}

class PostJobScreen extends StatelessWidget {
  const PostJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: JobForm(),
      ),
    );
  }
}

