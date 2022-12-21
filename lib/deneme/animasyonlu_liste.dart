import 'package:flutter/material.dart';

class AnimasyonluListe extends StatefulWidget {
  const AnimasyonluListe({Key? key}) : super(key: key);

  @override
  State<AnimasyonluListe> createState() => _AnimasyonluListeState();
}

class _AnimasyonluListeState extends State<AnimasyonluListe> {
  var now = DateTime.now();
  final _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, "Item ${DateTime.now().second}");
    _key.currentState!.insertItem(
      0,
      duration: const Duration(seconds: 1),
    );
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            child: ListTile(
              title: Text(
                "deleted",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 500),
    );
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animasyonlu Liste"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _addItem();
            },
          ),
          Expanded(
            child: AnimatedList(
              key: _key,
              initialItemCount: 0,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  key: UniqueKey(),
                  sizeFactor: animation,
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    color: Colors.amber,
                    child: ListTile(
                      title: Text(
                        _items[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_forever),
                        onPressed: () {
                          _removeItem(index);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
