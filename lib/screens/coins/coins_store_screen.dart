import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../config/theme.dart';
import '../../providers/coins_provider.dart';

class CoinsStoreScreen extends StatelessWidget {
  const CoinsStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coinPackages = [
      {'coins': 100, 'price': '\$0.99', 'bonus': 0},
      {'coins': 500, 'price': '\$4.99', 'bonus': 50},
      {'coins': 1000, 'price': '\$9.99', 'bonus': 200},
      {'coins': 5000, 'price': '\$39.99', 'bonus': 1500},
      {'coins': 10000, 'price': '\$69.99', 'bonus': 3500},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coins Store'),
        elevation: 0,
      ),
      body: Consumer<CoinsProvider>(
        builder: (context, coinsProvider, _) {
          return Column(
            children: [
              // Current Balance
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
                    Text(
                      'Your Balance',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: AppTheme.goldColor,
                          size: 32.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${coinsProvider.coins}',
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Coin Packages
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(16.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.w,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: coinPackages.length,
                  itemBuilder: (context, index) {
                    final package = coinPackages[index];
                    final hasBonus = package['bonus'] as int > 0;

                    return GestureDetector(
                      onTap: () => _showPurchaseDialog(
                        context,
                        package['coins'] as int,
                        package['price'] as String,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.goldColor.withOpacity(0.3),
                              AppTheme.goldColor.withOpacity(0.1),
                            ],
                          ),
                          border: Border.all(
                            color: AppTheme.goldColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.monetization_on,
                              color: AppTheme.goldColor,
                              size: 40.sp,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              '${package['coins']}',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            if (hasBonus)
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.successColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  '+${package['bonus']} Bonus',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            const Spacer(),
                            Text(
                              package['price'] as String,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryColor,
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
          );
        },
      ),
    );
  }

  void _showPurchaseDialog(BuildContext context, int coins, String price) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Purchase Coins'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$coins Coins',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Price: $price',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppTheme.primaryColor,
              ),
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
              Provider.of<CoinsProvider>(context, listen: false)
                  .purchaseCoins(coins);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Purchase successful!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Purchase'),
          ),
        ],
      ),
    );
  }
}
