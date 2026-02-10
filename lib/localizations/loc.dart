import 'package:jaspr/jaspr.dart';

import 'locale_context.dart';

enum AppLang { fi, en }

AppLang resolveLang(BuildContext context) {
  final header = acceptLanguageFromContext(context);
  final primary = (header ?? '').split(',').first.toLowerCase();
  if (primary.startsWith('en')) return AppLang.en;
  if (primary.startsWith('fi')) return AppLang.fi;
  return AppLang.fi;
}

String langCode(AppLang lang) => lang == AppLang.fi ? 'fi' : 'en';

const strings = {
  AppLang.fi: {
    'title': 'Eetu Kallioniemi | Portfolio',
    'nav_about': 'Tietoja',
    'nav_tools': 'Työkalut',
    'nav_experience': 'Kokemus',
    'nav_contact': 'Yhteys',
    'hero_system': 'SYSTEM_ONLINE',
    'hero_name': 'EETU KALLIONIEMI',
    'hero_role_1': 'Software Developer ',
    'hero_role_2': ' Flutter Specialist',
    'hero_cta': 'Käynnistä Protokolla',
    'about_title': 'Kuka olen minä?',
    'about_p1_prefix': 'Olen Orivedeltä kotoisin oleva ',
    'about_p1_highlight': 'Flutter-painotteinen',
    'about_p1_suffix':
        ' ohjelmistokehittäjä. Tulen moniammatillisesta taustasta, mikä on antanut minulle poikkeuksellisen vahvan työmoraalin ja käytännönläheisen asenteen.',
    'about_p2':
        'Erikoistun skaalautuvien ja modernien sovellusten rakentamiseen. Aikaisemmat työnantajani ovat opettaneet minulle arkkitehtuurin merkityksen: kirjoitan koodia, joka on helppo ymmärtää ja ylläpitää.',
    'stat_years': 'Vuotta kokemusta',
    'stat_motivation': 'Motivaatio',
    'attr_title': 'Ominaisuudet',
    'attr_1_title': 'Käytännönläheinen:',
    'attr_1_body': ' Oppiminen tekemällä ja virheistä.',
    'attr_2_title': 'Nöyrä:',
    'attr_2_body': ' Hyväksyn palautteen ja myönnän virheeni.',
    'attr_3_title': 'Motivoitunut:',
    'attr_3_body': ' Tiedän olevani oikealla alalla.',
    'skills_title': 'Työkalupino',
    'experience_title': 'Työhistoria',
    'exp1_task_1':
        'Kehitin itsenäisesti 100% etänä käyttäen moderneja teknologioita kuten Flutter, AWS, Firebase ja Golang.',
    'exp1_task_2': 'UI/UX suunnittelu Figmalla hyödyntäen Material 3 -periaatteita.',
    'exp1_task_3': 'Koodin laatu varmistettiin tarkkojen vertaisarviointien (peer review) kautta.',
    'exp2_task_1': 'Backend-infrastruktuurin kehitys AWS Serverless -palveluilla (API Gateway, Lambda, Cognito, S3).',
    'exp2_task_2': 'Käyttöliittymien kehitys Flutterilla ja Reactilla.',
    'exp2_task_3': 'Työskentely Scrum-mallin mukaisesti.',
    'education_title': 'Koulutus',
    'edu1_title': 'Fullstack-Developer',
    'edu2_title': 'ICT-Asentaja (Ohjelmistokehittäjä)',
    'contact_title': 'Ota yhteyttä',
    'contact_email': 'Sähköposti',
    'contact_phone': 'Puhelin / 24/7',
    'contact_location': 'Sijainti',
    'footer_text': 'Suunniteltu tulevaisuutta varten // © 2026 Eetu Kallioniemi',
    'aria_top': 'Palaa sivun alkuun',
  },
  AppLang.en: {
    'title': 'Eetu Kallioniemi | Portfolio',
    'nav_about': 'About',
    'nav_tools': 'Tools',
    'nav_experience': 'Experience',
    'nav_contact': 'Contact',
    'hero_system': 'SYSTEM_ONLINE',
    'hero_name': 'EETU KALLIONIEMI',
    'hero_role_1': 'Software Developer ',
    'hero_role_2': ' Flutter Specialist',
    'hero_cta': 'Initiate Protocol',
    'about_title': 'Who am I?',
    'about_p1_prefix': 'I am a ',
    'about_p1_highlight': 'Flutter-focused',
    'about_p1_suffix':
        ' software developer from Orivesi. My multi-disciplinary background has given me an unusually strong work ethic and a practical mindset.',
    'about_p2':
        'I specialize in building scalable, modern applications. Previous roles taught me the value of architecture: I write code that is easy to understand and maintain.',
    'stat_years': 'Years of experience',
    'stat_motivation': 'Motivation',
    'attr_title': 'Attributes',
    'attr_1_title': 'Practical:',
    'attr_1_body': ' Learning by doing and from mistakes.',
    'attr_2_title': 'Humble:',
    'attr_2_body': ' I accept feedback and admit mistakes.',
    'attr_3_title': 'Motivated:',
    'attr_3_body': ' I know I am in the right field.',
    'skills_title': 'Tool stack',
    'experience_title': 'Experience',
    'exp1_task_1':
        'Developed independently 100% remotely using modern technologies such as Flutter, AWS, Firebase, and Golang.',
    'exp1_task_2': 'UI/UX design in Figma using Material 3 principles.',
    'exp1_task_3': 'Code quality ensured through thorough peer reviews.',
    'exp2_task_1': 'Backend infrastructure with AWS Serverless (API Gateway, Lambda, Cognito, S3).',
    'exp2_task_2': 'UI development with Flutter and React.',
    'exp2_task_3': 'Worked within a Scrum model.',
    'education_title': 'Education',
    'edu1_title': 'Fullstack Developer',
    'edu2_title': 'ICT Technician (Software Developer)',
    'contact_title': 'Get in touch',
    'contact_email': 'Email',
    'contact_phone': 'Phone / 24/7',
    'contact_location': 'Location',
    'footer_text': 'Designed for the future // © 2026 Eetu Kallioniemi',
    'aria_top': 'Back to top',
  },
};

String tr(BuildContext context, String key) => strings[resolveLang(context)]![key]!;
