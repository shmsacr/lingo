enum ImageEnum {
  choose('choose'),
  creativeWriting('creative-writing'),
  quiz('quiz'),
  trueFalse('true');

  final String value;

  const ImageEnum(this.value);

  String get toPng => 'assets/icons/$value.png';
}
