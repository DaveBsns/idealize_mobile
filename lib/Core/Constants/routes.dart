import 'package:get/get.dart';
import 'package:idealize_new_version/Features/Base/presentation/screens/chat_screen.dart';
import 'package:idealize_new_version/Features/Edit_Profile/presentation/edit_profile_screen.dart';
import 'package:idealize_new_version/Features/Splash/presentation/splash_screen.dart';
import 'package:idealize_new_version/Features/authentication/presentation/screens/reset_password_screen.dart';
import 'package:idealize_new_version/Features/project_details/presentation/binding/project_details_binding.dart';
import 'package:idealize_new_version/Features/project_details/presentation/project_details_screen.dart';

import 'package:idealize_new_version/Features/Profile/presentation/profile_screen.dart';
import 'package:idealize_new_version/Features/notification/presentation/notification_screen.dart';
import 'package:idealize_new_version/Features/my_projects/presentation/binding/my_projects_binding.dart';
import 'package:idealize_new_version/Features/my_projects/presentation/my_projects_screen.dart';
import 'package:idealize_new_version/Features/app_setting/presentation/screens/text_size_view.dart';
import 'package:idealize_new_version/Features/authentication/presentation/screens/authentication_data_screen.dart';
import 'package:idealize_new_version/Features/authentication/presentation/screens/authentication_base_screen.dart';
import 'package:idealize_new_version/Features/authentication/presentation/bindings/authentication_binding.dart';
import 'package:idealize_new_version/Features/Base/Binding/base_binding.dart';
import 'package:idealize_new_version/Features/Base/base_view.dart';
import 'package:idealize_new_version/Features/Create_New_Project/presentation/views/create_new_project_base_screen.dart';
import 'package:idealize_new_version/Features/Create_New_Project/presentation/views/create_new_project_completed_screen.dart';
import 'package:idealize_new_version/Features/Create_New_Project/presentation/views/create_new_project_screen.dart';
import 'package:idealize_new_version/Features/home/presentation/home_view.dart';

import 'package:idealize_new_version/Features/Register/presentation/View/register_firs_step_screen.dart';
import 'package:idealize_new_version/Features/Register/presentation/View/register_second_step_screen.dart';
import 'package:idealize_new_version/Features/Register/presentation/View/registration_completed_screen.dart';

import 'package:idealize_new_version/Features/archived_projcts/presentation/archived_projcts_screen.dart';
import 'package:idealize_new_version/Features/register/presentation/binding/register_binding.dart';

import '../../Features/Register/presentation/View/register_third_step_screen.dart';

class AppRoutes {
  final splash = '/';
  final authentication = '/authentication';
  final resetPassword = '/reset-password';
  final chatScreen = '/chat-screen';
  final externalAuth = '/external-authentication';
  final home = '/home';
  final createNewProjectBase = '/create-new-project-base';
  final createNewProjectScreen = '/create-new-project-screen';
  final createNewProjectCompleted = '/create-new-project-completed';
  final base = '/base';
  final projectDetails = '/project-details';
  final profile = '/profile';
  final registrationFirstStep = '/registrationFirstStep';
  final registrationSecondStep = '/registrationSecondStep';
  final registrationThirdStep = '/registrationThirdStep';
  final registrationComleted = '/registrationComleted';
  final myProjects = '/myProjects';
  final editProfile = '/editProfile';
  final textSizeView = '/textSizeView';
  final notification = '/notification';
  final archivedProject = '/archivedProject';

  List<GetPage> get pages {
    return [
      GetPage(
        name: splash,
        page: () => SplashScreen(),
      ),
      GetPage(
        name: resetPassword,
        page: () => const ResetPasswordScreen(),
      ),
      GetPage(
        name: authentication,
        page: () => const AuthenticationBaseScreen(),
        binding: AuthenticationBinding(),
      ),
      GetPage(
        name: externalAuth,
        page: () => const AuthenticationDataScreen(),
        binding: AuthenticationBinding(),
      ),
      GetPage(
        name: createNewProjectBase,
        page: () => const CreateNewProjectBaseScreen(),
      ),
      GetPage(
        name: createNewProjectScreen,
        page: () => const CreateNewProjectScreen(),
        binding: BaseBinding(),
      ),
      GetPage(
          name: createNewProjectCompleted,
          page: () => const CreateNewProjectCompletedScreen()),
      GetPage(name: home, page: () => const HomeView()),
      GetPage(
        name: profile,
        page: () => const ProfileScreen(),
        binding: BaseBinding(),
      ),
      GetPage(
        name: registrationFirstStep,
        page: () => const RegisterFirstStepScreen(),
        binding: RegisterBinding(),
      ),
      GetPage(
        name: registrationSecondStep,
        page: () => const RegisterSecondStepScreen(),
        binding: RegisterBinding(),
      ),
      GetPage(
          name: registrationThirdStep,
          page: () => const RegisterThirdStepScreen(),
          binding: RegisterBinding()),
      GetPage(
          name: registrationComleted,
          page: () => const RegistrationCompletedScreen()),
      GetPage(
          name: projectDetails,
          binding: ProjectDetailsBinding(),
          page: () => const ProjectDetailsScreen()),
      GetPage(
        name: myProjects,
        page: () => const MyProjectsScreen(),
        binding: MyProjectsBinding(),
      ),
      GetPage(
        name: editProfile,
        page: () => const EditProfileScreen(),
      ),
      GetPage(name: textSizeView, page: () => const TextSizeView()),
      GetPage(
        name: notification,
        page: () => const NotificationScreen(),
        binding: BaseBinding(),
      ),
      GetPage(
          name: base, binding: BaseBinding(), page: () => const AppBaseView()),
      GetPage(
        name: archivedProject,
        page: () => const ArchivedProjctsScreen(),
        binding: BaseBinding(),
      ),
      GetPage(
        name: chatScreen,
        page: () => const ChatScreen(),
        binding: BaseBinding(),
      ),
    ];
  }
}
