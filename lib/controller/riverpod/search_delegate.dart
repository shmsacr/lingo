import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/speaker_controller.dart';
import 'package:lingo/data/model/word_model.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

class SearchWords extends SearchDelegate<Words> {
  final List<Words> wordsList;
  List<Words> results = [];
  final WidgetRef ref;
  Words? isdata;
  SearchWords({required this.wordsList, required this.ref, this.isdata});

  void deleteWord(String wordToDelete) {
    wordsList.removeWhere(
        (word) => word.means.toLowerCase() == wordToDelete.toLowerCase());
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, Words(word: '', means: '', id: ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        isdata = results[index];
        return Card(
          elevation: 10,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 40),
            titleAlignment: ListTileTitleAlignment.center,
            // onTap: () => _showBottomSheet(isdata),
            trailing: IconButton(
              onPressed: () async {
                speak(isdata!.word);
              },
              icon: Icon(
                Icons.volume_up_rounded,
                color: AppColors.appBlue,
              ),
            ),
            title: CustomTextWidget(
              text: isdata!.word,
              fontsize: context.general.textTheme.titleMedium?.fontSize,
              fontWeight: FontWeight.w900,
            ),
            subtitle: CustomTextWidget(
              text: isdata!.means,
              fontWeight: FontWeight.w500,
              fontsize: context.general.textTheme.titleMedium?.fontSize,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? wordsList
        : wordsList
            .where((word) =>
                word.word.toLowerCase().contains(query.toLowerCase()) ||
                word.means.toLowerCase().contains(query.toLowerCase()))
            .toList();
    if (suggestions.isEmpty) {
      return Center(child: Text('Kelime bulunamadı'));
    }
    results = suggestions;

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        isdata = results[index];
        return Card(
          elevation: 10,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 40),
            titleAlignment: ListTileTitleAlignment.center,
            // onTap: () => _showBottomSheet(isdata),
            trailing: IconButton(
              onPressed: () async {
                speak(isdata!.word);
              },
              icon: Icon(
                Icons.volume_up_rounded,
                color: AppColors.appBlue,
              ),
            ),
            title: CustomTextWidget(
              text: isdata!.word,
              fontsize: context.general.textTheme.titleMedium?.fontSize,
              fontWeight: FontWeight.w900,
            ),
            subtitle: CustomTextWidget(
              text: isdata!.means,
              fontWeight: FontWeight.w500,
              fontsize: context.general.textTheme.titleMedium?.fontSize,
            ),
          ),
        );
      },
    );
  }
}
