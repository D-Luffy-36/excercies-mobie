import 'package:flutter/material.dart';

import '../models/user.selection.dart';

// ignore: must_be_immutable
class ManagerPage extends StatefulWidget {
  List<String> users = [
    "Nguyễn Văn An", "Trần Thị Bích", "Lê Minh Châu", "Phạm Văn Dũng",
    "Hoàng Thị Hạnh", "Đỗ Quốc Huy", "Bùi Thanh Hương", "Vũ Ngọc Khoa",
    "Ngô Hoàng Long", "Đặng Thị Mai", "Mai Xuân Nam", "Lương Thế Phong",
    "Tô Bảo Quân", "Trịnh Minh Sang", "Hà Văn Sơn", "Châu Ngọc Thu",
    "Đoàn Hải Triều", "Nguyễn Hoài Trung", "Phan Thị Vân", "Lý Anh Vũ"
  ];

  final List<String> books = [
    "To Kill a Mockingbird",
    "1984",
    "The Great Gatsby",
    "Moby Dick",
    "War and Peace",
    "Pride and Prejudice",
    "The Catcher in the Rye",
    "The Lord of the Rings",
    "Harry Potter and the Sorcerer’s Stone",
    "The Hobbit",
    "Crime and Punishment",
    "Brave New World",
    "The Book Thief",
    "The Alchemist",
    "Jane Eyre",
    "The Chronicles of Narnia",
    "Fahrenheit 451",
    "The Kite Runner",
    "Wuthering Heights",
    "The Little Prince"
  ];

  ManagerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ManagerPageState createState() {
    return _ManagerPageState();
  }
}

class _ManagerPageState extends State<ManagerPage> {
  String header = "Hệ Thống \nQuản Lí Thư Viện";
  late TextEditingController _nameController = TextEditingController();
  String name = "";

  List<bool> isChecked = []; // Trạng thái checkbox

  void _submit(){
    name = _nameController.text;
    List<String> selectedBooks = [];
    for(int i = 0; i < widget.books.length; i++){
      if(isChecked[i]){
        selectedBooks.add(widget.books[i]);
      }
    }
    UserSelection userSelection = UserSelection(name: name, selectedBooks: selectedBooks);

    print(userSelection); // Hiển thị thông tin user + sách đã chọn
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    name = widget.users[0]; // ✅ Truy cập danh sách users từ widget
    isChecked = List<bool>.filled(widget.books.length, false); // Initialize isChecked list
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView( // Make content scrollable
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,  // Căn giữa theo chiều dọc
              children: [
                Column(
                  children: [
                    Text("Hệ Thống", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Quản Lí Thư Viên", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text("Nhân Viên"),
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none, // Xóa viền
                                hintText: name,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Màu nền nút
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Kích thước padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Bo góc 5px
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              name = _nameController.text;
                              print(name);
                            });
                          },
                          child: Text("Đổi"),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text("Danh Sách Sách"),
                    Container(
                      padding: EdgeInsets.all(40),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey, // Màu nền xanh lá
                        borderRadius: BorderRadius.circular(10), // Bo góc 10px
                      ),
                      child:  Column(
                        children: List.generate(widget.books.length, (index) {
                          return Padding(
                              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white, // Màu nền xám nhạt
                                  borderRadius: BorderRadius.circular(40), // Bo góc
                                ),
                                child:  Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.red, // Màu checkbox
                                        value: isChecked[index],
                                        onChanged: (value){
                                          setState(() {
                                            isChecked[index] = value!;
                                          });
                                        }),
                                    Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                          child: Text(widget.books[index]),
                                        ))
                                  ],
                                ),
                              )
                          );
                        }),
                      ),
                    ),
                    Center(
                      child:  ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Màu nền
                          foregroundColor: Colors.white, // Màu chữ
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Khoảng cách trong
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Bo góc
                          ),
                        ),
                        onPressed: () {
                          _submit();
                          print("Button Pressed");
                        },
                        child: Text("Thêm"),

                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}