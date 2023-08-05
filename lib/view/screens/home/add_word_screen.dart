import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lingo/controller/riverpod/words_controller.dart';
import 'package:lingo/view/theme/app_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

import '../../../data/model/word_model.dart';

class AddWord extends ConsumerStatefulWidget {
  final Words? myWords;
  const AddWord({
    this.myWords,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddWordState();
}

class _AddWordState extends ConsumerState<AddWord> {
  final _formKey = GlobalKey<FormBuilderState>();
  final uuid = Uuid().v1();
  late FocusNode _secondFieldFocusNode;

  @override
  void initState() {
    super.initState();
    _secondFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _formKey.currentState?.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wordCt = ref.read(wordListNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Kelime Ekle"),
        backgroundColor: AppColors.appGeneralDarkGrey,
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
                    style: TextStyle(color: AppColors.appGeneralDarkGrey),
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
                    style: TextStyle(color: AppColors.appGeneralDarkGrey),
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
                    style: TextStyle(color: AppColors.appGeneralDarkGrey),
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
                    style: TextStyle(color: AppColors.appGeneralDarkGrey),
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
                        final Words words = Words.fromJson({
                          "word": _formKey.currentState!.value["word"],
                          "means": _formKey.currentState!.value["means"],
                          "spouse": _formKey.currentState?.value["spouse"],
                          "sentence": _formKey.currentState?.value["sentence"],
                          "id": widget.myWords?.id == null
                              ? uuid
                              : widget.myWords!.id
                        });

                        try {
                          wordCt.addWord(words);
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
                      color: Colors.white,
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
