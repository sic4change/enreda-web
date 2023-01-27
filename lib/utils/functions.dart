import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const kDuration = Duration(milliseconds: 600);

Future<void> openUrlLink(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      enableJavaScript: true,
    );
  } else {
    throw 'Could not launch $url';
  }
}

scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: kDuration,
  );
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

String removeDiacritics(String str) {
  var withDia = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  var withoutDia = 'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

  for (int i = 0; i < withDia.length; i++) {
    str = str.replaceAll(withDia[i], withoutDia[i]);
  }

  return str;
}

String getResourceTypeName(String resourceTypeId) {
  switch (resourceTypeId) {
    case '4l9BLhP7cwXohUvQzMOT':
      {
        return 'Programa de aceleración de emprendimiento';
      }
      break;

    case 'E19QFsYBxlcw3edEF2Qp':
      {
        return 'Otros';
      }
      break;

    case 'EsV5yvTXtyIrVobpefB6':
      {
        return 'Eventos profesionales';
      }
      break;

    case 'GOw01m2HPro4I8xd6rSj':
      {
        return 'Desarrollo de habilidades sociales';
      }
      break;

    case 'LRWhKw4kpmTZtShUFiTV':
      {
        return 'Prácticas';
      }
      break;

    case 'MvCHSFzASskxlkBzPElb':
      {
        return 'Apoyo y orientación para el empleo';
      }
      break;

    case 'N9KdlBYmxUp82gOv8oJC':
      {
        return 'Formación';
      }
      break;

    case 'PPX3Ufeg9YfzH4YA0SkU':
      {
        return 'Financiación / Soporte / Ayuda económica';
      }
      break;

    case 'QBTbYYx9EUwNtKB68Xfz':
      {
        return 'Bolsa de empleo';
      }
      break;

    case 'VGuwRNVjRY2bzVcVhnnN':
      {
        return 'Voluntariado';
      }
      break;

    case 'iGkqdz7uiWuXAFz1O8PY':
      {
        return 'Hobbies, ocio y tiempo libre';
      }
      break;

    case 'kUM5r4lSikIPLMZlQ7FD':
      {
        return 'Oferta de empleo';
      }
      break;

    case 'lUubulxiAGo4llxFJrkl':
      {
        return 'Mentoría';
      }
      break;

    case 'r8ynPX9Y4P3WLtec2z21':
      {
        return 'Beca';
      }
      break;

    default:
      {
        return 'Otros';
      }
      break;
  }
}

