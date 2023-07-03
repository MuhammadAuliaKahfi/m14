import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pertemuan14Screen extends StatefulWidget {
  const Pertemuan14Screen({Key? key}) : super(key: key);

  @override
  State<Pertemuan14Screen> createState() => _Pertemuan14ScreenState();
}

class _Pertemuan14ScreenState extends State<Pertemuan14Screen> {
  DateTimeRange? _dateRange;
  TextEditingController? _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 14'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Tanggal:'),
                SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      var res = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(1999),
                        lastDate: DateTime(2250),
                      );

                      if (res != null) {
                        setState(() {
                          _dateRange = res;
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        initialValue: _dateRange != null
                            ? '${_dateRange!.start} - ${_dateRange!.end}'
                            : '',
                        decoration: InputDecoration(
                          hintText: 'Pilih Tanggal',
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    var res = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(1999),
                      lastDate: DateTime(2250),
                    );

                    if (res != null) {
                      setState(() {
                        _dateRange = res;
                      });
                    }
                  },
                  icon: Icon(Icons.date_range),
                ),
              ],
            ),
            ListTile(
              title: Text('Tanggal terpilih'),
              subtitle: Text(
                _dateRange != null
                    ? '${_dateRange!.start} - ${_dateRange!.end}'
                    : 'Belum dipilih',
              ),
            ),
            Divider(),
            Row(
              children: [
                Text('Jam: '),
                SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    enabled: false,
                    controller: _time,
                    decoration: InputDecoration(labelText: 'Jam'),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    var res = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (res != null) {
                      setState(() {
                        _time = TextEditingController(text: res.format(context));
                      });
                    }
                  },
                  icon: Icon(Icons.timer),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
