import 'package:athyedge/injection.dart';
import 'package:athyedge/presentation/equipments/cubits/loader_cubit.dart';
import 'package:athyedge/presentation/equipments/widgets/equipment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EquipmentsPage extends StatefulWidget {
  const EquipmentsPage({super.key});

  @override
  State<EquipmentsPage> createState() => _EquipmentsPageState();
}

class _EquipmentsPageState extends State<EquipmentsPage> {
  late LoaderCubit loaderCubit;
  bool value = false;

  @override
  void initState() {
    loaderCubit = getIt<LoaderCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Equipments"),
      ),
      body: BlocProvider(
        create: (context) => loaderCubit,
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3
                ),
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return const Equipment();
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (loaderCubit.state == Show()) {
                    loaderCubit.hide();
                  } else {
                    loaderCubit.show();
                  }
                },
                child: const Text("Show Progress"),
              ),
              BlocBuilder<LoaderCubit, LoaderState>(
                builder: (context, state) {
                  return Visibility(
                    visible: state == Show(),
                    child: const CircularProgressIndicator(
                      semanticsLabel: "Loading",
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Hi, showing snackbar"),
                      action: SnackBarAction(
                        label: "Dismiss",
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                },
                child: const Text("Show Snackbar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
