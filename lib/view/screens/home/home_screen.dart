import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/search_delegate.dart';
import 'package:lingo/controller/riverpod/search_text_field.controller.dart';
import 'package:lingo/controller/riverpod/speaker_controller.dart';
import 'package:lingo/view/screens/home/add_word_screen/add_word_screen.dart';
import 'package:lingo/view/theme/app_colors.dart';

import '../../../controller/riverpod/db_controller.dart';
import '../../../controller/theme_controller.dart';
import '../../../data/model/word_model.dart';
import '../../widget/custom_text_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final wordList = ref.watch(wordsProvider);

    bool isDarkTheme = ref.watch(themeProvider);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
                color: isDarkTheme ? Color(0xff072027) : AppColors.appBlue),
          ),
          Positioned(
            top: 15,
            left: context.general.mediaQuery.size.width * 0.8,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchWords(ref: ref),
                );
              },
            ),
          ),
          _AddWordIconButton(),
          _TextLingoTitle(),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: context.padding.low,
                  child: wordList.when(
                    data: (isData) {
                      if (isData.isNotEmpty) {
                        return ListView.builder(
                          itemCount: isData.length,
                          itemBuilder: (context, index) {
                            final isdata = isData[index];
                            return buildPadding(context, ref, isdata);
                          },
                        );
                      } else {
                        return Center(
                          child: CustomTextWidget(
                            text: 'No result found',
                            fontsize: 24,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                    },
                    error: (error, stackTrace) => Text('Hata: $error'),
                    loading: () => SizedBox(
                      child: Center(child: CircularProgressIndicator()),
                      height: 70,
                      width: 70,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPadding(BuildContext context, WidgetRef ref, Words isdata) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              ref.watch(deleteWordProvider(isdata));
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
          onTap: () => _showBottomSheet(isdata),
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
  }

  Future<void> _showBottomSheet(Words words) async {
    return await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              color: AppColors.appBlue,
              height: context.general.mediaQuery.size.height * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    title: Center(
                      child: CustomTextWidget(
                        text: words.word,
                        color: Colors.white,
                        fontsize:
                            context.general.textTheme.headlineSmall?.fontSize,
                      ),
                    ),
                    subtitle: Center(
                      child: CustomTextWidget(
                        text: words.means,
                        color: Colors.white,
                        fontsize:
                            context.general.textTheme.headlineSmall?.fontSize,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    title: CustomTextWidget(text: "Words"),
                    subtitle: CustomTextWidget(
                      text: words.spouse ?? "Words Eş anlamı yok",
                      color: Colors.white,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        speak(words.word);
                      },
                      icon: Icon(
                        Icons.volume_up_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    title: CustomTextWidget(text: "Cümle içinde kullanımı"),
                    subtitle: CustomTextWidget(
                      text: words.spouse ??
                          "This is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a word",
                      color: Colors.white,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        speak(words.word);
                      },
                      icon: Icon(
                        Icons.volume_up_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class BuildTextField extends ConsumerStatefulWidget {
  const BuildTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends ConsumerState<BuildTextField> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.general.mediaQuery.size.height * 0.02,
      right: 0,
      left: 0,
      child: Align(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            width: context.general.mediaQuery.size.width * 0.7,
            height: context.general.mediaQuery.size.height * 0.06,
            child: TextField(
              onEditingComplete: () {
                ref.watch(searchTextFieldProvider.notifier).changeSearch();
              },
              onChanged: (value) {
                //   ref.watch(wordListNotifierProvider.notifier).filterWords(value);
              },
              style: TextStyle(color: AppColors.appBlue),
              decoration: _textFieldDecoration(context),
            ),
          )),
    );
  }

  InputDecoration _textFieldDecoration(BuildContext context) {
    return InputDecoration(
      contentPadding:
          EdgeInsets.symmetric(horizontal: context.padding.normal.horizontal),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      fillColor: Colors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white),
      ),
      hintText: 'Search',
      hintStyle: TextStyle(color: AppColors.appBlue),
    );
  }
}

class _TextLingoTitle extends ConsumerWidget {
  const _TextLingoTitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: context.general.mediaQuery.size.height * 0.02,
      right: 0,
      left: 0,
      child: Align(
        alignment: Alignment.center,
        child: CustomTextWidget(
          text: 'Lingo',
          color: Colors.white,
          fontsize: 30,
        ),
      ),
    );
  }
}

class _AddWordIconButton extends StatelessWidget {
  const _AddWordIconButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.general.mediaQuery.size.height * 0.02,
      right: context.general.mediaQuery.size.width * 0.9,
      left: 0,
      child: IconButton(
        icon: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/addWord');
        },
      ),
    );
  }
}
