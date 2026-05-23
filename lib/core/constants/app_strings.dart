import 'package:ahmed_abdelfattah/models/experience_model.dart';
import 'package:ahmed_abdelfattah/models/project_model.dart';
import 'package:ahmed_abdelfattah/models/skill_model.dart';

class AppStrings {
  AppStrings._();

  static const String name = 'Ahmed Abdelfattah';
  static const String title = 'Mid-level Flutter Developer';
  static const String subtitle =
      'A passionate mobile developer & AI/ML enthusiast';
  static const String terminalJoke = r'''
$ sudo mob-ops --business "waste-management"

> Running background job... 🗑️🤫
> [SYSTEM] Garbage collector executed successfully.
> [WARN] FBI wiretap detected on port 8080.
> Tony: "You're gonna look me in the eye and tell me it's not a memory leak?"
> "Forget about it. The code compiled. 🔫🥖"
''';
  static const String email = 'ahmadabdelfattahahmad97@gmail.com';
  static const String phone = '+20 155 076 9320';
  static const String location = 'Cairo, Egypt';
  static const String linkedinUrl =
      'https://www.linkedin.com/in/ahmad-abdelfattah';
  static const String githubUrl = 'https://github.com/ahmedabdelfattah';

  static const String summary =
      'Mid-level Mobile Software Engineer with expertise in designing and delivering scalable, cross-platform applications. Key technical contributor to the Tuba ecosystem, which recently secured 8M USD in funding, and the Kitch platform, currently serving 25k+ active users. Skilled in Clean Architecture, state management, and optimizing performance for complex healthcare and lifestyle products.';

  static const String education =
      'Bachelor of Computer Science – Suez Canal University, Ismailia, 2022';

  static const List<ExperienceModel> experience = [
    ExperienceModel(
      role: 'Flutter Developer',
      company: 'Tuba – Saudi Arabia',
      location: 'Remote',
      period: 'Sept 2024 – Present',
      highlights: [
        'Spearheaded the development of two core mobile applications (Consumer & Business) that served as the technical foundation for securing 8M USD in company funding.',
        'Engineered real-time healthcare tracking and insurance management features, ensuring stability for corporate and SME clients.',
        'Collaborated with cross-functional teams to deliver high-performance iOS and Android solutions using clean architecture.',
      ],
    ),
    ExperienceModel(
      role: 'Flutter Developer',
      company: 'Kitch (part time)',
      location: 'Remote',
      period: 'Jul 2025 – Present', // Future date in original CV
      highlights: [
        'Architected and maintained the flagship recipe application currently serving over 25,000 active users.',
        'Migrated legacy codebase to modern Flutter practices, significantly improving app scalability and reducing technical debt.',
        'Optimized UI/UX components to handle increased traffic and enhance user engagement.',
      ],
    ),
    ExperienceModel(
      role: 'Flutter Developer',
      company: 'Qader',
      location: 'Remote',
      period: 'Feb 2024 – Sept 2024',
      highlights: [
        'Built and maintained outsourced mobile apps across multiple industries.',
        'Implemented multi-module architectures to scale complex applications efficiently.',
      ],
    ),
    ExperienceModel(
      role: 'Freelance Flutter Developer',
      company: 'Self-Employed',
      location: 'Remote',
      period: 'Mar 2023 – Present',
      highlights: [
        'Developed diverse applications with reusable, clean, and efficient code.',
        'Refactored a legacy 4-year-old project to improve performance and maintainability.',
      ],
    ),
  ];

