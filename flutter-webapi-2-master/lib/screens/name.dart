import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCubit extends Cubit<String> {
  NameCubit(String name) : super(name);

  void change(String name) => emit(name);
}

class NameContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit('Guilherme'),
      child: NameView(),
    );
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = context.bloc<NameCubit>().state;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chamge o name'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Disered name: '),
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Text('Change'),
                onPressed: () {
                  final name = _nameController.text;
                  context.bloc<NameCubit>().change(name);
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
