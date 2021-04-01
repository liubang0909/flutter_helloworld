import 'package:flutter/material.dart';
import '../demo/button_demo.dart';
import '../demo/float_action_button_demo.dart';
import '../demo/popup_menu_button_demo.dart';
import '../demo/form_demo.dart';
import '../demo/checkbox_demo.dart';
import '../demo/radio_demo.dart';
import '../demo/switch_demo.dart';
import '../demo/slider_demo.dart';
import '../demo/datetime_demo.dart';
import '../demo/simple_dialog_demo.dart';
import '../demo/alert_dialog_demo.dart';
import '../demo/bottom_sheet_demo.dart';
import '../demo/snack_bar_demo.dart';
import '../demo/expansion_panel_demo.dart';
import '../demo/chip_demo.dart';
import '../demo/data_table_demo.dart';
import '../demo/paginated_data_table_demo.dart';

class MaterialComponents extends StatelessWidget {
  const MaterialComponents({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('MaterialComponents'),
          elevation: 0,
        ),
        body: ListView(
          children: [
            ListItem(
              title: 'PaginatedDataTable',
              page: PaginatedDataTableDemo(),
            ),
            ListItem(title: 'DataTable', page: DataTableDemo()),
            ListItem(title: 'Chip', page: ChipDemo()),
            ListItem(title: 'ExpansionPanel', page: ExpansionPanelDemo()),
            ListItem(title: 'SnackBar', page: SnackBarDemo()),
            ListItem(title: 'BottomSheet', page: BottomSheetDemo()),
            ListItem(title: 'AlertDialog', page: AlertDialogDemo()),
            ListItem(
              title: 'SimpleDialog',
              page: SimpleDialogDemo(),
            ),
            ListItem(title: 'datetime', page: DatetimeDemo()),
            ListItem(title: 'Slider', page: SliderDemo()),
            ListItem(title: 'Switch', page: SwitchDemo()),
            ListItem(title: 'Radio', page: RadioDemo()),
            ListItem(title: 'Checkbox', page: CheckboxDemo()),
            ListItem(
              title: 'Form',
              page: FormDemo(),
            ),
            ListItem(
              title: 'FloatActionButton',
              page: FloatActionButtonDemo(),
            ),
            ListItem(
              title: 'ButtonDemo',
              page: ButtonDemo(),
            ),
            ListItem(
              title: 'PopupMenuButtonDemo',
              page: PopupMenuButtonDemo(),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetDemo extends StatelessWidget {
  const WidgetDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ButtonDemo"),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  const ListItem({Key key, this.title, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(title),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return page;
          }));
        },
      ),
    );
  }
}