  static const List<ProjectModel> projects = [
    ProjectModel(
      name: 'My Tuba',
      description: '''
Healthcare management app streamlining insurance tasks.
      Your smart platform to manage your medical insurance... all your coverage details in one place, easily and without complications.

The Tuba app helps you manage your insurance benefits with ease. Now you can view your coverage details, approved network, and claim status without having to contact HR or insurance companies.

What does the app offer?

Access your coverage details View your limits, available benefits, exclusions, and remaining balance—all displayed clearly and simply.

Network Provider Locator Easily find approved locations within your insurance network. View contact numbers and directions via maps. You can also search by area to find the most convenient location for you.''',
      appStoreUrl: 'https://apps.apple.com/eg/app/my-tuba/id6748878350',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.tuba.health',
      technologies: ['Flutter', 'Clean Architecture', 'Getx'],
    ),
    ProjectModel(
      name: 'Tuba Business',
      description:
          '''
Tuba Business is a dedicated application for company owners, HR managers, and finance teams to manage healthcare benefits and monitor medical spending with full transparency.

What you can do:
• Complete Spending Dashboard: View total company medical spending, spending per employee, high-cost services, usage analytics & trends, and AI-driven cost prediction.
• Manage Your Healthcare Plans: Easily edit benefit limits, customize plan tiers, assign plans to departments, and update coverage in real time.
• Full Employee Management: Add/remove employees, change employee plans, monitor their usage, and view cost breakdowns.
• Provider Network Overview: Browse hospitals, clinics, pharmacies, contract details, company-specific pricing, and usage per provider.
• Manage Medical Claims: Track submitted claims, status (approved, rejected, pending), attached invoices & reports, and employee medical history.
• Smart Alerts (AI Monitoring): Get notifications for unusual spending, high-cost employees, outlier claims, fraud risk indicators, and possible budget overruns.
• Downloadable Financial Reports: Generate monthly spending reports, department spending, employee-level analysis, and cost comparisons across branches.
• Fully Mobile Management: Everything you need to manage your healthcare benefits is now available on your phone.

Leading in Health Insurance & Medical Care Innovation:
Tuba isn't just another insurance provider; it's a future-forward partner. We leverage Artificial Intelligence to deliver a seamless, digital-first experience that redefines corporate health coverage.''',
      appStoreUrl:
          'https://apps.apple.com/eg/app/tuba-business-%D8%B7%D9%88%D8%A8%D9%8A-%D9%84%D9%84%D8%B4%D8%B1%D9%83%D8%A7%D8%AA/id6755146712',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.tuba.health.company',
      technologies: [
        'Flutter',
        'Clean Architecture',
        'Getx',
        'A Role-Based Access Control (RBAC) system',
      ],
    ),
    ProjectModel(
      name: 'Kitch',
      description:
          'A cooking companion app providing recipe discovery with 30K+active users meal planning, and personalized recommendations. Migrated legacy code to scalable architecture.',
      appStoreUrl:
          'https://apps.apple.com/eg/app/kitch-%D9%83%D9%8A%D8%AA%D8%B4/id6743743762',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.app.kitch',
      technologies: ['Flutter', 'Bloc', 'Mvc+s', 'Analytics', 'local database'],
    ),

    ProjectModel(
      name: 'Follow Metric',
      description:
          'Multibiometric staff attendance tracking with business intelligence.',
      technologies: ['Flutter', 'Biometrics', 'Analytics'],
    ),
  ];

  static const List<SkillModel> skills = [
    SkillModel(name: 'Dart', category: 'Language'),
    SkillModel(name: 'Flutter', category: 'Framework'),
    SkillModel(name: 'Bloc', category: 'State Management'),
    SkillModel(name: 'Getx', category: 'State Management'),
    SkillModel(name: 'Riverpod', category: 'State Management'),
    SkillModel(name: 'MVC / MVVM', category: 'Architecture'),
    SkillModel(name: 'Clean Architecture', category: 'Architecture'),
    SkillModel(name: 'Domain Driven Design', category: 'Architecture'),
    SkillModel(name: 'Git / GitHub / GitLab', category: 'Tools'),
    SkillModel(name: 'REST API', category: 'Networking'),
    SkillModel(name: 'Google Maps', category: 'Services'),
    SkillModel(name: 'SQflite / Hive / Drift', category: 'Database'),
    SkillModel(name: 'OOP / TDD', category: 'Concepts'),
    SkillModel(name: 'Firebase (Auth, FCM, Firestore)', category: 'Backend'),
  ];
}
