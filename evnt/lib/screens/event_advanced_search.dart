import 'package:evnt/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventAdvancedSearchScreen extends StatefulWidget {
  const EventAdvancedSearchScreen({super.key});

  @override
  _EventAdvancedSearchScreenState createState() => _EventAdvancedSearchScreenState();
}

class _EventAdvancedSearchScreenState extends State<EventAdvancedSearchScreen> {
  final List<String> _tags = [];
  final TextEditingController _tagsController = TextEditingController();
  RangeValues _ageRange = const RangeValues(18, 60);
  RangeValues _priceRange = const RangeValues(0, 100);
  bool _isFree = false;

  DateTime _startingDateTime = DateTime.now();
  DateTime _finishingDateTime = DateTime.now();

  bool _useAgeRange = false;
  bool _usePriceRange = false;
  bool _useStartingDateTime = false;
  bool _useFinishingDateTime = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dive deep into your interests'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _tagsController,
              decoration: InputDecoration(
                labelText: "Tags/Interests",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTag,
                ),
              ),
            ),
            Wrap(
              children: _tags.map((tag) => Chip(
                label: Text(tag),
                onDeleted: () => _removeTag(tag),
              )).toList(),
            ),
            const SizedBox(height: 16),
            const Text('Age Range:'),
            SwitchListTile(
              title: const Text('Use Age Range'),
              value: _useAgeRange,
              onChanged: (bool value) {
                setState(() {
                  _useAgeRange = value;
                });
              },
            ),
            if (_useAgeRange)
              RangeSlider(
                values: _ageRange,
                min: 0,
                max: 100,
                divisions: 100,
                labels: RangeLabels(
                  _ageRange.start.round().toString(),
                  _ageRange.end.round().toString(),
                ),
                onChanged: (values) {
                  setState(() {
                    _ageRange = values;
                  });
                },
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _isFree,
                  onChanged: (value) {
                    setState(() {
                      _isFree = value!;
                                          });
                  },
                ),
                const Text('Free')
              ],
            ),
            if (!_isFree)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Price Range:'),
                  SwitchListTile(
                    title: const Text('Use Price Range'),
                    value: _usePriceRange,
                    onChanged: (bool value) {
                      setState(() {
                        _usePriceRange = value;
                      });
                    },
                  ),
                  if (_usePriceRange)
                    RangeSlider(
                      values: _priceRange,
                      min: 0,
                      max: 1000,
                      divisions: 100,
                      labels: RangeLabels(
                        '\$${_priceRange.start.round()}',
                        '\$${_priceRange.end.round()}',
                      ),
                      onChanged: (values) {
                        setState(() {
                          _priceRange = values;
                        });
                      },
                    ),
                ],
              ),
            const SizedBox(height: 16),
            const Text('Date & Time'),
            SwitchListTile(
              title: const Text('Use Starting DateTime'),
              value: _useStartingDateTime,
              onChanged: (bool value) {
                setState(() {
                  _useStartingDateTime = value;
                });
              },
            ),
            if (_useStartingDateTime)
              ListTile(
                title: Text('Starting DateTime: ${_formatDateTime(_startingDateTime)}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickStartingDateTime,
              ),
            SwitchListTile(
              title: const Text('Use Finishing DateTime'),
              value: _useFinishingDateTime,
              onChanged: (bool value) {
                setState(() {
                  _useFinishingDateTime = value;
                });
              },
            ),
            if (_useFinishingDateTime)
              ListTile(
                title: Text('Finishing DateTime: ${_formatDateTime(_finishingDateTime)}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickFinishingDateTime,
              ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: _applyFilters,
                  child: const Text('Apply Filters'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: _clearFilters,
                  child: const Text('Clear Filters'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickStartingDateTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: _startingDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_startingDateTime),
      );
      if (time != null) {
        setState(() {
          _startingDateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
        });
      }
    }
  }

  Future<void> _pickFinishingDateTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: _finishingDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_finishingDateTime),
      );
      if (time != null) {
        setState(() {
          _finishingDateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
        });
      }
    }
  }

  void _addTag() {
    final tag = _tagsController.text;
    if (tag.isNotEmpty) {
      setState(() {
        _tags.add(tag);
        _tagsController.clear();
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
  }

  void _applyFilters() {
    final eventParams = EventParams(
      tags: _tags.isNotEmpty ? _tags : null,
      ageRange: _useAgeRange ? _ageRange : null,
      isFree: _isFree ? _isFree : null,
      priceRange: _usePriceRange && !_isFree ? _priceRange : null,
      startingDateTime: _useStartingDateTime ? _startingDateTime : null,
      finishingDateTime: _useFinishingDateTime ? _finishingDateTime : null,
    );

    print(eventParams);
  }

  void _clearFilters() {
    setState(() {
      _tags.clear();
      _ageRange = const RangeValues(18, 60);
      _priceRange = const RangeValues(0, 100);
      _isFree = false;
      _startingDateTime = DateTime.now();
      _finishingDateTime = DateTime.now();
      _useAgeRange = false;
      _usePriceRange = false;
      _useStartingDateTime = false;
      _useFinishingDateTime = false;
    });
  }
}