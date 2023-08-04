import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/words_controller.dart';
import 'package:lingo/view/screens/home/add_word_screen.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:search_page/search_page.dart';

import '../../../data/model/word_model.dart';
import '../../widget/custom_text_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final _fetchWordsUpdate = ref.watch(wordListNotifier).words;
    // final _wordProviderNotifier = ref.read(wordListNotifier.notifier);
    // final _isLoading = ref.watch(wordListNotifier).isLoading;

    final wordList = ref.watch(wordListNotifierProvider);
    final seacrhList = ref.watch(wordListNotifierProvider);

    // Widget _checkIsLoadingAndIsListEmpty() {
    //   if (_isLoading == true) {
    //     return Center(
    //       child: CircularProgressIndicator(
    //         color: AppColors.darkTheme,
    //       ),
    //     );
    //   } else if (_fetchWordsUpdate?.isEmpty == true) {
    //     return Center(child: CustomTextWidget(text: 'Kelime Ekleyiniz'));
    //   } else {
    //     return _HomeBody(
    //         fetchWordsUpdate: _fetchWordsUpdate,
    //         wordProviderNotifier: _wordProviderNotifier);
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Lingo", textAlign: TextAlign.center),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addWord');
          },
          icon: Icon(Icons.add),
        ),
        actions: [
          IconButton(
            onPressed: () => showSearch(
                context: context,
                delegate: SearchPage(
                  onQueryUpdate: print,
                  items: seacrhList,
                  searchLabel: 'Search people',
                  suggestion: const Center(
                    child: Text('Filter people by name, surname or age'),
                  ),
                  builder: (searchWord) =>
                      buildPadding(context, ref, searchWord),
                  filter: (searchWord) => [searchWord.means, searchWord.word],
                )),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: wordList.isEmpty
          ? Center(child: Text("Kelime ekleyin"))
          : Padding(
              padding: context.padding.onlyLeftNormal,
              child: SizedBox(
                width: context.general.mediaQuery.size.width * 0.9,
                child: ListView.builder(
                  itemCount: wordList.length,
                  itemBuilder: (context, index) {
                    final isdata = wordList[index];
                    return buildPadding(context, ref, isdata);
                  },
                ),
              ),
            ),
    );
  }

  Padding buildPadding(BuildContext context, WidgetRef ref, Words isdata) {
    return Padding(
      padding: context.padding.low,
      child: Card(
        child: Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  ref
                      .read(wordListNotifierProvider.notifier)
                      .deleteWord(isdata);
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
                            )),
                  );
                },
                backgroundColor: Colors.orange,
                icon: Icons.edit,
              ),
            ],
          ),
          child: ListTile(
            horizontalTitleGap: context.general.mediaQuery.size.width * 0.2,
            titleAlignment: ListTileTitleAlignment.center,
            onTap: () => _showDetail(context, isdata),
            leading: IconButton(
              onPressed: () async {
                ref.read(wordListNotifierProvider.notifier).speak(isdata.word);
              },
              icon: Icon(
                Icons.volume_up_rounded,
                color: AppColors.appGeneralDarkGrey,
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
      ),
    );
  }

  Future<void> _showDetail(BuildContext context, Words words) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.appGeneralDarkGrey,
          title: Card(
            child: ListTile(
              title: CustomTextWidget(text: words.word),
              subtitle: CustomTextWidget(text: words.means),
            ),
          ),
          content: Card(
            child: ListTile(
              title: CustomTextWidget(text: "Eş Anlamlısı"),
              subtitle:
                  CustomTextWidget(text: words.spouse ?? "Eş anlam ekleyin"),
            ),
          ),
          actions: [
            Card(
              child: ListTile(
                title: CustomTextWidget(text: "Cumle içinde kullanımı"),
                subtitle:
                    CustomTextWidget(text: words.spouse ?? "Cumle ekleyin"),
              ),
            ),
          ],
        );
      },
    );
  }
}
