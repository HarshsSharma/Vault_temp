import 'package:flutter/material.dart';

import 'package:vault/src/modules/asset_tracker/model/assets_model.dart';

class ExpandedAsset extends StatefulWidget {
  final AssetsModel asset;

  const ExpandedAsset({super.key, required this.asset});

  @override
  State<ExpandedAsset> createState() => _ExpandedAssetState();
}

class _ExpandedAssetState extends State<ExpandedAsset> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandedHeader(
          asset: widget.asset,
          onTap: () => setState(() {
            isExpanded = !isExpanded;
          }),
        ),
        if (isExpanded)
          Column(
            children: [
              ExpandedItem(
                title: 'Tag Number',
                value: widget.asset.tagNumber,
              ),
              ExpandedItem(title: 'Model Name', value: widget.asset.modelName),
              ExpandedItem(
                  title: 'Serial Number', value: widget.asset.serialNumber),
              ExpandedItem(
                  title: 'Display Name', value: widget.asset.displayName),
              ExpandedItem(
                  title: 'Latitude and longitude',
                  value: '${widget.asset.latitude}, ${widget.asset.longtiude}'),
              ExpandedItem(title: 'Address', value: widget.asset.address),
            ],
          )
      ],
    );
  }
}

class ExpandedHeader extends StatelessWidget {
  const ExpandedHeader({
    super.key,
    required this.asset,
    required this.onTap,
  });

  final AssetsModel asset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: asset.color, width: 3),
            right: BorderSide(
                color: Color.fromARGB(255, 145, 182, 200), width: .5),
            top: BorderSide(
                color: Color.fromARGB(255, 145, 182, 200), width: .5),
            bottom: BorderSide(
                color: Color.fromARGB(255, 145, 182, 200), width: .5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  asset.tagNumber,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text(
                  asset.type,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: .5),
              ),
              child: Icon(
                Icons.check,
                size: 18,
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExpandedItem extends StatelessWidget {
  const ExpandedItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left:
              BorderSide(color: Color.fromARGB(255, 145, 182, 200), width: .5),
          bottom:
              BorderSide(color: Color.fromARGB(255, 145, 182, 200), width: .5),
          right:
              BorderSide(color: Color.fromARGB(255, 145, 182, 200), width: .5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
