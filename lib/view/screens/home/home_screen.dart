import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';
import 'package:lingo/core/const/string_const.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        title: CustomTextWidget(
          text: StringConst.appNameTitle,
          fontsize: context.general.textTheme.titleLarge?.fontSize,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 35,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: context.padding.onlyLeftNormal,
        child: SizedBox(
          width: context.general.mediaQuery.size.width * 0.9,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: context.padding.low,
                child: Card(
                  elevation: 2,
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
                    child: SizedBox(
                      child: ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        onTap: () => _showDetail(context),
                        leading: IconButton(
                          onPressed: () async {},
                          icon: Icon(
                            Icons.volume_up_rounded,
                            color: Colors.black,
                          ),
                        ),
                        title: Center(
                            child: CustomTextWidget(text: 'Hello $index')),
                        subtitle: Center(
                          child: CustomTextWidget(
                              text: 'Hello $index',
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
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
