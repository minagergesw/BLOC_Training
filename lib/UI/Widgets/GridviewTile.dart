import 'package:dloc_training/Bussiness_Logic/cubit/characters_cubit.dart';
import 'package:dloc_training/Data/Models/Character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class GridviewTile extends StatefulWidget {
  final Character character;
  const GridviewTile({super.key, required this.character});

  @override
  State<GridviewTile> createState() => _GridviewTileState();
}

class _GridviewTileState extends State<GridviewTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      child: InkWell(
        onTap: () {
          GoRouter.of(context)
              .pushNamed('/character_screen', extra: widget.character);
        },
        child:ClipRRect(borderRadius: BorderRadius.circular(18),
            child:  GridTile(
            child: Hero(
              tag: widget.character.charId,
              child: widget.character.image.isNotEmpty
                  ? Image.network(
                      widget.character.image == null
                          ? ''
                          : widget.character.image,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress?.cumulativeBytesLoaded ==
                            loadingProgress?.expectedTotalBytes) {
                          return Image.network(
                            widget.character.image,
                            fit: BoxFit.cover,
                          );
                        }
                        return Image.asset(
                          'assets/images/loading.gif',
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/loading.gif');
                      },
                    )
                  : Image.asset(
                      'assets/images/placeholder.png',
                      fit: BoxFit.cover,
                    ),
            ),
            footer: Container(
              width: double.infinity,
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(color: Colors.black54,),
              child: Text(
                widget.character.name,
                style: TextStyle(color: Colors.white70,fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
