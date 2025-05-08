import 'package:estacioneai/repositories/linguagens_repository.dart';
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
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var linguagensSelecionado = [];
  var nivelSelecionado = "";
  double salarioEscolhido = 1000;
  int tempoExperiencia = 0;

  bool salvando = false;

  List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(value: i, child: Text(i.toString())));
    }
    return itens;
  }

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: salvando
              ? Center(child: CircularProgressIndicator())
              : ListView(
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
                      children: niveis
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
                    TextLabel(text: "Linguagens de programação"),
                    Column(
                      children: linguagens
                          .map(
                            (linguagem) => CheckboxListTile(
                              dense: true,
                              title: Text(linguagem),
                              value: linguagensSelecionado.contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    linguagensSelecionado.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    linguagensSelecionado.remove(linguagem);
                                  });
                                }
                              },
                            ),
                          )
                          .toList(),
                    ),
                    TextLabel(text: "Tempo de experiência:"),
                    DropdownButton(
                      isExpanded: true,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = int.parse(value.toString());
                        });
                      },
                    ),
                    TextLabel(
                      text:
                          "Pretenção salárial. R\$ ${salarioEscolhido.round()}",
                    ),
                    Slider(
                      min: 1000,
                      max: 10000,
                      value: salarioEscolhido,
                      onChanged: (double value) {
                        setState(() {
                          salarioEscolhido = value;
                        });
                        print(value);
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        if (nameController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Preencha com o seu nome"),
                            ),
                          );
                          return;
                        }
                        if (bornController == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Preencha com a data de nascimento",
                              ),
                            ),
                          );
                          return;
                        }
                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(Duration(seconds: 3), () {
                          setState(() {
                            salvando = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Dados cadastrados com sucesso"),
                            ),
                          );
                        });
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
