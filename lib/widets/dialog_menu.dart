import 'package:flutter/material.dart';
import 'package:social_media/widets/glassy_dialog.dart';

class DialogMenu extends StatelessWidget {
  const DialogMenu({Key? key, this.child, required this.items})
      : super(key: key);
  final Widget? child;
  final List<DialogMenuItem> items;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => _showDialog(context),
        icon: child ?? const Icon(Icons.more_vert));
  }

  void _showDialog(BuildContext context) {
    if (items.isEmpty) return;
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) => GlassyDialog(
                content: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  _DialogMenuTile(item: items[index]),
            )));
  }
}

class _DialogMenuTile extends StatelessWidget {
  const _DialogMenuTile({Key? key, required this.item}) : super(key: key);
  final DialogMenuItem item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.drawer,
      leading: Icon(
        item.icon,
        color: const Color.fromARGB(255, 54, 253, 177),
      ),
      title: Text(
        item.text,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      onTap: () {
        item.onSelect.call();
        Navigator.pop(context);
      },
    );
  }
}

class DialogMenuItem {
  DialogMenuItem({required this.text, required this.onSelect, this.icon});
  final IconData? icon;
  final String text;
  final VoidCallback onSelect;
}
