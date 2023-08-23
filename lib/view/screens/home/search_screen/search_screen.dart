// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:kartal/kartal.dart';
// import 'package:lingo/controller/riverpod/words_controller.dart';
// import 'package:lingo/data/model/word_model.dart';
// import 'package:lingo/view/screens/home/add_word_screen/add_word_screen.dart';
// import 'package:lingo/view/theme/app_colors.dart';
// import 'package:lingo/view/widget/custom_text_widget.dart';

// class SearchScreen extends ConsumerStatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends ConsumerState<SearchScreen> {
//   final TextEditingController searchController = TextEditingController();

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final searchList = ref.watch(wordListNotifierProvider.notifier).searchList;

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: TextField(
//           controller: searchController,
//           onChanged: (value) {
//             ref.watch(wordListNotifierProvider.notifier).searchWords(value);
//             print('searchList ${searchList.length}');
//             print(value);
//           },
//           decoration: InputDecoration(
//             hintText: 'Search',
//             border: InputBorder.none,
//             prefixIcon: const Icon(Icons.search),
//           ),
//         ),
//       ),
//       body: searchList.isNotEmpty
//           ? ListView.builder(
//               itemCount: searchList.length,
//               itemBuilder: (context, index) {
//                 final isdata = searchList[index];

//                 return Slidable(
//                   endActionPane: ActionPane(
//                     motion: ScrollMotion(),
//                     children: [
//                       SlidableAction(
//                         onPressed: (_) {
//                           ref
//                               .read(wordListNotifierProvider.notifier)
//                               .deleteWord(isdata);
//                         },
//                         backgroundColor: Colors.red,
//                         icon: Icons.delete,
//                       ),
//                       SlidableAction(
//                         onPressed: (context) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute<AddWord>(
//                               builder: (context) => AddWord(
//                                 myWords: isdata,
//                               ),
//                             ),
//                           );
//                         },
//                         backgroundColor: Colors.orange,
//                         icon: Icons.edit,
//                       ),
//                     ],
//                   ),
//                   child: Card(
//                     elevation: 10,
//                     child: ListTile(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 40),
//                       titleAlignment: ListTileTitleAlignment.center,
//                       onTap: () => _showBottomSheet(isdata),
//                       trailing: IconButton(
//                         onPressed: () async {
//                           ref
//                               .read(wordListNotifierProvider.notifier)
//                               .speak(isdata.word);
//                         },
//                         icon: Icon(
//                           Icons.volume_up_rounded,
//                           color: AppColors.appBlue,
//                         ),
//                       ),
//                       title: CustomTextWidget(
//                         text: isdata.word,
//                         fontsize:
//                             context.general.textTheme.titleMedium?.fontSize,
//                         fontWeight: FontWeight.w900,
//                       ),
//                       subtitle: CustomTextWidget(
//                         text: isdata.means,
//                         fontWeight: FontWeight.w500,
//                         fontsize:
//                             context.general.textTheme.titleMedium?.fontSize,
//                       ),
//                     ),
//                   ),
//                 );
//               })
//           : const Center(child: Text('No data')),
//     );
//   }

//   Future<void> _showBottomSheet(Words words) async {
//     return await showModalBottomSheet(
//         backgroundColor: Colors.transparent,
//         context: context,
//         builder: (BuildContext context) {
//           return ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30),
//             ),
//             child: Container(
//               color: AppColors.appBlue,
//               height: context.general.mediaQuery.size.height * 0.5,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   ListTile(
//                     title: Center(
//                       child: CustomTextWidget(
//                         text: words.word,
//                         color: Colors.white,
//                         fontsize:
//                             context.general.textTheme.headlineSmall?.fontSize,
//                       ),
//                     ),
//                     subtitle: Center(
//                       child: CustomTextWidget(
//                         text: words.means,
//                         color: Colors.white,
//                         fontsize:
//                             context.general.textTheme.headlineSmall?.fontSize,
//                       ),
//                     ),
//                   ),
//                   Divider(
//                     color: Colors.white,
//                   ),
//                   ListTile(
//                     title: CustomTextWidget(text: "Words"),
//                     subtitle: CustomTextWidget(
//                       text: words.spouse ?? "Words Eş anlamı yok",
//                       color: Colors.white,
//                     ),
//                     trailing: IconButton(
//                       onPressed: () {
//                         ref
//                             .read(wordListNotifierProvider.notifier)
//                             .speak(words.word);
//                       },
//                       icon: Icon(
//                         Icons.volume_up_rounded,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Divider(
//                     color: Colors.white,
//                   ),
//                   ListTile(
//                     title: CustomTextWidget(text: "Cümle içinde kullanımı"),
//                     subtitle: CustomTextWidget(
//                       text: words.spouse ??
//                           "This is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a wordThis is a word",
//                       color: Colors.white,
//                     ),
//                     trailing: IconButton(
//                       onPressed: () {
//                         ref
//                             .read(wordListNotifierProvider.notifier)
//                             .speak(words.word);
//                       },
//                       icon: Icon(
//                         Icons.volume_up_rounded,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
