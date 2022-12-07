import 'package:flutter/material.dart';

class CreateLetters extends StatefulWidget {
  @override
  State<CreateLetters> createState() => _CreateLettersState();
}

class _CreateLettersState extends State<CreateLetters> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  bool isPrivate = false;

  DateTime current_date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateController.text = "${current_date}";
  }

  @override
  Widget build(BuildContext context) {
    const homeColor = const Color(0xFFBFFC679);

    return Scaffold(
      backgroundColor: homeColor,
      appBar: AppBar(
        backgroundColor: homeColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Column(
          children: [
            Text(
              "Create a Letter",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: titleController,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.0),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Title'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                readOnly: true,
                style: TextStyle(color: Colors.black),
                controller: dateController,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.0),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Date'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  margin: EdgeInsets.all(0),
                  height: 5 * 24.0,
                  child: TextField(
                    controller: bodyController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Enter a message",
                      filled: true,
                    ),
                  ),
                )),
            Row(
              children: [
                Text("Make your letter public?"),
                Switch(
                  value: isPrivate,
                  activeColor: Colors.blue,
                  onChanged: (bool value) {
                    setState(() {
                      isPrivate = value;
                    });
                    print(isPrivate);
                  },
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    // checkIfUserExists(
                    //     app.currentUser?.id,
                    //     nameController.text,
                    //     countryController.text,
                    //     dob);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFBC25450),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 15.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Create Letter',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
