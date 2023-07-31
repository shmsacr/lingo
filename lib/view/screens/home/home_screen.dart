import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/controller/riverpod/words_controller.dart';
import 'package:lingo/view/theme/app_colors.dart';

import '../../../data/model/word_model.dart';
import '../../widget/custom_text_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(wordListNotifier.notifier).fetchAndLoading());
  }

  @override
  Widget build(BuildContext context) {
    final _fetchWordsUpdate = ref.watch(wordListNotifier).words;
    final _wordProviderNotifier = ref.read(wordListNotifier.notifier);
    final _isLoading = ref.watch(wordListNotifier).isLoading;

    Widget _checkIsLoadingAndIsListEmpty() {
      if (_isLoading == true) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.darkTheme,
          ),
        );
      } else if (_fetchWordsUpdate?.isEmpty == true) {
        return Center(child: CustomTextWidget(text: 'Kelime Ekleyiniz'));
      } else {
        return _HomeBody(
            fetchWordsUpdate: _fetchWordsUpdate,
            wordProviderNotifier: _wordProviderNotifier);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("LİNGO", textAlign: TextAlign.center),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addWord');
          },
          icon: Icon(Icons.add),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: _checkIsLoadingAndIsListEmpty(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  _HomeBody({
    required List<Words>? fetchWordsUpdate,
    required WordListNotifier wordProviderNotifier,
  })  : _fetchWordsUpdate = fetchWordsUpdate,
        _wordProviderNotifier = wordProviderNotifier;

  final List<Words>? _fetchWordsUpdate;
  final WordListNotifier _wordProviderNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyLeftNormal,
      child: SizedBox(
        width: context.general.mediaQuery.size.width * 0.9,
        child: ListView.builder(
          itemCount: _fetchWordsUpdate?.length,
          itemBuilder: (context, index) {
            final isdata = _fetchWordsUpdate![index];

            return Padding(
              padding: context.padding.low,
              child: Card(
                elevation: 2,
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          _wordProviderNotifier.deleteWord(isdata);
                        },
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                      ),
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Colors.orange,
                        icon: Icons.edit,
                      ),
                    ],
                  ),
                  child: _HomeListTile(isdata: isdata),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HomeListTile extends StatelessWidget {
  const _HomeListTile({
    required this.isdata,
  });

  final Words isdata;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      onTap: () => _showDetail(context, isdata),
      leading: IconButton(
        onPressed: () async {},
        icon: Icon(
          Icons.volume_up_rounded,
          color: Colors.white,
        ),
      ),
      title: Center(
          child: CustomTextWidget(
        text: isdata.word,
        fontsize: 24,
      )),
      subtitle: Center(
        child: CustomTextWidget(
          text: isdata.means,
          fontWeight: FontWeight.w100,
          fontsize: 18,
          color: Colors.grey,
        ),
      ),
    );
  }
}

Future<void> _showDetail(BuildContext context, Words words) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 20,
        title: ListTile(
          title: Text(words.word),
          subtitle: Text(words.means),
        ),
        content: ListTile(
          title: Text("Eş Anlamlısı"),
          subtitle: Text(words.spouse ?? "Eş anlam ekleyin"),
        ),
        actions: [
          ListTile(
            title: Text("Cumle içinde kullanımı"),
            subtitle: Text(words.spouse ?? "Cumle ekleyin"),
          ),
        ],
      );
    },
  );
}
