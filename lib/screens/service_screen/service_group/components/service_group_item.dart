import 'package:flutter/material.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/constant.dart';

import 'sla_tag.dart';

class ServiceGroupItem extends StatelessWidget {
  const ServiceGroupItem({
    Key key,
    @required this.model,
    this.onTap,
  }) : super(key: key);

  final ServiceGroup model;
  final ValueChanged<ServiceGroup> onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: InkWell(
        onTap: () => onTap(model),
        splashColor: kGreenD6F6F5,
        highlightColor: kGreenD6F6F5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(
                model.icon ?? "",
                width: 48,
                height: 48,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  model.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              SLATag(count: model.totalServices ?? 0)
            ],
          ),
        ),
      ),
    );
  }
}
