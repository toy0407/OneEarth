import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_earth/data/news/news_data.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/font_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';

class LocalTabView extends StatefulWidget {
  final List<Result>? data;
  const LocalTabView({Key? key, this.data}) : super(key: key);

  @override
  State<LocalTabView> createState() => _LocalTabViewState();
}

class _LocalTabViewState extends State<LocalTabView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    int prevIndex = index <= 0 ? 0 : index - 1;
    int nextIndex = index == widget.data!.length - 1 ? 0 : index + 1;
    if (widget.data == null) {
      return Center(
          child: Text(
        'Unable to load data',
        style: getLightStyle(color: ColorManager.black, fontSize: FontSize.s30),
      ));
    }
    return Dismissible(
      background: newsCard(prevIndex),
      child: newsCard(index),
      secondaryBackground: newsCard(nextIndex),
      resizeDuration: Duration(milliseconds: 10),
      key: Key(index.toString()),
      direction: DismissDirection.vertical,
      onDismissed: (direction) {
        updateContent(direction);
      },
    );
  }

  Widget newsCard(index) {
    return Column(
      children: [
        widget.data[index].imageUrl == null
            ? Image.asset()
            : CachedNetworkImage(imageUrl: da)
      ],
    );
  }

  void updateIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
    SharePreference.setLastIndex(newIndex);
  }

  void setupLastIndex() async {
    int lastIndex = await SharePreference.getLastIndex();
    if (lastIndex != null && lastIndex < newsModal.result.length - 1) {
      updateIndex(lastIndex);
    }
  }

  void updateContent(direction) {
    if (index <= 0 && direction == DismissDirection.down) {
      index = newsModal.result.length - 1;
    } else if (index == newsModal.result.length - 1 &&
        direction == DismissDirection.up) {
      index = 0;
    } else if (direction == DismissDirection.up) {
      index++;
    } else {
      index--;
    }
    updateIndex(index);
  }
}
