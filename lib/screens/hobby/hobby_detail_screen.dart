import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../config/theme.dart';
import '../../providers/hobby_provider.dart';

class HobbyDetailScreen extends StatefulWidget {
  final String hobbyId;

  const HobbyDetailScreen({Key? key, required this.hobbyId}) : super(key: key);

  @override
  State<HobbyDetailScreen> createState() => _HobbyDetailScreenState();
}

class _HobbyDetailScreenState extends State<HobbyDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hobby Details'),
        elevation: 0,
      ),
      body: Consumer<HobbyProvider>(
        builder: (context, hobbyProvider, _) {
          final hobby = hobbyProvider.selectedHobby;

          if (hobby == null) {
            return const Center(
              child: Text('Hobby not found'),
            );
          }

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // Header Section
                      Container(
                        width: double.infinity,
                        height: 200.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.primaryColor,
                              AppTheme.secondaryColor,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.category,
                            size: 80.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hobby.title,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              hobby.description,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppTheme.textSecondaryColor,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '${hobby.followers}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppTheme.textSecondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${hobby.posts}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Posts',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppTheme.textSecondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 16.sp,
                                          color: AppTheme.accentColor,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          '${hobby.rating}',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Rating',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppTheme.textSecondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => hobbyProvider
                                    .followHobby(hobby.id),
                                child: const Text('Join Hobby'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Posts'),
                    Tab(text: 'Challenges'),
                    Tab(text: 'Events'),
                    Tab(text: 'Groups'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Posts Tab
                      Center(
                        child: Text(
                          'Posts (${hobbyProvider.hobbyPosts.length})',
                        ),
                      ),
                      // Challenges Tab
                      Center(
                        child: Text(
                          'Challenges (${hobbyProvider.challenges.length})',
                        ),
                      ),
                      // Events Tab
                      Center(
                        child: Text(
                          'Events (${hobbyProvider.events.length})',
                        ),
                      ),
                      // Groups Tab
                      Center(
                        child: Text(
                          'Groups (${hobbyProvider.groups.length})',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
