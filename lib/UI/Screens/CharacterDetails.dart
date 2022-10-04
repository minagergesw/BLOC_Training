import 'package:dloc_training/Data/Models/Character.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;
  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        ImageAppBar(character: character),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Job : ${character.jobs.join(' / ')}',
                  style:
                      TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.black,
                  height: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Appeared in : ${character.category}',
                  style:
                      TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.black,
                  height: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Seasons : ${character.appearanceOfFirstSeries.join(' / ')}',
                  style:
                      TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.black,
                  height: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Status : ${character.deadOrAlive}',
                  style:
                      TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.black,
                  height: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                character.appearanceOfSecondSeries.isNotEmpty
                    ? Text(
                        'Better Call Saul : ${character.appearanceOfSecondSeries.join(' / ')}',
                        style: TextStyle(
                            fontSize: 20, overflow: TextOverflow.ellipsis),
                      )
                    : Container(),
                SizedBox(
                  height: 5,
                ),
                 character.appearanceOfSecondSeries.isNotEmpty?
                Divider(
                  color: Colors.black,
                  height: 2,
                ):Container(),SizedBox(
                  height: 5,
                ),
                Text(
                  'Actor/Actress : ${character.actorName}',
                  style:
                      TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 5,
                ),
               SizedBox(height: 20,)
              ],
            ),
          ),SizedBox(height: 500,)
        ]))
      ]),
    );
  }
}

class ImageAppBar extends StatelessWidget {
  const ImageAppBar({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 500,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(character.nickname),
        background: Hero(
            tag: character.charId,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
