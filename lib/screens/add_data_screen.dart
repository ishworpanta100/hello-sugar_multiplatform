import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hello_sugar/service/flutter_secure_storage_service.dart';

import '../constants/constants.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _dataList = [];
  final FlutterSecureStorageService _flutterSecureStorageService = GetIt.instance<FlutterSecureStorageService>();

  @override
  void initState() {
    super.initState();
    _loadData(); // Load persisted data when the screen initializes
  }

  // Load data from secure storage
  Future<void> _loadData() async {
    String? data = await _flutterSecureStorageService.read('storedData');
    if (data != null && data.isNotEmpty) {
      setState(() {
        _dataList.addAll(data.split(',')); // Split the stored string into list
      });
    }
  }

  // Persist data in secure storage
  Future<void> _persistData() async {
    await _flutterSecureStorageService.write('storedData', _dataList.join(','));
  }

  void _addData() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      setState(() {
        _dataList.add(text);
      });
      _controller.clear();
      FocusScope.of(context).unfocus();
      _persistData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              // const Header(),
              // const SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'Add Data',
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            ElevatedButton(
                              onPressed: _addData,
                              child: const Text('Add'),
                            ),

                            const SizedBox(height: 40),
                            const Divider(),
                            const SizedBox(height: 40),

                            // List view to display the added data
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: _dataList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(_dataList[index]), // Display the added data
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
