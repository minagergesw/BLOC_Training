import 'package:dloc_training/Bussiness_Logic/cubit/characters_cubit.dart';
import 'package:dloc_training/Data/Models/Character.dart';
import 'package:dloc_training/UI/Widgets/GridviewTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Character> allCharacters;
  late List<Character> searchedforcharacters;
  bool _isSearching = false;
  final _textFieldController = TextEditingController();

  @override
  void initState() {
    allCharacters = BlocProvider.of<CharactersCubit>(context).getCharacters();

    super.initState();
  }

  Widget _Search() {
    return TextField(
      controller: _textFieldController,
      decoration: InputDecoration(
          hintText: 'Find a character...',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white, fontSize: 18)),
      style: TextStyle(color: Colors.white, fontSize: 18),
      onChanged: (value) {
        SearchedCharacters(value);
      },
    );
  }

  void SearchedCharacters(String value) {
    searchedforcharacters = allCharacters
        .where((character) => character.name.toLowerCase().startsWith(value))
        .toList();
    setState(() {
      print(searchedforcharacters);
    });
  }

  List<Widget> _appbarwidgets() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              setState(() {
                _textFieldController.clear();
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.clear)),
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              ModalRoute.of(context)!
                  .addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
                setState(() {
                  _textFieldController.clear();
                  _isSearching = false;
                });
              }));
              setState(() {
                _isSearching = true;
              });
            },
            icon: Icon(Icons.search_rounded))
      ];
    }
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;

          return BuildLoadedWidgets();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget BuildLoadedWidgets() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _textFieldController.text.isEmpty
            ? allCharacters.length
            : searchedforcharacters.length,
        itemBuilder: (context, index) {
          return GridviewTile(
            character: _textFieldController.text.isEmpty
                ? allCharacters[index]
                : searchedforcharacters[index],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        
        elevation: 0,
        title: _isSearching ? _Search() : Text('Characters'),
        actions: _appbarwidgets(),
      ),
      body: BuildBlocWidget(),
    );
  }
}
