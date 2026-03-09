import 'package:html_unescape/html_unescape.dart';

class CharactersDecoder {
  HtmlUnescape unescape = HtmlUnescape();
  static String decode(String encoded) => HtmlUnescape().convert(encoded);
}
