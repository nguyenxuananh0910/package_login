import 'package:get/get.dart';
import 'package:package_login/src/presentation/pages/add_hotel/add_hotel_controller.dart';
import 'package:package_login/src/presentation/pages/add_hotel/add_hotel_page.dart';
import 'package:package_login/src/presentation/pages/booking/booking_controller.dart';
import 'package:package_login/src/presentation/pages/booking/booking_page.dart';
import 'package:package_login/src/presentation/pages/home/home_controller.dart';
import 'package:package_login/src/presentation/pages/home/home_page.dart';
import 'package:package_login/src/presentation/pages/hotel_detal/hotel_detail_controller.dart';
import 'package:package_login/src/presentation/pages/hotel_detal/hotel_detail_page.dart';
import 'package:package_login/src/presentation/pages/list_room/list_room_controller.dart';
import 'package:package_login/src/presentation/pages/list_room/list_room_page.dart';
import 'package:package_login/src/presentation/pages/login/login_controller.dart';
import 'package:package_login/src/presentation/pages/login/login_page.dart';
import 'package:package_login/src/presentation/pages/mybooking/mybooking_controller.dart';
import 'package:package_login/src/presentation/pages/mybooking/mybooking_page.dart';
import 'package:package_login/src/presentation/pages/navigator_menu/navigator_menu_controller.dart';
import 'package:package_login/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:package_login/src/presentation/pages/profile/profile_controller.dart';
import 'package:package_login/src/presentation/pages/profile/profile_page.dart';
import 'package:package_login/src/presentation/pages/room_detail/room_detail_controller.dart';
import 'package:package_login/src/presentation/pages/room_detail/room_detail_page.dart';
import 'package:package_login/src/presentation/pages/search_hotel/search_hotel_controller.dart';
import 'package:package_login/src/presentation/pages/search_hotel/search_hotel_page.dart';
import 'package:package_login/src/presentation/pages/sign/sign_controller.dart';
import 'package:package_login/src/presentation/pages/sign/sign_page.dart';
import 'package:package_login/src/presentation/widgets/bottomsheet/bottomsheet_location/bottomsheet_location_page.dart';
import 'package:package_login/src/presentation/widgets/bottomsheet/filter/filter_page.dart';
import 'package:package_login/src/presentation/widgets/dia_log/dialog_date/dialog_date_page.dart';
import 'package:package_login/src/presentation/widgets/loading.dart';
import 'package:package_login/src/presentation/widgets/search_hotel_widget/widget_search_hotel_controller.dart';

class RouterUserConfigs {
  static final List<GetPage<void>> routes = [
    GetPage(
      name: LoginView.routeName,
      page: () => const LoginView(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(LoginController.new),
      ),
    ),
    GetPage(
      name: SignPage.routeName,
      page: () => const SignPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(SignController.new),
      ),
    ),
    GetPage(
      name: NavigatorMenuPage.routeName,
      page: () => const NavigatorMenuPage(),
      binding: BindingsBuilder<void>(() {
        Get.lazyPut(NavigatorMenuController.new);
        Get.lazyPut(HomeController.new);
        Get.lazyPut(WidgetSearchHotelController.new);
        Get.lazyPut(MyBookingController.new);
        Get.lazyPut(ProfileController.new);
      }),
    ),
    GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: BindingsBuilder<void>(
        () {
          Get.lazyPut(HomeController.new);
        },
      ),
    ),
    GetPage(
      name: MyBookingPage.routeName,
      page: () => const MyBookingPage(),
      binding: BindingsBuilder<void>(
        () {
          Get.lazyPut(MyBookingController.new);
        },
      ),
    ),
    GetPage(
      name: ProfilePage.routeName,
      page: () => const ProfilePage(),
      binding: BindingsBuilder<void>(
        () {
          Get.lazyPut(ProfileController.new);
        },
      ),
    ),
    GetPage(
      name: HotelDetailPage.routeName,
      page: () => const HotelDetailPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(HotelDetailController.new),
      ),
    ),
    GetPage(
      name: SearchHotelPage.routeName,
      page: () => const SearchHotelPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(SearchHotelController.new),
      ),
    ),
    GetPage(
      name: FilterPage.routeName,
      page: () => const FilterPage(),
    ),
    GetPage(
      name: DiaLogDatePage.routeName,
      page: () => const DiaLogDatePage(),
    ),
    GetPage(
      name: BottomSheetLocation.routeName,
      page: () => const BottomSheetLocation(),
    ),
    GetPage(
      name: AddHotelPage.routeName,
      page: () => const AddHotelPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(AddHotelController.new),
      ),
    ),
    GetPage(
      name: BookingPage.routeName,
      page: () => const BookingPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(BookingController.new),
      ),
    ),
    GetPage(
      name: ListRoomPage.routeName,
      page: () => const ListRoomPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(ListRoomController.new),
      ),
    ),
    GetPage(
      name: RoomDetailPage.routeName,
      page: () => const RoomDetailPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(RoomDetailController.new),
      ),
    ),
    GetPage(
      name: LoadingPage.routeName,
      page: () => const LoadingPage(),
    ),
  ];
}
