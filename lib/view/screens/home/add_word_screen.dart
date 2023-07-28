import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

import '../../../controller/words_controller.dart';
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
        backgroundColor: Color(0xf8f8f8),
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
                  FormBuilderTextField(
                    name: "word",
                    initialValue: widget.myWords?.word,
                    decoration: const InputDecoration(labelText: 'Kelime'),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: "Bu alan boş bırakılamaz."),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  FormBuilderTextField(
                    name: "means",
                    initialValue: widget.myWords?.means,
                    decoration: const InputDecoration(labelText: 'Karşılığı'),
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
                  ),
                  const SizedBox(height: 16.0),
                  FormBuilderTextField(
                    name: "spouse",
                    initialValue: widget.myWords?.spouse,
                    decoration: const InputDecoration(labelText: 'Eş Anlamı'),
                  ),
                  const SizedBox(height: 16.0),
                  FormBuilderTextField(
                    name: "sentence",
                    initialValue: widget.myWords?.sentence,
                    decoration: const InputDecoration(
                        labelText: 'Bir cumle icinde kullanımı'),
                  ),
                  const SizedBox(height: 25.0),
                  MaterialButton(
                    color: Colors.green,
                    onPressed: () async {
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
                        print(_formKey.currentState!.value["word"]);
                        print(_formKey.currentState!.value["spouse"]);
                        try {
                          wordCt.addWord(words);
                          if (context.mounted) {
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
                      size: 50,
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
