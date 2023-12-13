import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../bloc/clients/client_bloc.dart';
import '../../data/repositories/client_repository.dart';

import 'data/Hive/client_hive_model.dart';


late Box<ClientHiveModel> _clients;
final String name = "Linda";
final String pet = "Fighter Malinois";

void main() async {
  await Hive.initFlutter();
  _clients = await Hive.openBox<ClientHiveModel>('clientBox');
  // await _clients.get(ClientHiveModel(name: name, pet: pet))
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 1;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Widgets'),
    Text('Clients'),
    Text('Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    WidgetsScreen(),
    ClientsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'Widgets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_call),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class WidgetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 30,
        width: 300,
      ),
    );
  }
}

class ClientsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo list'),
      ),
      body: BlocProvider(
        create: (context) => ClientBloc(RepositoryProvider.of<ClientRepository>(context))..add(LoadClientsEvent(name, pet)),
        child: BlocBuilder<ClientBloc, ClientState>(
          builder: (context, state) {
            if (state is ClientsLoadedState) {
              return ListView(
                children: <Widget>[
                  ListTile(
                    title: Text(state.name.first.name),
                    subtitle: Text(state.pet.first.pet),
                  ),
                  ListTile(
                    title: Text(state.name.last.name),
                    subtitle: Text(state.pet.last.pet),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }


















  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: ListView(
  //       children: <Widget>[
  //         ListTile(
  //
  //           title: Text('Клиент 1'),
  //           subtitle: Text('Малинуа Файтер'),
  //         ),
  //         ListTile(
  //           title: Text('Клиент 2'),
  //           subtitle: Text('Малинуа Файтер'),
  //         ),
  //         ListTile(
  //           title: Text('Клиент 3'),
  //           subtitle: Text('Малинуа Файтер'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}


// class ClientsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Клиенты')),
//       body: BlocProvider(
//         create: (context) => ClientBloc(clientRepository: ClientRepository()),
//         child: BlocBuilder<ClientBloc, ClientState>(
//           builder: (context, state) {
//             if (state is ClientsLoaded) {
//               return ListView.builder(
//                 itemCount: state.clients.length,
//                 itemBuilder: (context, index) {
//                   final client = state.clients[index];
//                   return ListTile(
//                     title: Text(client.name),
//                     subtitle: Text(client.pet),
//                   );
//                 },
//               );
//             }
//             return Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
//   }
// }

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 30,
        width: 300,
      ),
    );
  }
}
