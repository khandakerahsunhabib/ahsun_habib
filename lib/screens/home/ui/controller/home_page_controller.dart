import 'package:ahsun_habib/core/utils/assets_path.dart';
import 'package:ahsun_habib/screens/home/models/project.dart';

class HomePageController {
  final List<Project> projects = [
    Project(
        title: 'Location Index',
        description:
            'Built an API-based real estate app with authentication, location ranking, and full CRUD using GetX. Now in final stages for Play Store & App Store release.',
        image: AssetsPath.locationIndexAppBanner,
        link: ''),
    Project(
        title: 'CSM BD HRM APP',
        description:
            'Developed CSM BD HRM, a Flutter-based HR management app with attendance, leave, and employee profile features for streamlined workforce management',
        image: AssetsPath.locationIndexAppBanner,
        link: ''),
    Project(
        title: 'MediGuide',
        description:
            'Created MediGuide, a Flutter-based e-book app for medical resources, featuring smooth navigation, offline access, and a clean reading experience.',
        image: AssetsPath.mediGuideAppBanner,
        link: ''),
    Project(
        title: 'What To Do',
        description: 'What to do (WTD) is a todo app to save your daily task',
        image: AssetsPath.todoAppBanner,
        link: ''),
    Project(
        title: 'Task Manager App',
        description:
            'A modern, minimal task management application built using Flutter and GetX, designed for seamless productivity and user-friendly interaction.',
        image: AssetsPath.taskManagerAppBanner,
        link: ''),
  ];
}
