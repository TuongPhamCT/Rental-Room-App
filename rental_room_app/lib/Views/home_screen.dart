import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/Contract/shared_preferences_presenter.dart';
import 'package:rental_room_app/Models/Room/room_model.dart';
import 'package:rental_room_app/Models/Room/room_repo.dart';
import 'package:rental_room_app/Presenter/shared_preferences_presenter.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/filter_container_widget.dart';
import 'package:rental_room_app/widgets/room_item.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    implements SharedPreferencesContract {
  SharedPreferencesPresenter? _preferencesPresenter;

  int _selectedIndex = 0;
  String _userName = "nguyen van a";
  bool _isOwner = true;
  String _userAvatarUrl = '';
  bool isVisiable = false;
  String? searchValue;
  bool isVisibleFilter = false;

  late List<Room> roomAvailable;

  @override
  void initState() {
    super.initState();
    _preferencesPresenter = SharedPreferencesPresenter(this);
    _preferencesPresenter?.getUserInfoFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: ColorPalette.backgroundColor,
        child: Column(
          children: [
            const Gap(30),
            SizedBox(
              width: size.width,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).go('/home/rental_form');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('WELCOME',
                            style: TextStyle(
                                fontSize: 10, color: ColorPalette.grayText)),
                        Text(
                          _userName,
                          style: const TextStyle(
                              fontSize: 16, color: ColorPalette.primaryColor),
                        ),
                      ],
                    ),
                    const Gap(15),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: _userAvatarUrl.isNotEmpty
                            ? DecorationImage(
                                image: NetworkImage(_userAvatarUrl),
                                fit: BoxFit.cover,
                              )
                            : const DecorationImage(
                                image: AssetImage(AssetHelper.avatar),
                                fit: BoxFit.cover,
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Gap(20),
            SizedBox(
              height: 42,
              width: double.infinity,
              child: TextField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (value) {
                    setState(() {
                      searchValue = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorPalette.primaryColor, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorPalette.primaryColor, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.only(top: 4),
                    prefixIcon: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {},
                      child: const Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 16,
                        color: ColorPalette.greenText,
                      ),
                    ),
                    suffixIcon: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        setState(() {
                          isVisibleFilter = !isVisibleFilter;
                        });
                      },
                      child: const Icon(
                        FontAwesomeIcons.barsProgress,
                        size: 16,
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: ColorPalette.grayText,
                    ),
                  )),
            ),
            const Gap(20),
            Container(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: isVisibleFilter,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.filter,
                          color: ColorPalette.greenText,
                          size: 15,
                        ),
                        const Gap(10),
                        Text(
                          'Filter',
                          style: TextStyles.titleHeading.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterContainerWidget(
                          name: 'Area',
                          icon1: const Icon(
                            FontAwesomeIcons.arrowUp,
                            color: ColorPalette.primaryColor,
                            size: 10,
                          ),
                          icon2: const Icon(
                            FontAwesomeIcons.arrowDown,
                            color: ColorPalette.primaryColor,
                            size: 10,
                          ),
                          onTapIconDown: () {},
                          onTapIconUp: () {},
                        ),
                        FilterContainerWidget(
                          name: 'Distance',
                          icon1: const Icon(
                            FontAwesomeIcons.arrowUp,
                            color: ColorPalette.primaryColor,
                            size: 10,
                          ),
                          icon2: const Icon(
                            FontAwesomeIcons.arrowDown,
                            color: ColorPalette.primaryColor,
                            size: 10,
                          ),
                          onTapIconDown: () {},
                        ),
                        FilterContainerWidget(
                          name: 'Price',
                          icon1: const Icon(
                            FontAwesomeIcons.arrowUp,
                            color: ColorPalette.primaryColor,
                            size: 10,
                          ),
                          icon2: const Icon(
                            FontAwesomeIcons.arrowDown,
                            color: ColorPalette.primaryColor,
                            size: 10,
                          ),
                          onTapIconDown: () {},
                        ),
                        FilterContainerWidget(
                          name: 'Rate',
                          icon1: const Icon(
                            FontAwesomeIcons.arrowUp,
                            color: ColorPalette.primaryColor,
                            size: 10,
                          ),
                          icon2: const Icon(
                            FontAwesomeIcons.arrowDown,
                            color: ColorPalette.primaryColor,
                            size: 10,
                          ),
                          onTapIconDown: () {},
                        ),
                        FilterContainerWidget(
                          name: 'Kind',
                          icon1: const Icon(
                            FontAwesomeIcons.angleDown,
                            color: ColorPalette.primaryColor,
                            size: 10,
                          ),
                          onTapIconDown: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Gap(20),
            Container(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: !_isOwner,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Suggestion For You',
                          style: TextStyles.titleHeading,
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/home/all_room');
                          },
                          child: const Row(
                            children: [
                              Text(
                                'See All',
                                style: TextStyles.seeAll,
                              ),
                              Gap(10),
                              Icon(
                                FontAwesomeIcons.angleRight,
                                size: 12,
                                color: ColorPalette.grayText,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Gap(10),
                    Container(),
                  ],
                ),
              ),
            ),
            const Gap(20),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Room Available',
                        style: TextStyles.titleHeading,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go('/home/create_room');
                        },
                        child: const Row(
                          children: [
                            Text(
                              'See All',
                              style: TextStyles.seeAll,
                            ),
                            Gap(10),
                            Icon(
                              FontAwesomeIcons.angleRight,
                              size: 12,
                              color: ColorPalette.grayText,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Gap(20),
            Container(
              child: Expanded(
                child: StreamBuilder<List<Room>>(
                  stream: RoomRepositoryIml().getRooms(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Something went wrong! ${snapshot.error}'),
                      );
                    } else if (snapshot.hasData) {
                      roomAvailable = snapshot.data!;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) => RoomItem(
                          room: roomAvailable[index],
                        ),
                        itemCount:
                            roomAvailable.length < 6 ? roomAvailable.length : 6,
                      );
                    } else
                      return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: ColorPalette.backgroundColor,
          currentIndex: _selectedIndex,
          onTap: (id) {
            setState(() {
              _selectedIndex = id;
            });
            switch (id) {
              case 0:
                GoRouter.of(context).go('/home');
                break;
              case 1:
                GoRouter.of(context).go('/your_room');
                break;
              case 2:
                GoRouter.of(context).go('/notification_list');
                break;
              case 3:
                GoRouter.of(context).go('/setting');
                break;
              default:
                break;
            }
          },
          items: [
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.house,
                  color: ColorPalette.primaryColor,
                  size: 20,
                ),
                title: const Text(
                  'Home',
                  style: TextStyles.bottomBar,
                )),
            if (!_isOwner)
              SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.doorOpen,
                    color: ColorPalette.primaryColor,
                    size: 20,
                  ),
                  title: const Text(
                    'Your Room',
                    style: TextStyles.bottomBar,
                  )),
            if (_isOwner)
              SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.chartLine,
                    color: ColorPalette.primaryColor,
                    size: 20,
                  ),
                  title: const Text(
                    'Statistic',
                    style: TextStyles.bottomBar,
                  )),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.bell,
                  color: ColorPalette.primaryColor,
                  size: 20,
                ),
                title: const Text(
                  'Notification',
                  style: TextStyles.bottomBar,
                )),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.gear,
                  color: ColorPalette.primaryColor,
                  size: 20,
                ),
                title: const Text(
                  'Setting',
                  style: TextStyles.bottomBar,
                )),
          ]),
    );
  }

  @override
  void updateView(
      String? userName, bool? isOwner, String? userAvatarUrl, String? email) {
    setState(() {
      _userName = userName ?? "null";
      _isOwner = isOwner ?? true;
      _userAvatarUrl = userAvatarUrl ?? "";
    });
  }
}
