import 'package:flutter/material.dart';
import 'package:flutter_03_meal/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilter;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.setFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactose'];

    super.initState();
  }

  Widget _buildListTile(
    String title,
    String description,
    bool currentVal,
    Function updateVal,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentVal,
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final Map<String, bool> selectedFilter = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.setFilter(selectedFilter);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Select your filter!',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildListTile(
                    'Gluten Free', 'Only gluten free meals', _glutenFree,
                    (val) {
                  setState(() {
                    _glutenFree = val;
                  });
                }),
                _buildListTile(
                    'Lactose Free', 'Only lactors free meals', _lactoseFree,
                    (val) {
                  setState(() {
                    _lactoseFree = val;
                  });
                }),
                _buildListTile(
                    'Vegetarian', 'Only vegetarian free meals', _vegetarian,
                    (val) {
                  setState(() {
                    _vegetarian = val;
                  });
                }),
                _buildListTile('Vegan', 'Only vegan free meals', _vegan, (val) {
                  setState(() {
                    _vegan = val;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
