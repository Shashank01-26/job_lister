import 'dart:convert';

GetJobs getJobsFromJson(String str) => GetJobs.fromJson(json.decode(str));

String getJobsToJson(GetJobs data) => json.encode(data.toJson());

class GetJobs {
    List<Job> jobs;

    GetJobs({
        required this.jobs,
    });

    factory GetJobs.fromJson(Map<String, dynamic> json) => GetJobs(
        jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
    };
}

class Job {
    String id;
    String applicationUrl;
    String companyName;
    EmploymentType employmentType;
    EmploymentHourType employmentHourType;
    String plainTextDescription;
    String htmlDescription;
    DateTime publicationTime;
    String source;
    String title;
    Location location;
    Salary? salary;

    Job({
        required this.id,
        required this.applicationUrl,
        required this.companyName,
        required this.employmentType,
        required this.employmentHourType,
        required this.plainTextDescription,
        required this.htmlDescription,
        required this.publicationTime,
        required this.source,
        required this.title,
        required this.location,
        required this.salary,
    });

    factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        applicationUrl: json["application_url"],
        companyName: json["company_name"],
        employmentType: employmentTypeValues.map[json["employment_type"]]!,
        employmentHourType: employmentHourTypeValues.map[json["employment_hour_type"]]!,
        plainTextDescription: json["plain_text_description"],
        htmlDescription: json["html_description"],
        publicationTime: DateTime.parse(json["publication_time"]),
        source: json["source"],
        title: json["title"],
        location: locationValues.map[json["location"]]!,
        salary: json["salary"] == null ? null : Salary.fromJson(json["salary"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "application_url": applicationUrl,
        "company_name": companyName,
        "employment_type": employmentTypeValues.reverse[employmentType],
        "employment_hour_type": employmentHourTypeValues.reverse[employmentHourType],
        "plain_text_description": plainTextDescription,
        "html_description": htmlDescription,
        "publication_time": publicationTime.toIso8601String(),
        "source": source,
        "title": title,
        "location": locationValues.reverse[location],
        "salary": salary?.toJson(),
    };
}

enum EmploymentHourType {
    FULL_TIME,
    PART_TIME
}

final employmentHourTypeValues = EnumValues({
    "Full-time": EmploymentHourType.FULL_TIME,
    "Part-time": EmploymentHourType.PART_TIME
});

enum EmploymentType {
    CONTRACTOR,
    EMPLOYEE,
    INTERNSHIP
}

final employmentTypeValues = EnumValues({
    "Contractor": EmploymentType.CONTRACTOR,
    "Employee": EmploymentType.EMPLOYEE,
    "Internship": EmploymentType.INTERNSHIP
});

enum Location {
    SEATTLE_WA
}

final locationValues = EnumValues({
    "Seattle, WA": Location.SEATTLE_WA
});

class Salary {
    String currency;
    int minSalary;
    int maxSalary;
    String salaryType;

    Salary({
        required this.currency,
        required this.minSalary,
        required this.maxSalary,
        required this.salaryType,
    });

    factory Salary.fromJson(Map<String, dynamic> json) => Salary(
        currency: json["currency"],
        minSalary: json["min_salary"],
        maxSalary: json["max_salary"],
        salaryType: json["salary_type"],
    );

    Map<String, dynamic> toJson() => {
        "currency": currency,
        "min_salary": minSalary,
        "max_salary": maxSalary,
        "salary_type": salaryType,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
