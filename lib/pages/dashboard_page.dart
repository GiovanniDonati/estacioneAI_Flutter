import 'package:flutter/material.dart';

import 'package:estacioneai/shared/widgets/textLabel.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController bornController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextLabel(text: "Nome Completo"),
              TextField(controller: nameController),
              const SizedBox(height: 10,),
              TextLabel(text: "Data de Nascimento"),
              TextField(controller: bornController, readOnly: true, onTap: () async {
                var data =  await showDatePicker(
                  context: context, 
                  firstDate: DateTime(1900), 
                  lastDate: DateTime(2050));
                if(data != null){
                  bornController.text = "${data.day}/${data.month}/${data.year}";
                }
              }),
              TextButton(onPressed: (){}, child: Text("Salvar")),
            ],
          ),
        ),
    ));
  }
}