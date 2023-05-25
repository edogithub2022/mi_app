import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

NumberFormat numberFormat({required int codmoneda}) {
  const chile = NumberSymbols(
      NAME: "es_CL",
      DECIMAL_SEP: ',',
      GROUP_SEP: '.',
      PERCENT: '%',
      ZERO_DIGIT: '0',
      PLUS_SIGN: '+',
      MINUS_SIGN: '-',
      EXP_SYMBOL: 'E',
      PERMILL: '\u2030',
      INFINITY: '\u221E',
      NAN: 'NaN',
      DECIMAL_PATTERN: '#,##0.##',
      SCIENTIFIC_PATTERN: '#E0',
      PERCENT_PATTERN: '#,##0\u00A0%',
      CURRENCY_PATTERN: '\u00A4#,##0.##\u00A0',
      DEF_CURRENCY_CODE: r'$ ');

  numberFormatSymbols['es_CL'] = chile;
  late NumberFormat number;
  switch (codmoneda) {
    case 1:
      number = NumberFormat.currency(locale: 'es_CL');
      break;
    case 2:
      number = NumberFormat.currency(locale: "en_US", symbol: "US" r'$ ');
      break;
    default:
      number = NumberFormat.currency(locale: 'es_CL');
  }

  return number;
}
