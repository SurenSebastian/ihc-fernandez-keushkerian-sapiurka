import 'package:flutter/material.dart';

class EventAdvancedSearchScreen extends StatefulWidget {
  const EventAdvancedSearchScreen({super.key});

  @override
  _EventAdvancedSearchScreenState createState() => _EventAdvancedSearchScreenState();
}

class _EventAdvancedSearchScreenState extends State<EventAdvancedSearchScreen> {
  double _minAge = 18;
  double _maxAge = 65;
  double _minPrice = 0;
  double _maxPrice = 100;
  bool _isFree = false;
  String _selectedTag = "sports";
  TimeOfDay _startTime = const TimeOfDay(hour: 1, minute: 0);
  TimeOfDay _finishTime = const TimeOfDay(hour: 1, minute: 0);
  DateTime _startDate = DateTime.now();
  DateTime _finishDate = DateTime.now();
  final List<String> _tags = ['sports', 'music', 'technology', 'art'];


  void _confirmSearch() {
    print("Search confirmed with the following details:");
    print("Tag: $_selectedTag");
    print("Age Range: $_minAge - $_maxAge");
    print("Price Range: $_minPrice - $_maxPrice");
    print("Free: $_isFree");
    print("Start Time: ${_startTime.format(context)}");
    print("Finish Time: ${_finishTime.format(context)}");
    print("Start Date: ${_startDate.toLocal()}");
    print("Finish Date: ${_finishDate.toLocal()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dive deep into your interests'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tags/Interests:'),
              SizedBox(height: 8),
              DropdownButton<String>(
                value: _selectedTag,
                hint: Text('Select a tag'),
                items: _tags.map((String tag) {
                  return DropdownMenuItem<String>(
                    value: tag,
                    child: Text(tag),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTag = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text('Age Range:'),
              Row(
                children: [
                  Text('${_minAge.round()}'),
                  Expanded(
                    child: RangeSlider(
                      values: RangeValues(_minAge, _maxAge),
                      min: 0,
                      max: 100,
                      divisions: 100,
                      labels: RangeLabels(
                        _minAge.round().toString(),
                        _maxAge.round().toString(),
                      ),
                      onChanged: (values) {
                        setState(() {
                          _minAge = values.start;
                          _maxAge = values.end;
                        });
                      },
                    ),
                  ),
                  Text('${_maxAge.round()}'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Free'),
                  Checkbox(
                    value: _isFree,
                    onChanged: (value) {
                      setState(() {
                        _isFree = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (!_isFree)
                const Text('Price Range:'),
              if (!_isFree)
                Row(
                  children: [
                    Text('\$${_minPrice.round()}'),
                    Expanded(
                      child: RangeSlider(
                        values: RangeValues(_minPrice, _maxPrice),
                        min: 0,
                        max: 100,
                        divisions: 100,
                        labels: RangeLabels(
                          '\$${_minPrice.round()}',
                          '\$${_maxPrice.round()}',
                        ),
                        onChanged: (values) {
                          setState(() {
                            _minPrice = values.start;
                            _maxPrice = values.end;
                          });
                        },
                      ),
                    ),
                    Text('\$${_maxPrice.round()}'),
                  ],
                ),
              const SizedBox(height: 16),
              const Text('Date & Time'),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Starting time'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: _startTime,
                        );
                        if (picked != null) {
                          setState(() {
                            _startTime = picked;
                          });
                        }
                      },
                      child: Text(_startTime.format(context)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Finishing time'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: _finishTime,
                        );
                        if (picked != null) {
                          setState(() {
                            _finishTime = picked;
                          });
                        }
                      },
                      child: Text(_finishTime.format(context)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Starting date'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _startDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null) {
                          setState(() {
                            _startDate = picked;
                          });
                        }
                      },
                      child: Text("${_startDate.toLocal()}".split(' ')[0]),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Finishing date'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _finishDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null) {
                          setState(() {
                            _finishDate = picked;
                          });
                        }
                      },
                      child: Text("${_finishDate.toLocal()}".split(' ')[0]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _confirmSearch,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Confirm Search'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
