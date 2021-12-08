import 'package:flutter/material.dart';
import 'package:what_the_call/detail_page.dart';
import 'package:what_the_call/helpers/constants.dart';
import 'models/record.dart';
import 'models/record_list.dart';
import 'models/record_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _filter = TextEditingController();

  final RecordList _records = RecordList(records: []);
  final RecordList _filteredRecords = RecordList(records: []);
  String _searchText = "";
  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text(appTitle);

  @override
  void initState() {
    super.initState();

    _records.records = [];
    _filteredRecords.records = [];
    _getRecords();
  }

  void _getRecords() async {
    RecordList records = await RecordService().loadRecords();
    setState(() {
      for (Record record in records.records) {
        _records.records.add(record);
        _filteredRecords.records.add(record);
      }
    });
  }

  PreferredSizeWidget _buildBar(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: appDarkGreyColor,
      centerTitle: true,
      title: _appBarTitle,
      leading: IconButton(onPressed: _searchPressed, icon: _searchIcon),
    );
  }

  Widget _buildList(BuildContext context) {
    if (_searchText.isNotEmpty) {
      _filteredRecords.records = [];
      for (int i = 0; i < _records.records.length; i++) {
        if (_records.records[i].name
                .toLowerCase()
                .contains(_searchText.toLowerCase()) ||
            _records.records[i].address
                .toLowerCase()
                .contains(_searchText.toLowerCase())) {
          _filteredRecords.records.add(_records.records[i]);
        }
      }
    }

    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: _filteredRecords.records
          .map((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Record record) {
    return Card(
      key: ValueKey(record.name),
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white12))),
            child: Hero(
              tag: "avatar_" + record.name,
              child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(record.photo),
              ),
            ),
          ),
          title: Text(
            record.name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: record.address,
                        style: const TextStyle(color: Colors.white)),
                    maxLines: 3,
                    softWrap: true,
                  )
                ],
              ))
            ],
          ),
          trailing: const Icon(Icons.keyboard_arrow_right,
              color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => DetailPage(record: record)));
          },
        ),
      ),
    );
  }

  _HomePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _resetRecords();
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  void _resetRecords() {
    _filteredRecords.records = [];
    for (Record record in _records.records) {
      _filteredRecords.records.add(record);
    }
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = const Icon(Icons.close);
        _appBarTitle = TextField(
          controller: _filter,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.white),
              fillColor: Colors.white,
              hintText: 'Search by name',
              hintStyle: TextStyle(color: Colors.white)),
        );
      } else {
        _searchIcon = const Icon(Icons.search);
        _appBarTitle = const Text(appTitle);
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      backgroundColor: appDarkGreyColor,
      body: _buildList(context),
      resizeToAvoidBottomInset: false,
    );
  }
}
