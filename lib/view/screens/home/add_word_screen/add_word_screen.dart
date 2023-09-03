import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lingo/controller/riverpod/db_controller.dart';
import 'package:lingo/view/screens/suggested/suggested_screen.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:lingo/view/widget/custom_text_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

import '../../../../data/model/word_model.dart';

@RoutePage()
class AddWordScreen extends ConsumerStatefulWidget {
  final Words? myWords;
  const AddWordScreen({
    this.myWords,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddWordState();
}

class _AddWordState extends ConsumerState<AddWordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final uuid = Uuid().v1();

  @override
  void dispose() {
    _formKey.currentState?.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kelime Ekle"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (context) => SuggestedScreen(),
                    ));
              },
              child: CustomTextWidget(
                text: 'Kelime Önerileri',
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 16.0),
                  FormBuilderTextField(
                    style: TextStyle(color: AppColors.appBlue),
                    name: "word",
                    initialValue: widget.myWords?.word,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kelime',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: "Bu alan boş bırakılamaz."),
                      ],
                    ),
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(height: 16.0),
                  FormBuilderTextField(
                    style: TextStyle(color: AppColors.appBlue),
                    name: "means",
                    initialValue: widget.myWords?.means,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Karşılığı',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: "Bu alan boş bırakılamaz."),
                      ],
                    ),
                    inputFormatters: [
                      MaskTextInputFormatter(
                          mask:
                              "*********************************************************",
                          filter: {"*": RegExp('[a-zA-ZğüşıöçĞÜŞİÖÇ ]')}),
                    ],
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(height: 16.0),
                  FormBuilderTextField(
                    style: TextStyle(color: AppColors.appBlue),
                    name: "spouse",
                    initialValue: widget.myWords?.spouse,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Eş Anlamı',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(height: 16.0),
                  FormBuilderTextField(
                    style: TextStyle(color: AppColors.appBlue),
                    name: "sentence",
                    initialValue: widget.myWords?.sentence,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Bir cumle icinde kullanımı',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        DateTime now = DateTime.now();
                        final Words words = Words.fromJson({
                          "word": _formKey.currentState!.value["word"],
                          "means": _formKey.currentState!.value["means"],
                          "spouse": _formKey.currentState?.value["spouse"],
                          "sentence": _formKey.currentState?.value["sentence"],
                          "id": widget.myWords?.id == null
                              ? uuid
                              : widget.myWords!.id,
                          "addedDate": now.toString()
                        });

                        try {
                          ref.read(addWordProvider(words));
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text("Kelimesi eklendi: ${words.word}")),
                            );
                          }
                        } catch (e) {
                          debugPrint(e.toString());
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("$e")));
                        }
                      } else {
                        debugPrint("Error");
                        return;
                      }
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.check,
                      color: AppColors.appBlue,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
