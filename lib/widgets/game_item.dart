import 'package:demomobxprovider/models/game_model.dart';
import 'package:demomobxprovider/widgets/game_item_image.dart';
import 'package:demomobxprovider/widgets/game_item_rating.dart';
import 'package:flutter/material.dart';

class GameItem extends StatelessWidget {
  const GameItem({Key? key, required this.gameData}) : super(key: key);

  final GameData gameData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.withOpacity(.15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GameItemImageView(backgroundImage: gameData.backgroundImage),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gameData.name ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                _height5(),
                Text(
                  'Reviews Text: ${gameData.reviewsTextCount ?? ''}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
                _height5(),
                GamesItemRatingView(rating: gameData.rating ?? 0.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _height5() => const SizedBox(
        height: 5,
      );
}
