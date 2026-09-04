import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../config/theme.dart';
import '../../providers/coins_provider.dart';
import '../../models/game_model.dart';

class GamesListScreen extends StatefulWidget {
  const GamesListScreen({Key? key}) : super(key: key);

  @override
  State<GamesListScreen> createState() => _GamesListScreenState();
}

class _GamesListScreenState extends State<GamesListScreen> {
  final List<Game> games = [
    Game(
      id: 'game_1',
      title: 'Dice Rolling',
      description: 'Roll dice and match numbers with other players',
      imageUrl: '',
      category: 'Classic',
      minPlayers: 2,
      maxPlayers: 8,
      coinsReward: 500,
      diamondsReward: 25,
      duration: 300,
      rules: [
        'Roll the dice to get the highest number',
        'Best of 3 rounds wins',
        'Each player gets 3 chances per round'
      ],
      requiresVoiceChat: true,
      rating: 4.8,
    ),
    Game(
      id: 'game_2',
      title: 'Card Battle',
      description: 'Strategic card game with real-time multiplayer',
      imageUrl: '',
      category: 'Strategy',
      minPlayers: 2,
      maxPlayers: 4,
      coinsReward: 750,
      diamondsReward: 35,
      duration: 600,
      rules: [
        'Draw cards and build your strategy',
        'Highest card value wins the round',
        'Best of 5 rounds wins the game'
      ],
      requiresVoiceChat: false,
      rating: 4.6,
    ),
    Game(
      id: 'game_3',
      title: 'Word Challenge',
      description: 'Fast-paced word guessing game',
      imageUrl: '',
      category: 'Puzzle',
      minPlayers: 2,
      maxPlayers: 6,
      coinsReward: 400,
      diamondsReward: 20,
      duration: 180,
      rules: [
        'Guess the word before time runs out',
        'Earn points for correct guesses',
        'Difficulty increases with each round'
      ],
      requiresVoiceChat: false,
      rating: 4.7,
    ),
    Game(
      id: 'game_4',
      title: 'Trivia Night',
      description: 'Answer trivia questions and compete with friends',
      imageUrl: '',
      category: 'Education',
      minPlayers: 2,
      maxPlayers: 10,
      coinsReward: 600,
      diamondsReward: 30,
      duration: 900,
      rules: [
        'Answer multiple choice questions',
        'Earn points for correct answers',
        'Fastest correct answer gets bonus points'
      ],
      requiresVoiceChat: true,
      rating: 4.9,
    ),
    Game(
      id: 'game_5',
      title: 'Memory Master',
      description: 'Test your memory with cards and patterns',
      imageUrl: '',
      category: 'Brain Game',
      minPlayers: 1,
      maxPlayers: 4,
      coinsReward: 350,
      diamondsReward: 15,
      duration: 240,
      rules: [
        'Match pairs of cards',
        'Remember card positions',
        'Most pairs wins'
      ],
      requiresVoiceChat: false,
      rating: 4.5,
    ),
  ];

  String selectedCategory = 'All';
  final categories = ['All', 'Classic', 'Strategy', 'Puzzle', 'Education', 'Brain Game'];

  @override
  Widget build(BuildContext context) {
    final filteredGames = selectedCategory == 'All'
        ? games
        : games.where((g) => g.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Filter
          SizedBox(
            height: 50.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppTheme.primaryColor
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : AppTheme.textPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Games List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12.w),
              itemCount: filteredGames.length,
              itemBuilder: (context, index) {
                final game = filteredGames[index];

                return GestureDetector(
                  onTap: () => _showGameDetails(context, game),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12.h),
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
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppTheme.primaryColor.withOpacity(0.8),
                                AppTheme.secondaryColor.withOpacity(0.8),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.r),
                              topRight: Radius.circular(12.r),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.sports_esports,
                              size: 60.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          game.title,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          game.description,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppTheme.textSecondaryColor,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 14.sp,
                                            color: AppTheme.accentColor,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            '${game.rating}',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
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
                                        size: 12.sp,
                                        color: AppTheme.textSecondaryColor,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '${game.minPlayers}-${game.maxPlayers} players',
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
                                        Icons.monetization_on,
                                        size: 12.sp,
                                        color: AppTheme.goldColor,
                                      ),
                                      SizedBox(width: 2.w),
                                      Text(
                                        '${game.coinsReward}',
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
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showGameDetails(BuildContext context, Game game) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              game.title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              game.description,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppTheme.textSecondaryColor,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Rules:',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            ...game.rules.asMap().entries.map((e) {
              return Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Text(
                  '${e.key + 1}. ${e.value}',
                  style: TextStyle(fontSize: 12.sp),
                ),
              );
            }).toList(),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CoinsProvider>(context, listen: false)
                      .addCoins(game.coinsReward);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Game started! Earn ${game.coinsReward} coins',
                      ),
                    ),
                  );
                },
                child: const Text('Play Game'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
