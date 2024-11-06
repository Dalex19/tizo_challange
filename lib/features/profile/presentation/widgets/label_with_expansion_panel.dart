import 'package:flutter/material.dart';
import 'package:tizo_challange/shared/styles/global_styles.dart';


class LabelWithExpansionPanel extends StatefulWidget {
  const LabelWithExpansionPanel({
    super.key,
    required this.label,
    required this.bodyExpansionPanel,
  });
  final String label;

  final List<Widget> bodyExpansionPanel;

  @override
  LabelWithExpansionPanelState createState() => LabelWithExpansionPanelState();
}

class LabelWithExpansionPanelState extends State<LabelWithExpansionPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionPanelList(
          elevation: 1,
          expandedHeaderPadding: EdgeInsets.zero,
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          children: [
            ExpansionPanel(
              backgroundColor: Globalstyles.secondary,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(widget.label),
                );
              },
              body: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [...widget.bodyExpansionPanel],
                ),
              ),
              isExpanded: _isExpanded,
            ),
          ],
        ),
      ],
    );
  }
}
