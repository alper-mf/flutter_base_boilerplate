import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class MaterialRxStreamBuilder<T> extends StatefulWidget {
  final Stream<T> stream;

  final AsyncWidgetBuilder<T> builder;

  final T? initialData;

  final int? valuesSnapshotIndex;

  const MaterialRxStreamBuilder({
    required this.stream,
    required this.builder,
    this.initialData,
    this.valuesSnapshotIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MaterialRxStreamBuilderState<T>();
}

class _MaterialRxStreamBuilderState<T> extends State<MaterialRxStreamBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    final initialData = _getInitialData(widget.stream);

    return StreamBuilder(
      initialData: initialData,
      stream: widget.stream,
      builder: widget.builder,
    );
  }

  T? _getInitialData(Stream<T> stream) {
    T? initialData;
    if (widget.initialData != null) {
      initialData = widget.initialData;
    } else if (stream is ValueStream<T> && stream.hasValue) {
      initialData = stream.value;
    } else if (stream is ReplayStream<T>) {
      if (widget.valuesSnapshotIndex != null && stream.values.length >= widget.valuesSnapshotIndex!) {
        initialData = stream.values.elementAt(widget.valuesSnapshotIndex!);
      } else if (stream.values.isNotEmpty) {
        initialData = stream.values.last;
      }
    }

    return initialData;
  }
}
