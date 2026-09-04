import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../config/theme.dart';
import '../../providers/hobby_provider.dart';

class HobbyHomeScreen extends StatefulWidget {
  const HobbyHomeScreen({Key? key}) : super(key: key);

  @override
  State<HobbyHomeScreen> createState() => _HobbyHomeScreenState();
}

class _HobbyHomeScreenState extends State<HobbyHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HobbyProvider>(context, listen: false).fetchAllHobbies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hobby Rooms'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<HobbyProvider>(
        builder: (context, hobbyProvider, _) {
          if (hobbyProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Featured Section
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Featured Rooms',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 200.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            final titles = ['Chat Party', 'Meet Your Love'];
                            final subtitles = [
                              'Have fun with friends',
                              'Become cp with others'
                            ];
                            return GestureDetector(
                              onTap: () => _showRoomDetails(context, titles[index]),
                              child: Container(
                                width: 160.w,
                                margin: EdgeInsets.only(right: 12.w),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: index == 0
                                        ? [const Color(0xFFFFD700), const Color(0xFFFFA500)]
                                        : [const Color(0xFFFFB6C1), const Color(0xFFFF69B4)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 12.h,
                                      left: 12.w,
                                      right: 12.w,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            titles[index],
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            subtitles[index],
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white70,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 12.h,
                                      right: 12.w,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                        child: Text(
                                          '234 online',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Available Hobbies
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Browse Hobbies',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: hobbyProvider.hobbiesList.length,
                  itemBuilder: (context, index) {
                    final hobby = hobbyProvider.hobbiesList[index];
                    return GestureDetector(
                      onTap: () => hobbyProvider.selectHobby(hobby.id),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hobby.title,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textPrimaryColor,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                hobby.description,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppTheme.textSecondaryColor,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.people,
                                        size: 14.sp,
                                        color: AppTheme.textSecondaryColor,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '${hobby.followers} followers',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: AppTheme.textSecondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 14.sp,
                                        color: AppTheme.accentColor,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '${hobby.rating}',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateHobbyDialog(context),
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showRoomDetails(BuildContext context, String roomName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Joining $roomName...')),
    );
  }

  void _showCreateHobbyDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    String selectedCategory = 'Entertainment';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create New Hobby'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Hobby Title'),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 12.h),
            DropdownButton<String>(
              value: selectedCategory,
              items: [
                'Entertainment',
                'Arts & Creativity',
                'Sports',
                'Education',
              ]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  selectedCategory = value;
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<HobbyProvider>(context, listen: false)
                  .createHobby(
                titleController.text,
                descriptionController.text,
                selectedCategory,
                [],
              );
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
