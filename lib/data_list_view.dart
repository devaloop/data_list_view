library devaloop_data_list_view;

import 'package:flutter/material.dart';

class DataListView extends StatelessWidget {
  const DataListView({
    super.key,
    required this.title,
    required this.dataItems,
    this.actions,
    this.summaries,
    this.actionColor,
  });

  final String title;
  final List<ActionButton>? actions;
  final List<Summary>? summaries;
  final List<DataItem> dataItems;
  final Color? actionColor;

  @override
  Widget build(BuildContext context) {
    var orienstation = MediaQuery.of(context).orientation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            SizedBox(
              height: 24 + 15,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            if (actions != null)
              if (actions!
                  .where((element) => element.showForward == true)
                  .isEmpty)
                const Expanded(
                  child: Text(''),
                ),
            if (actions != null)
              if (actions!
                  .where((element) => element.showForward == true)
                  .isNotEmpty)
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: actions!
                          .where((element) => element.showForward == true)
                          .map(
                            (e) => InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (e.icon != null)
                                      IconButton(
                                        onPressed: () => e.onPressed.call(),
                                        icon: e.icon!,
                                        color: actionColor ??
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                      ),
                                  ],
                                ),
                              ),
                              onTap: () => e.onPressed.call(),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
            if (actions != null)
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Row(
                          children: [
                            Text(title),
                            const Expanded(
                              child: Text(''),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.close,
                                color: actionColor ??
                                    Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        content: SizedBox(
                          width: 320,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () =>
                                          actions![index].onPressed.call(),
                                      leading: IconButton(
                                        color: actionColor ??
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                        icon: actions![index].icon!,
                                        onPressed: () =>
                                            actions![index].onPressed.call(),
                                      ),
                                      title: Text(
                                        actions![index].label,
                                        style: TextStyle(
                                          color: actionColor ??
                                              Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: actions!.length,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(7.5),
                  child: Icon(
                    Icons.more_vert,
                    color: actionColor ?? Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
          ],
        ),
        if (orienstation == Orientation.portrait)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (summaries != null)
                  Container(
                    margin: const EdgeInsets.only(top: 7.5),
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      spacing: 7.5,
                      children: summaries!
                          .map(
                            (e) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  e.value,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  e.label,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                if (summaries != null)
                  Container(
                    margin: const EdgeInsets.only(left: 7.5, right: 7.5),
                    child: const Divider(),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Show top ${dataItems.length}'),
                        Flexible(
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(dataItems[index].title),
                                subtitle: dataItems[index].subtitle,
                                trailing: dataItems[index].onTap == null
                                    ? null
                                    : InkWell(
                                        onTap: () =>
                                            dataItems[index].onTap!.call(),
                                        child: Icon(
                                          Icons.navigate_next,
                                          color: actionColor ??
                                              Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                        ),
                                      ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: dataItems.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (orienstation == Orientation.landscape)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (summaries != null)
                  Container(
                    margin: const EdgeInsets.all(0),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        spacing: 7.5,
                        children: summaries!
                            .map(
                              (e) => RotatedBox(
                                quarterTurns: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e.value,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      e.label,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                if (summaries != null)
                  Container(
                    margin: const EdgeInsets.only(
                        left: 7.5, right: 7.5, bottom: 7.5),
                    child: const VerticalDivider(),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Show top ${dataItems.length}'),
                        Flexible(
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(dataItems[index].title),
                                subtitle: dataItems[index].subtitle,
                                trailing: dataItems[index].onTap == null
                                    ? null
                                    : InkWell(
                                        onTap: () =>
                                            dataItems[index].onTap!.call(),
                                        child: const Icon(Icons.navigate_next),
                                      ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: dataItems.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class ActionButton {
  const ActionButton({
    required this.onPressed,
    required this.label,
    this.icon,
    this.showForward,
  });
  final Function() onPressed;
  final String label;
  final Widget? icon;
  final bool? showForward;
}

class Summary {
  const Summary({
    required this.value,
    required this.label,
  });
  final String value;
  final String label;
}

class DataItem {
  const DataItem({
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final String title;
  final Widget? subtitle;
  final Function()? onTap;
}
