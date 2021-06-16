class SvgComponent {
  int id;
  bool isSelected;
  String name;
  String fillColor;
  String path;
  String selectedColor = '0xFFC00000';
  String activeColor = '';
  SvgComponent({
    required this.id,
    required this.isSelected,
    required this.name,
    required this.fillColor,
    required this.path,
  });
}
