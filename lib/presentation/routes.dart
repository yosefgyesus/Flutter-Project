import 'package:finalproject/authentication/loading.dart';
import 'package:flutter/material.dart';

import '../application/user/bookmarks/bookmarks_service.dart';
import '../application/user/greeting/greeting_service.dart';
import '../application/user/learning_goals/learning_goals_service.dart';
import '../application/user/number/number_service.dart';
import '../application/user/vocabulary/vocabulary_service.dart';
import '../authentication/sign_in_page.dart';
import '../authentication/sign_up_page.dart';
import '../infrastructure/repository/greeting_repository.dart';
import '../infrastructure/repository/vocabulary_repository.dart';
import '../infrastructure/services/api_service.dart';
import '../presentation/screens/admin/create_content/create_content_screen.dart';
import '../presentation/screens/admin/delete_content/delete_content_screen.dart';
import '../presentation/screens/admin/manage_user/manage_user_screen.dart';
import '../presentation/screens/admin/view_content/view_content_screen.dart';
import '../presentation/screens/user/bookmarks/bookmarks_screen.dart';
import '../presentation/screens/user/create_bookmark/create_bookmark_screen.dart';
import '../presentation/screens/user/greeting/greeting_screen.dart';
import '../presentation/screens/user/home/home_page.dart';
import '../presentation/screens/user/learning_goals/learning_goals_page.dart';
import '../presentation/screens/user/number/number_screen.dart';
import '../presentation/screens/user/vocabulary/vocabulary_screen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/loading':
        return MaterialPageRoute(builder: (_) => LoadingPage());
      case '/signIn':
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case '/admin/createContent':
        return MaterialPageRoute(builder: (_) => CreateContentScreen());
      case '/admin/viewContent':
        return MaterialPageRoute(builder: (_) => ViewContentScreen());
      case '/admin/deleteContent':
        return MaterialPageRoute(builder: (_) => DeleteContentScreen());
      case '/admin/manageUser':
        return MaterialPageRoute(builder: (_) => ManageUserScreen());
      case '/user/home':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case '/user/learningGoals':
        return MaterialPageRoute(
          builder: (_) => LearningGoalPage(
            userId: 'userid',
          ),
        );
      case '/user/bookmarks':
        return MaterialPageRoute(
          builder: (_) => BookmarksScreen(
            bookmarkService: BookmarkService(),
          ),
        );
      case '/user/createBookmark':
        return MaterialPageRoute(builder: (_) => CreateBookmarkScreen());
      case '/user/greeting':
        return MaterialPageRoute(
          builder: (_) => GreetingScreen(
            greetingService: GreetingService(ApiService()),
          ),
        );
      case '/user/number':
        return MaterialPageRoute(
          builder: (_) => NumberScreen(
            numberService: NumberService(ApiService()),
          ),
        );
      case '/user/vocabulary':
        return MaterialPageRoute(
          builder: (_) => VocabularyScreen(
            vocabularyService: VocabularyService(ApiService()),
          ),
        );
      default:
        return null;
    }
  }
}
