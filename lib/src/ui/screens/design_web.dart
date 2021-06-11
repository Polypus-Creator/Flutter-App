import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:polypus_app/src/api/api_exception.dart';
import 'package:polypus_app/src/api/api_requests.dart';
import 'package:polypus_app/src/models/website_design.dart';

class DesignWeb extends StatefulWidget {
  @override
  _DesignWebState createState() => _DesignWebState();
}

class _DesignWebState extends State<DesignWeb> {
  var _fontItems = [
    "Arial",
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

  WebsiteDesign design2 = WebsiteDesign();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  ApiClient api = ApiClient();

  @override
  void initState() {
    super.initState();
    api.getDesign().then((value) {
      //make sure _fontItems has the new value
      if (value.font != null && !_fontItems.contains(value.font)) {
        _fontItems.add(value.font!);
      }
      //make sure _categories has the new value
      if (value.font != null && !_categories.contains(value.category)) {
        _categories.add(value.category!);
      }
      _nameController.text = value.websiteName ?? "";
      _descriptionController.text = value.description ?? "";
      setState(() => design2 = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    var _containerSize = 35.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            value: design2.category,
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
                                setState(() => design2.category = value),
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
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text(
                    "Color primario",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () => _showPicker(
                    context,
                    'Elige el color primario',
                    design2.primaryColour ?? Colors.white,
                    (newColour) =>
                        setState(() => design2.primaryColour = newColour),
                  ),
                  trailing: Container(
                    color: design2.primaryColour,
                    width: _containerSize,
                    height: _containerSize,
                  ),
                ),
                SizedBox(height: 4),
                ListTile(
                  leading: Icon(
                    Icons.color_lens,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text(
                    "Color secundario",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () => _showPicker(
                      context,
                      'Elige el color secundario',
                      design2.secondaryColour ?? Colors.white,
                      (newColour) =>
                          setState(() => design2.secondaryColour = newColour)),
                  trailing: Container(
                    color: design2.secondaryColour,
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
                      value: design2.font,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: _fontItems
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => design2.font = value),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
              onPressed: () => _save(context), child: Text("Guardar")),
        ],
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

  void _save(BuildContext context) async {
    design2.websiteName = _nameController.text;
    design2.description = _descriptionController.text;
    String text;
    try {
      await api.updateDesign(design2);
      text = "Diseño actualizado correctamente.";
    } on ApiException catch (e) {
      text = e.message;
    } on Exception {
      text = "Ha ocurrido un error inesperado, "
          "por favor, prueba de nuevo más tarde";
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
