import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:intl/intl.dart';

class OUtils {
  static DateTime getDateTimeByJSON(String data) {
    return formatDateByPattern(data, 'MMM dd, yyyy HH:mm:ss a');
  }

  static DateTime getDataTimeWithTimeZone(String date) {
    return formatDateByPattern(date, 'yyyy-MM-ddTHH:mm:ss');
  }

  static DateTime getDataTimeByString(String data) {
    return formatDateByPattern(data, 'yyyy-MM-dd HH:mm:ss');
  }

  static DateTime getDataBySQL(String data) {
    return formatDateByPattern(data, 'yyyy-MM-dd');
  }

  static DateTime formatDateByPattern(String data, String pattern) {
    DateTime dtFormatada = DateFormat(pattern).parse(data);
    return dtFormatada;
  }

  static String formataDataByPattern(DateTime data, String formato) {
    if (data == null)
      return "  /  /    ";
    else
      return DateFormat(formato).format(data);
  }

  static DateTime getDataByStringDDMMYYYY(String data) {
    try {
      if ((data ?? '').trim().isEmpty) {
        return null;
      }
      String formatedDate = data.replaceAll('/', '').replaceAll('-', '');
      int dia = int.parse(formatedDate.substring(0, 2));
      int mes = int.parse(formatedDate.substring(2, 4));
      int ano = int.parse(formatedDate.substring(4, 8));

      if (mes > 12 || dia > 31) {
        throw new Exception(
            'Não foi possível formattar a String $data do formato dd/MM/yyyy pois a data é inválida');
      }
      return DateTime.utc(ano, mes, dia);
    } catch (e) {
      throw new Exception(
          'Não foi possível formattar a String $data do formato dd/MM/yyyy pois a data é inválida');
    }
  }

  static String formataData(DateTime data) {
    if (data == null)
      return "  /  /    ";
    else
      return DateFormat('dd/MM/yyyy', 'pt_Br').format(data);
  }

  static String formataDataSQL([DateTime data]) {
    return DateFormat('yyyy-MM-dd').format(data ?? DateTime.now());
  }

  static String formataDataHora(DateTime data) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(data);
  }

  static String formataDataSingleDate(DateTime data) {
    return DateFormat("yyyy-MM-dd").format(data);
  }

  static String formataDataFull(DateTime data) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(data);
  }

  static String formataMoeda(double valor) {
    valor = valor == null ? 0.00 : valor;
    final formatter = new NumberFormat("R\$ #,##0.00", "pt-br");
    return formatter.format(valor);
  }

  static String onlyInteger(double valor) {
    return valor.toInt().toString();
  }

  static double convertToDouble(dynamic value) {
    return value == null ? 0.00 : value + 0.00;
  }

  static int mouthBetweenDates(DateTime dtIni, DateTime dtFin) {
    int dias = daysBetweenDates(dtIni, dtFin);
    int meses = dias ~/ 30;
    return meses;
  }

  static int daysBetweenDates(DateTime dtIni, DateTime dtFin) {
    Duration difference = dtFin.difference(dtIni);
    return difference.inDays;
  }

  static String formatStringOnlyDigits(String value) {
    return value.replaceAll(RegExp("[^0-9]"), "");
  }

  static String formatStringOnlyLetters(String value) {
    return value.replaceAll(RegExp("[^A-Za-z]"), "");
  }

  static bool isNumber(String value) {
    return RegExp("[^0-9]").hasMatch(value.trim());
  }

  static bool isText(String value) {
    return formatStringOnlyLetters(value).trim().isNotEmpty;
  }

  static calculaIdade(DateTime dtNascimento) {
    DateTime hoje = DateTime.now();
    int idade = hoje.year - dtNascimento.year;

    if (hoje.month < dtNascimento.month) {
      idade--;
    } else if (hoje.month == dtNascimento.month &&
        hoje.day < dtNascimento.day) {
      idade--;
    }
    return idade;
  }

  static completaComZeros(String texto, int length) {
    while (texto.length < length) {
      texto = "0" + texto;
    }
    return texto;
  }

  static String convertImageToBase64(File file) {
    return base64.encode(file.readAsBytesSync());
  }

  static Uint8List convertBase64ToImage(String base64) {
    return Base64Decoder().convert(base64);
  }

  static double getDoubleByString(String text) {
    if (text == null) {
      text = "0.0";
    }
    return double.parse(text.replaceAll(',', ".").trim());
  }

  static String convertDoubleToGrau(double valor,
      {bool showSymbol, bool isInteger}) {
    String retorno = (isInteger ?? false)
        ? valor.toInt().toString()
        : valor.toStringAsFixed(2);
    if (valor > 0) {
      retorno = '+$retorno';
    }
    retorno = showSymbol == null || showSymbol
        ? retorno
        : retorno.replaceAll('+', '').replaceAll('-', '');
    print(retorno);
    return retorno;
  }

  static String convertDoubleToInteger(double valor) {
    return valor.toStringAsFixed(0);
  }

  static DateTime addDays(int qtdeDias, {DateTime date}) {
    if (date == null) {
      date = DateTime.now();
    }
    return date.add(Duration(days: qtdeDias));
  }

  static String formatDateExtenso(DateTime tm) {
    String month = getMonthByDate(tm);
    String day = getDayOfWeek(tm);
    return '$day, ${tm.day} de $month';
  }

  static String getDayOfWeek(DateTime tm) {
    String dayFormatted = "";
    switch (tm.weekday) {
      case 1:
        dayFormatted = "Segunda";
        break;
      case 2:
        dayFormatted = "Terça";
        break;
      case 3:
        dayFormatted = "Quarta";
        break;
      case 4:
        dayFormatted = "Quinta";
        break;
      case 5:
        dayFormatted = "Sexta";
        break;
      case 6:
        dayFormatted = "Sabado";
        break;
      case 7:
        dayFormatted = "Domingo";
    }
    if (formataData(tm) == formataData(DateTime.now())) {
      dayFormatted = "Hoje";
    } else if (formataData(tm) == formataData(addDays(-1))) {
      dayFormatted = "Ontem";
    }
    return dayFormatted;
  }

  static String getMonthByDate(DateTime tm) {
    String monthFormatted = "";
    switch (tm.month) {
      case DateTime.january:
        monthFormatted = "Janeiro";
        break;
      case DateTime.february:
        monthFormatted = "Fevereiro";
        break;
      case DateTime.march:
        monthFormatted = "Março";
        break;
      case DateTime.april:
        monthFormatted = "Abril";
        break;
      case DateTime.may:
        monthFormatted = "Maio";
        break;
      case DateTime.june:
        monthFormatted = "Junho";
        break;
      case DateTime.july:
        monthFormatted = "Julho";
        break;
      case DateTime.august:
        monthFormatted = "Agosto";
        break;
      case DateTime.september:
        monthFormatted = "Setembro";
        break;
      case DateTime.october:
        monthFormatted = "Outubro";
        break;
      case DateTime.november:
        monthFormatted = "Novembro";
        break;
      case DateTime.december:
        monthFormatted = "Dezembro";
        break;
    }
    return monthFormatted;
  }

  static String formataCEP(int postcode) {
    if (postcode == null) {
      return "";
    } else if (postcode.toString().length != 8) {
      return postcode.toString();
    } else {
      return postcode.toString().substring(0, 5) +
          '-' +
          postcode.toString().substring(5, 8);
    }
  }

  static String formatDuration(Duration duration) {
    return RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
            .firstMatch(duration.toString())
            ?.group(1) ??
        duration.toString();
  }
}
