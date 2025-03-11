
import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();

}

class _UserFormState extends State<UserForm>{
  String _name = "";
  String _age = "";

  final _formKey = GlobalKey<FormState>();
  // theo dõi giá trị của TextField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void _validateForm() {
    // Dấu ! nghĩa là: "Mình chắc chắn currentState không phải null, cứ gọi .validate() đi!"
    if (_formKey.currentState!.validate()) {
      String result = checkAge(_ageController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kết quả: $result")),
      );
    }
  }

  String checkAge(String value) {

    if (value.trim().isEmpty || value.trim() == null) {
      return "Age không được để trống";
    }

    try {
      int age = int.parse(value);

      if (age > 65) return "Người Già";
      if (age > 6) return "Người Trưởng Thành";
      if (age >= 2) return "Trẻ Em";
      if (age >= 0) return "Trẻ Sơ Sinh";
      return "Tuổi không được phép âm";
    } catch (e) {
      return "Vui lòng nhập số hợp lệ";
    }

  }


  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "THỰC HÀNH 01",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
          ),
         Container(
           padding: const EdgeInsets.all(40),
           margin: EdgeInsets.all(40),
           decoration: BoxDecoration(
             color: Colors.grey[300],
             borderRadius: BorderRadius.circular(10),
           ),
           child:  Form(
             key: _formKey,
             child:  Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 // Là một phiên bản nâng cấp của TextField, thường dùng trong Form để nhập và kiểm tra dữ liệu.
                  Row(
                    children: [
                      const SizedBox(width: 70, child: Text("Họ và tên")),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10), // Bo góc
                              borderSide: BorderSide.none, // Ẩn viền
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Canh chỉnh nội dung
                          ),

                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Không được để trống";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _name = value;
                          });
                        },
                      ),)
                    ],
                  ),
               const SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 70, child: Text("Tuổi")),
                  Expanded(child:  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Bo góc
                        borderSide: BorderSide.none, // Ẩn viền
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Canh chỉnh nội dung
                    ),
                    controller: _ageController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Không được để trống";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _age = value;
                      });
                    },
                  ))
                ],
              )
               ],
             ),
           ),
         ),
          Text("Họ và Tên: $_name - Tuổi: $_age"),
          Center(
            child: ElevatedButton(
              onPressed: (){
                _validateForm();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Màu nền nút
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12), // Kích thước padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Bo góc 5px
                ),
              ),
              child: const Text("Kiểm Tra", style: TextStyle(backgroundColor: Colors.blue,
              color: Colors.white),),)
          )
        ],
      ),
    );
  }  
    
}