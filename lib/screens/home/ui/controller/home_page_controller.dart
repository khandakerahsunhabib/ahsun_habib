import 'package:ahsun_habib/screens/home/models/project.dart';

class HomePageController {
  final List<Project> projects = [
    Project(
        title: 'What To Do',
        description: 'What to do (WTD) is a todo app to save your daily task',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/c/c8/Altja_j%C3%B5gi_Lahemaal.jpg',
        link: ''),
    Project(
        title: 'Task Manager App',
        description:
            'A modern, minimal task management application built using Flutter and GetX, designed for seamless productivity and user-friendly interaction.',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/c/c8/Altja_j%C3%B5gi_Lahemaal.jpg',
        link: ''),
    Project(
        title: 'Location Index',
        description:
            'Easy to navigate mobile app for quick analysis and comparison of various locations.',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/c/c8/Altja_j%C3%B5gi_Lahemaal.jpg',
        link: ''),
  ];
}
