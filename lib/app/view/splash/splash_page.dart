import 'package:flutter/material.dart';
import 'package:lista_tareas/app/view/components/h1.dart';
import 'package:lista_tareas/app/view/components/shape.dart';
import 'package:lista_tareas/app/view/task_list/task_list_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const title = 'Lista de Tareas';
    const largeText = 'La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad';
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
             Shape(),
            ],
          ),
          const SizedBox(
            height: 79,
          ),
          Image.asset(
            'assets/images/onboarding-image.png',
            width: 180,
            height: 168,
          ),
          const SizedBox(
            height: 99,
          ),
          H1(title),
          const SizedBox(
            height: 29,
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return TaskListPage();
              }));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                largeText,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
