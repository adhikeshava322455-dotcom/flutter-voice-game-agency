import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../config/theme.dart';
import '../../providers/agency_provider.dart';
import '../../models/agency_model.dart';

class AgencyManagementScreen extends StatefulWidget {
  const AgencyManagementScreen({Key? key}) : super(key: key);

  @override
  State<AgencyManagementScreen> createState() =>
      _AgencyManagementScreenState();
}

class _AgencyManagementScreenState extends State<AgencyManagementScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        title: const Text('Agency Management'),
        elevation: 0,
      ),
      body: Consumer<AgencyProvider>(
        builder: (context, agencyProvider, _) {
          final agency = agencyProvider.currentAgency;

          if (agency == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.business,
                    size: 60.sp,
                    color: AppTheme.primaryColor,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No Agency Yet',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Create or join an agency to get started',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppTheme.textSecondaryColor,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () => _showCreateAgencyDialog(context),
                    child: const Text('Create Agency'),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Agency Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.primaryColor,
                        AppTheme.secondaryColor,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.business,
                            size: 40.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        agency.name,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        agency.description,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                '${agency.totalMembers}',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Members',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    size: 16.sp,
                                    color: AppTheme.goldColor,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '${agency.totalCoins}',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Coins',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.diamond,
                                    size: 16.sp,
                                    color: AppTheme.diamondColor,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '${agency.totalDiamonds}',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Diamonds',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Tabs
                TabBar(
                  controller: _tabController,
                  labelColor: AppTheme.primaryColor,
                  unselectedLabelColor: AppTheme.textSecondaryColor,
                  indicatorColor: AppTheme.primaryColor,
                  tabs: const [
                    Tab(text: 'Members'),
                    Tab(text: 'Performance'),
                    Tab(text: 'Settings'),
                  ],
                ),
                SizedBox(
                  height: 400.h,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Members Tab
                      _buildMembersTab(agency),
                      // Performance Tab
                      _buildPerformanceTab(agency),
                      // Settings Tab
                      _buildSettingsTab(agency),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showInviteDialog(context),
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.person_add),
      ),
    );
  }

  Widget _buildMembersTab(Agency agency) {
    return ListView.builder(
      padding: EdgeInsets.all(12.w),
      itemCount: agency.memberIds.length + agency.managerIds.length,
      itemBuilder: (context, index) {
        final isManager = index < agency.managerIds.length;
        final memberId = isManager
            ? agency.managerIds[index]
            : agency.memberIds[index - agency.managerIds.length];

        return Container(
          margin: EdgeInsets.only(bottom: 8.h),
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primaryColor.withOpacity(0.1),
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 20.sp,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User $memberId',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      isManager ? 'Manager' : 'Member',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: isManager
                            ? AppTheme.primaryColor
                            : AppTheme.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14.sp,
                color: AppTheme.textSecondaryColor,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPerformanceTab(Agency agency) {
    return ListView(
      padding: EdgeInsets.all(12.w),
      children: [
        Text(
          'Agency Statistics',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.blue, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Earnings',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppTheme.textSecondaryColor,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on,
                    size: 20.sp,
                    color: AppTheme.goldColor,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '${agency.totalCoins} Coins',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsTab(Agency agency) {
    return ListView(
      padding: EdgeInsets.all(12.w),
      children: [
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit Agency Info'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Privacy Settings'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Notifications'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
      ],
    );
  }

  void _showInviteDialog(BuildContext context) {
    final phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Invite Member'),
        content: TextField(
          controller: phoneController,
          decoration: const InputDecoration(
            hintText: 'Enter phone number',
            prefixIcon: Icon(Icons.phone),
          ),
          keyboardType: TextInputType.phone,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Invitation sent successfully'),
                ),
              );
              Navigator.pop(context);
            },
            child: const Text('Invite'),
          ),
        ],
      ),
    );
  }

  void _showCreateAgencyDialog(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Agency'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Agency Name'),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
              maxLines: 3,
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
              Provider.of<AgencyProvider>(context, listen: false)
                  .createAgency(
                nameController.text,
                descriptionController.text,
                'user_123',
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
