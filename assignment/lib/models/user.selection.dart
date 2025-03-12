class UserSelection {
  String name;
  List<String> selectedBooks;

  UserSelection({required this.name, required this.selectedBooks});

  @override
  String toString() {
    return "Tên: $name, Sách đã chọn: ${selectedBooks.join(', ')}";
  }
}
