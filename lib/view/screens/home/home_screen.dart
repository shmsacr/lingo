import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';
import 'package:lingo/view/screens/home/add_word_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.padding.low,
            child: Card(
              child: Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
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
                child: ListTile(
                  onTap: () => _showDetail(context),
                  leading: IconButton(
                    onPressed: () async {},
                    icon: Icon(Icons.volume_up_rounded),
                  ),
                  title: CustomTextWidget(text: 'text $index'),
                  subtitle: CustomTextWidget(
                    text: 'text $index',
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<void> _showDetail(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 20,
        title: Column(
          children: [
            CustomTextWidget(text: 'Amazing'),
            CustomTextWidget(text: '( Harika )'),
          ],
        ),
        content: CustomTextWidget(
          text: '( Eş Anlam : Astonishing)',
          fontWeight: FontWeight.normal,
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(text: 'Örnek Cümle'),
              CustomTextWidget(
                  text:
                      'dadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata'),
            ],
          ),
        ],
      );
    },
  );
}
