import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';

import 'service_group_item.dart';

class ServiceGroupList extends StatelessWidget {
  const ServiceGroupList({
    Key key,
    this.models,
    this.onTap,
  }) : super(key: key);

  final List<ServiceGroup> models;
  final ValueChanged<ServiceGroup> onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: models.length ?? 0,
      itemBuilder: (context, index) {
        return ServiceGroupItem(
          model: models[index],
          onTap: onTap,
        );
      },
    );
  }
}
