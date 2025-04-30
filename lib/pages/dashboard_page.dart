import 'package:estacioneai/repositories/nivel_repository.dart';
import 'package:flutter/material.dart';

import 'package:estacioneai/shared/widgets/textLabel.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bornController = TextEditingController();
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = "";

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextLabel(text: "Nome Completo"),
              TextField(controller: nameController),
              TextLabel(text: "Data de Nascimento"),
              TextField(
                controller: bornController,
                readOnly: true,
                onTap: () async {
                  var data = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2050),
                  );
                  if (data != null) {
                    bornController.text =
                        "${data.day}/${data.month}/${data.year}";
                  }
                },
              ),
              TextLabel(text: "Nível de experiência"),
              Column(
                children:
                    niveis
                        .map(
                          (nivel) => RadioListTile(
                            dense: true,
                            title: Text(nivel.toString()),
                            selected: nivelSelecionado == nivel.toString(),
                            value: nivel.toString(),
                            groupValue: nivelSelecionado,
                            onChanged: (value) {
                              setState(() {
                                nivelSelecionado = value.toString();
                              });
                            },
                          ),
                        )
                        .toList(),
              ),
              TextButton(
                onPressed: () {
                  print(nameController.text);
                  print(bornController.text);
                },
                child: Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
