import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:uuid/uuid.dart';

import '../../../model/word_model.dart';

class AddWord extends ConsumerStatefulWidget {
  const AddWord({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddWordState();
}

class _AddWordState extends ConsumerState<AddWord> {
  final _formKey = GlobalKey<FormBuilderState>();
  final uuid = Uuid().v1();
  @override
  Widget build(BuildContext context) {
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
                    decoration: const InputDecoration(labelText: 'Karşılığı'),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: "Bu alan boş bırakılamaz."),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  FormBuilderTextField(
                    initialValue: "",
                    name: "spouse",
                    decoration: const InputDecoration(labelText: 'Eş Anlamı'),
                  ),
                  const SizedBox(height: 16.0),
                  FormBuilderTextField(
                    initialValue: "",
                    name: "sentence",
                    decoration: const InputDecoration(
                        labelText: 'Bir cumle icinde kullanımı'),
                  ),
                  const SizedBox(height: 25.0),
                  MaterialButton(
                    color: Colors.green,
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        final Words words = Words.fromJson({
                          "word": _formKey.currentState!.value["word"],
                          "means": _formKey.currentState!.value["means"],
                          "spouse": _formKey.currentState!.value["spouse"],
                          "sentence": _formKey.currentState!.value["sentence"],
                          "id": uuid,
                        });
                        print(_formKey.currentState!.value["word"]);
                        print(_formKey.currentState!.value["spouse"]);
                      } else {
                        debugPrint("Error");
                        return;
                      }
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
