import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/speaker_controller.dart';
import 'package:lingo/data/model/word_model.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

import '../../view/screens/home/add_word_screen/add_word_screen.dart';
import 'db_controller.dart';

class SearchWords extends SearchDelegate<Words> {
  final WidgetRef ref;
  final List<Words> words;
  SearchWords({required this.ref, required this.words});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    ref.invalidate(wordsProvider);
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context,
            Words(word: '', means: '', id: '', addedDate: DateTime.now()));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Words> matchQuery = [];

    for (var fruit in words) {
      if (fruit.word.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (
          context,
          index,
        ) {
          final isdata = matchQuery[index];
          return Slidable(
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    setState(() {
                      ref.watch(deleteWordProvider(isdata));
                      ref.invalidate(wordsProvider);
                      matchQuery.remove(isdata);
                    });
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                ),
                SlidableAction(
                  onPressed: (context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<AddWord>(
                        builder: (context) => AddWord(
                          myWords: isdata,
                        ),
                      ),
                    );
                  },
                  backgroundColor: Colors.orange,
                  icon: Icons.edit,
                ),
              ],
            ),
            child: Card(
              elevation: 10,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                titleAlignment: ListTileTitleAlignment.center,
                // onTap: () => _showBottomSheet(isdata),
                trailing: IconButton(
                  onPressed: () async {
                    speak(isdata.word);
                  },
                  icon: Icon(
                    Icons.volume_up_rounded,
                    color: AppColors.appBlue,
                  ),
                ),
                title: CustomTextWidget(
                  text: isdata.word,
                  fontsize: context.general.textTheme.titleMedium?.fontSize,
                  fontWeight: FontWeight.w900,
                ),
                subtitle: CustomTextWidget(
                  text: isdata.means,
                  fontWeight: FontWeight.w500,
                  fontsize: context.general.textTheme.titleMedium?.fontSize,
                ),
              ),
            ),
          );
        },
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Words> matchQuery = [];

    for (var fruit in words) {
      if (fruit.word.toLowerCase().contains(query.toLowerCase()) ||
          fruit.means.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (
          context,
          index,
        ) {
          final isdata = matchQuery[index];
          return Slidable(
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    setState(() {
                      ref.watch(deleteWordProvider(isdata));
                      ref.invalidate(wordsProvider);
                      matchQuery.remove(isdata);
                    });
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                ),
                SlidableAction(
                  onPressed: (context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<AddWord>(
                        builder: (context) => AddWord(
                          myWords: isdata,
                        ),
                      ),
                    );
                  },
                  backgroundColor: Colors.orange,
                  icon: Icons.edit,
                ),
              ],
            ),
            child: Card(
              elevation: 10,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                titleAlignment: ListTileTitleAlignment.center,
                // onTap: () => _showBottomSheet(isdata),
                trailing: IconButton(
                  onPressed: () async {
                    speak(isdata.word);
                  },
                  icon: Icon(
                    Icons.volume_up_rounded,
                    color: AppColors.appBlue,
                  ),
                ),
                title: CustomTextWidget(
                  text: isdata.word,
                  fontsize: context.general.textTheme.titleMedium?.fontSize,
                  fontWeight: FontWeight.w900,
                ),
                subtitle: CustomTextWidget(
                  text: isdata.means,
                  fontWeight: FontWeight.w500,
                  fontsize: context.general.textTheme.titleMedium?.fontSize,
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
