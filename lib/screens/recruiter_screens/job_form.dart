import 'package:flutter/material.dart';

class JobForm extends StatefulWidget {
  const JobForm({Key? key}) : super(key: key);

  @override
  _JobFormState createState() => _JobFormState();
}

class _JobFormState extends State<JobForm> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _jobRoleController = TextEditingController();
  final TextEditingController _payRangeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _requirementsController = TextEditingController();
  final TextEditingController _qualificationsController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _companyNameController,
            decoration: InputDecoration(labelText: 'Company Name'),
          ),
          TextFormField(
            controller: _jobRoleController,
            decoration: InputDecoration(labelText: 'Job Role'),
          ),
          TextFormField(
            controller: _payRangeController,
            decoration: InputDecoration(labelText: 'Pay Range'),
          ),
          TextFormField(
            controller: _locationController,
            decoration: InputDecoration(labelText: 'Location'),
          ),
          TextFormField(
            controller: _requirementsController,
            decoration: InputDecoration(labelText: 'Requirements'),
          ),
          TextFormField(
            controller: _qualificationsController,
            decoration: InputDecoration(labelText: 'Qualifications'),
          ),
          TextFormField(
            controller: _skillsController,
            decoration: InputDecoration(labelText: 'Skills Required'),
          ),
          TextFormField(
            controller: _experienceController,
            decoration: InputDecoration(labelText: 'Experience'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Post Job'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _jobRoleController.dispose();
    _payRangeController.dispose();
    _locationController.dispose();
    _requirementsController.dispose();
    _qualificationsController.dispose();
    _skillsController.dispose();
    _experienceController.dispose();
    super.dispose();
  }
}
