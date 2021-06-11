import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:polypus_app/src/api/api_requests.dart';
import 'package:polypus_app/src/models/website_design.dart';

class DesignWeb extends StatefulWidget {
  @override
  _DesignWebState createState() => _DesignWebState();
}

class _DesignWebState extends State<DesignWeb> {
  var _fontItems = [
    "Abel",
    "FrancoisOne",
    "Karla",
    "Nunito",
    "SourceSerifPro",
    "SquadaOne",
    "Yantramanav",
  ];
  var _categories = [
    //todo check categories
    "Personal",
    "Profesional",
  ];

  late WebsiteDesign design;
  late TextEditingController _nameController, _descriptionController;
  ApiClient api = ApiClient();

  var indicator = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    design = WebsiteDesign();

    _nameController = TextEditingController(text: design.websiteName);
    _descriptionController = TextEditingController(text: design.description);

    if (indicator.currentState != null) {
      indicator.currentState!.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    var _containerSize = 35.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RefreshIndicator(
        key: indicator,
        onRefresh: () async {
          var newDesign = await api.getDesign();
          if (newDesign != null)
            setState(() {
              design = newDesign;
            });
        },
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          isDense: true, labelText: "Nombre de la Web"),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                          isDense: true, labelText: "Descripción"),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text("Categoría"),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: design.category,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: _categories
                                  .map(
                                    (String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) =>
                                  setState(() => design.category = value),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.color_lens,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      "Color primario",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () => _showPicker(
                      context,
                      'Elige el color primario',
                      design.primaryColour ?? Colors.white,
                      (newColour) =>
                          setState(() => design.primaryColour = newColour),
                    ),
                    trailing: Container(
                      color: design.primaryColour,
                      width: _containerSize,
                      height: _containerSize,
                    ),
                  ),
                  SizedBox(height: 4),
                  ListTile(
                    leading: Icon(
                      Icons.color_lens,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      "Color secundario",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () => _showPicker(
                        context,
                        'Elige el color secundario',
                        design.secondaryColour ?? Colors.white,
                        (newColour) =>
                            setState(() => design.secondaryColour = newColour)),
                    trailing: Container(
                      color: design.secondaryColour,
                      width: _containerSize,
                      height: _containerSize,
                    ),
                  ),
                  SizedBox(height: 4),
                  ListTile(
                    leading: Icon(Icons.font_download_outlined),
                    title: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: design.font,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: _fontItems
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => design.font = value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text("Guardar")),
          ],
        ),
      ),
    );
  }

  void _showPicker(
    BuildContext context,
    String title,
    Color colour,
    Function(Color colour) onColourChanged,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ColorPicker(
            enableAlpha: false,
            pickerColor: colour,
            pickerAreaBorderRadius: BorderRadius.circular(5),
            onColorChanged: onColourChanged,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
