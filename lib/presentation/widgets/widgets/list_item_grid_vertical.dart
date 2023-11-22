
import 'package:enreda_app/presentation/widgets/empty_content.dart';
import 'package:flutter/material.dart';


typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListItemBuilderVertical<T> extends StatelessWidget {
  const ListItemBuilderVertical(
      {Key? key,
        this.snapshot,
        this.itemBuilder,
        this.emptyTitle,
        this.emptyMessage})
      : super(key: key);
  final AsyncSnapshot<List<T>>? snapshot;
  final ItemWidgetBuilder<T>? itemBuilder;
  final String? emptyTitle;
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    if (snapshot!.hasData) {
      final List<T> items = snapshot!.data!;
      if (items.isNotEmpty) {
        return _build(items);
      } else {
        return EmptyContent(title: emptyTitle!, message: emptyMessage!);
      }
    } else if (snapshot!.hasError) {
      return EmptyContent(
          title: 'Algo fue mal', message: 'No se pudo cargar los datos');
    }
    return Center(child: CircularProgressIndicator());
  }

  Widget _build(List<T> items) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length + 2,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 0 || index == items.length + 1) {
          return Container();
        }
        return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 0),
            child: itemBuilder!(context, items[index - 1]));
      },
    );
  }
}