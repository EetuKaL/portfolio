// ignore_for_file: type=lint

import 'package:intl/intl.dart' as intl;
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_localizations/jaspr_localizations.dart';

abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  /// Retrieve the [S] instance from the context.
  static S? of(BuildContext context) {
    // For Jaspr, we can't use Localizations.of() like Flutter
    // This would need to be implemented using Jaspr's provider system
    // For now, return null and let consumers handle this
    final provider = JasprLocalizationProvider.of(context);
    final currentLocale = provider.currentLocale;
    return S.from(currentLocale.languageCode);
  }

  /// The delegate for this localizations class.
  static const SDelegate delegate = SDelegate();

  /// A list of this localizations delegate along with default delegates.
  static const List<dynamic> localizationsDelegates = <dynamic>[
    delegate,
    // Additional delegates would go here for Jaspr framework
  ];

  /// A list of supported locales.
  static const List<String> supportedLocales = <String>[
    'en',
    'fi',

  ];

  /// A factory constructor to construct specific subclasses base on a locale.
  static S from(String locale) {
    switch (locale) {
      case 'en':
        return _SEn();
      case 'fi':
        return _SFi();

      default:
        return _SEn();
    }
  }


  /// Portfolio title
  ///
  /// In en, this message translates to:
  /// **'Eetu Kallioniemi | Portfolio'**
  String get title;


  /// No description provided for nav_about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get nav_about;


  /// No description provided for nav_tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get nav_tools;


  /// No description provided for nav_experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get nav_experience;


  /// No description provided for nav_contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get nav_contact;


  /// No description provided for hero_system.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM_ONLINE'**
  String get hero_system;


  /// No description provided for hero_name.
  ///
  /// In en, this message translates to:
  /// **'EETU KALLIONIEMI'**
  String get hero_name;


  /// No description provided for hero_role_1.
  ///
  /// In en, this message translates to:
  /// **'Software Developer '**
  String get hero_role_1;


  /// No description provided for hero_role_2.
  ///
  /// In en, this message translates to:
  /// **' Flutter Specialist'**
  String get hero_role_2;


  /// No description provided for hero_cta.
  ///
  /// In en, this message translates to:
  /// **'Initiate Protocol'**
  String get hero_cta;


  /// No description provided for about_title.
  ///
  /// In en, this message translates to:
  /// **'Who am I?'**
  String get about_title;


  /// No description provided for about_p1_prefix.
  ///
  /// In en, this message translates to:
  /// **'I am a '**
  String get about_p1_prefix;


  /// No description provided for about_p1_highlight.
  ///
  /// In en, this message translates to:
  /// **'Flutter-focused'**
  String get about_p1_highlight;


  /// No description provided for about_p1_suffix.
  ///
  /// In en, this message translates to:
  /// **' software developer from Orivesi. My multi-disciplinary background has given me an unusually strong work ethic and a practical mindset.'**
  String get about_p1_suffix;


  /// No description provided for about_p2.
  ///
  /// In en, this message translates to:
  /// **'I specialize in building scalable, modern applications. Previous roles taught me the value of architecture: I write code that is easy to understand and maintain.'**
  String get about_p2;


  /// No description provided for stat_years.
  ///
  /// In en, this message translates to:
  /// **'Years of experience'**
  String get stat_years;


  /// No description provided for stat_motivation.
  ///
  /// In en, this message translates to:
  /// **'Motivation'**
  String get stat_motivation;


  /// No description provided for attr_title.
  ///
  /// In en, this message translates to:
  /// **'Attributes'**
  String get attr_title;


  /// No description provided for attr_1_title.
  ///
  /// In en, this message translates to:
  /// **'Practical:'**
  String get attr_1_title;


  /// No description provided for attr_1_body.
  ///
  /// In en, this message translates to:
  /// **' Learning by doing and from mistakes.'**
  String get attr_1_body;


  /// No description provided for attr_2_title.
  ///
  /// In en, this message translates to:
  /// **'Humble:'**
  String get attr_2_title;


  /// No description provided for attr_2_body.
  ///
  /// In en, this message translates to:
  /// **' I accept feedback and admit mistakes.'**
  String get attr_2_body;


  /// No description provided for attr_3_title.
  ///
  /// In en, this message translates to:
  /// **'Motivated:'**
  String get attr_3_title;


  /// No description provided for attr_3_body.
  ///
  /// In en, this message translates to:
  /// **' I know I am in the right field.'**
  String get attr_3_body;


  /// No description provided for skills_title.
  ///
  /// In en, this message translates to:
  /// **'Tool stack'**
  String get skills_title;


  /// No description provided for experience_title.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience_title;


  /// No description provided for exp1_task_1.
  ///
  /// In en, this message translates to:
  /// **'Developed independently 100% remotely using modern technologies such as Flutter, AWS, Firebase, and Golang.'**
  String get exp1_task_1;


  /// No description provided for exp1_task_2.
  ///
  /// In en, this message translates to:
  /// **'UI/UX design in Figma using Material 3 principles.'**
  String get exp1_task_2;


  /// No description provided for exp1_task_3.
  ///
  /// In en, this message translates to:
  /// **'Code quality ensured through thorough peer reviews.'**
  String get exp1_task_3;


  /// No description provided for exp2_task_1.
  ///
  /// In en, this message translates to:
  /// **'Backend infrastructure with AWS Serverless (API Gateway, Lambda, Cognito, S3).'**
  String get exp2_task_1;


  /// No description provided for exp2_task_2.
  ///
  /// In en, this message translates to:
  /// **'UI development with Flutter and React.'**
  String get exp2_task_2;


  /// No description provided for exp2_task_3.
  ///
  /// In en, this message translates to:
  /// **'Worked within a Scrum model.'**
  String get exp2_task_3;


  /// No description provided for education_title.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education_title;


  /// No description provided for edu1_title.
  ///
  /// In en, this message translates to:
  /// **'Fullstack Developer'**
  String get edu1_title;


  /// No description provided for edu2_title.
  ///
  /// In en, this message translates to:
  /// **'Software Developer'**
  String get edu2_title;


  /// No description provided for contact_title.
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get contact_title;


  /// No description provided for contact_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contact_email;


  /// No description provided for contact_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone / 24/7'**
  String get contact_phone;


  /// No description provided for contact_location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get contact_location;


  /// No description provided for footer_text.
  ///
  /// In en, this message translates to:
  /// **'Designed for the future // © 2026 Eetu Kallioniemi'**
  String get footer_text;


  /// No description provided for aria_top.
  ///
  /// In en, this message translates to:
  /// **'Back to top'**
  String get aria_top;


  /// No description provided for react_desc.
  ///
  /// In en, this message translates to:
  /// **'React is the first web application framework I learned web development with. It was the first time I became familiar with state management, lifecycles and their hooks, asynchronous programming, as well as HTML and CSS. I have used React in vocational school and on the Ideal Learning course.'**
  String get react_desc;


  /// No description provided for firebase_desc.
  ///
  /// In en, this message translates to:
  /// **'At Aprikoodi, I became familiar with Firebase Firestore and its stream events. It integrates seamlessly with Flutter. I also gained some experience configuring Firestore rules for authorization and planning the architecture of our database.'**
  String get firebase_desc;


  /// No description provided for aws_desc.
  ///
  /// In en, this message translates to:
  /// **'At Amabit, I worked in a backend development role entirely on the AWS platform. There, I got familiar with authentication, authorization, Lambda, API Gateway, S3, Secrets Manager, and more. Most backend services were deployed using CloudFormation YAML templates. Later, we also started adopting the Infrastructure as Code (IaC) approach, defining and configuring backend services through code. My experience at Amabit gave me a solid understanding of AWS.'**
  String get aws_desc;


  /// No description provided for figma_desc.
  ///
  /// In en, this message translates to:
  /// **'Before joining Aprikoodi Oy, I had some experience with Figma, but the deepest learning came at work, where I got to design and visualize plans based on discussions. This made developing applications more efficient because everyone was on the same page. I also became initially familiar with the Material 3 design guidelines.'**
  String get figma_desc;


  /// No description provided for golang_desc.
  ///
  /// In en, this message translates to:
  /// **'At Aprikoodi Oy, I gained experience building backend applications with Golang. Golang is easy to read and highly efficient. I appreciated its idiomatic approach to writing code.'**
  String get golang_desc;


  /// No description provided for cicd_desc.
  ///
  /// In en, this message translates to:
  /// **'At Amabit, I worked on the release and development pipelines for our application. Exploring these pipelines was very exciting, as it inspired ideas on further automating and improving the environments of our applications. I believe that even moderately sized applications should have separate sandbox environments for development branches and proper release pipelines to ensure quality through automated testing.'**
  String get cicd_desc;


  /// No description provided for wordpress_desc.
  ///
  /// In en, this message translates to:
  /// **'At Amabit, I helped revamp their website, which was built with WordPress. This was my first hands-on experience with WordPress. At Aprikoodi, I also developed a small custom plugin for a WordPress site using React.'**
  String get wordpress_desc;


  /// No description provided for python_desc.
  ///
  /// In en, this message translates to:
  /// **'Python is the language I started learning in school to understand programming logic. Later at Amabit, I also wrote Lambda functions using Python.'**
  String get python_desc;


  /// No description provided for csharp_desc.
  ///
  /// In en, this message translates to:
  /// **'In school, when learning Unity, scripts were written in C#. While much of this may have been forgotten, I still consider it worth mentioning.'**
  String get csharp_desc;


  /// No description provided for flutter_desc.
  ///
  /// In en, this message translates to:
  /// **'Flutter – what an amazing application development framework. It fits almost any scenario: write one codebase and compile it for multiple platforms. I strongly believe it will be one of the strongest technologies in the future, and other frameworks will take inspiration from it. I first encountered Flutter during my internship at Amabit. I didn’t get to use it extensively there, but after joining Aprikoodi Oy, Flutter became my main tool for almost two years. My employer had extensive experience with Flutter and guided me toward good architectural patterns.'**
  String get flutter_desc;


  /// No description provided for projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;


  /// No description provided for projects_underwork.
  ///
  /// In en, this message translates to:
  /// **'Project showcase is currently under construction. Check back soon for featured work.'**
  String get projects_underwork;


  /// No description provided for loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;


  /// No description provided for compiling_project.
  ///
  /// In en, this message translates to:
  /// **'COMPILING PROJECTS'**
  String get compiling_project;


}

/// Delegate class for S localizations.
class SDelegate extends LocalizationsDelegate<S> {
  const SDelegate();

  /// A list of supported locales.
  static const List<Locale> supportedLocales = <Locale>[
        Locale('en'),
    Locale('fi'),

  ];

  /// Whether this delegate supports the given locale.
  @override
  bool isSupported(Locale locale) {
    return supportedLocales.any((l) => l.languageCode == locale.languageCode);
  }

  /// Load the localizations for the given locale.
  @override
  Future<S> load(Locale locale) async {
    return S.from(locale.toLanguageTag());
  }
}


class _SEn extends S {
  _SEn([String locale = 'en']) : super(locale);

  
  @override
  String get title => 'Eetu Kallioniemi | Portfolio';


  @override
  String get nav_about => 'About';


  @override
  String get nav_tools => 'Tools';


  @override
  String get nav_experience => 'Experience';


  @override
  String get nav_contact => 'Contact';


  @override
  String get hero_system => 'SYSTEM_ONLINE';


  @override
  String get hero_name => 'EETU KALLIONIEMI';


  @override
  String get hero_role_1 => 'Software Developer ';


  @override
  String get hero_role_2 => ' Flutter Specialist';


  @override
  String get hero_cta => 'Initiate Protocol';


  @override
  String get about_title => 'Who am I?';


  @override
  String get about_p1_prefix => 'I am a ';


  @override
  String get about_p1_highlight => 'Flutter-focused';


  @override
  String get about_p1_suffix => ' software developer from Orivesi. My multi-disciplinary background has given me an unusually strong work ethic and a practical mindset.';


  @override
  String get about_p2 => 'I specialize in building scalable, modern applications. Previous roles taught me the value of architecture: I write code that is easy to understand and maintain.';


  @override
  String get stat_years => 'Years of experience';


  @override
  String get stat_motivation => 'Motivation';


  @override
  String get attr_title => 'Attributes';


  @override
  String get attr_1_title => 'Practical:';


  @override
  String get attr_1_body => ' Learning by doing and from mistakes.';


  @override
  String get attr_2_title => 'Humble:';


  @override
  String get attr_2_body => ' I accept feedback and admit mistakes.';


  @override
  String get attr_3_title => 'Motivated:';


  @override
  String get attr_3_body => ' I know I am in the right field.';


  @override
  String get skills_title => 'Tool stack';


  @override
  String get experience_title => 'Experience';


  @override
  String get exp1_task_1 => 'Developed independently 100% remotely using modern technologies such as Flutter, AWS, Firebase, and Golang.';


  @override
  String get exp1_task_2 => 'UI/UX design in Figma using Material 3 principles.';


  @override
  String get exp1_task_3 => 'Code quality ensured through thorough peer reviews.';


  @override
  String get exp2_task_1 => 'Backend infrastructure with AWS Serverless (API Gateway, Lambda, Cognito, S3).';


  @override
  String get exp2_task_2 => 'UI development with Flutter and React.';


  @override
  String get exp2_task_3 => 'Worked within a Scrum model.';


  @override
  String get education_title => 'Education';


  @override
  String get edu1_title => 'Fullstack Developer';


  @override
  String get edu2_title => 'Software Developer';


  @override
  String get contact_title => 'Get in touch';


  @override
  String get contact_email => 'Email';


  @override
  String get contact_phone => 'Phone / 24/7';


  @override
  String get contact_location => 'Location';


  @override
  String get footer_text => 'Designed for the future // © 2026 Eetu Kallioniemi';


  @override
  String get aria_top => 'Back to top';


  @override
  String get react_desc => 'React is the first web application framework I learned web development with. It was the first time I became familiar with state management, lifecycles and their hooks, asynchronous programming, as well as HTML and CSS. I have used React in vocational school and on the Ideal Learning course.';


  @override
  String get firebase_desc => 'At Aprikoodi, I became familiar with Firebase Firestore and its stream events. It integrates seamlessly with Flutter. I also gained some experience configuring Firestore rules for authorization and planning the architecture of our database.';


  @override
  String get aws_desc => 'At Amabit, I worked in a backend development role entirely on the AWS platform. There, I got familiar with authentication, authorization, Lambda, API Gateway, S3, Secrets Manager, and more. Most backend services were deployed using CloudFormation YAML templates. Later, we also started adopting the Infrastructure as Code (IaC) approach, defining and configuring backend services through code. My experience at Amabit gave me a solid understanding of AWS.';


  @override
  String get figma_desc => 'Before joining Aprikoodi Oy, I had some experience with Figma, but the deepest learning came at work, where I got to design and visualize plans based on discussions. This made developing applications more efficient because everyone was on the same page. I also became initially familiar with the Material 3 design guidelines.';


  @override
  String get golang_desc => 'At Aprikoodi Oy, I gained experience building backend applications with Golang. Golang is easy to read and highly efficient. I appreciated its idiomatic approach to writing code.';


  @override
  String get cicd_desc => 'At Amabit, I worked on the release and development pipelines for our application. Exploring these pipelines was very exciting, as it inspired ideas on further automating and improving the environments of our applications. I believe that even moderately sized applications should have separate sandbox environments for development branches and proper release pipelines to ensure quality through automated testing.';


  @override
  String get wordpress_desc => 'At Amabit, I helped revamp their website, which was built with WordPress. This was my first hands-on experience with WordPress. At Aprikoodi, I also developed a small custom plugin for a WordPress site using React.';


  @override
  String get python_desc => 'Python is the language I started learning in school to understand programming logic. Later at Amabit, I also wrote Lambda functions using Python.';


  @override
  String get csharp_desc => 'In school, when learning Unity, scripts were written in C#. While much of this may have been forgotten, I still consider it worth mentioning.';


  @override
  String get flutter_desc => 'Flutter – what an amazing application development framework. It fits almost any scenario: write one codebase and compile it for multiple platforms. I strongly believe it will be one of the strongest technologies in the future, and other frameworks will take inspiration from it. I first encountered Flutter during my internship at Amabit. I didn’t get to use it extensively there, but after joining Aprikoodi Oy, Flutter became my main tool for almost two years. My employer had extensive experience with Flutter and guided me toward good architectural patterns.';


  @override
  String get projects => 'Projects';


  @override
  String get projects_underwork => 'Project showcase is currently under construction. Check back soon for featured work.';


  @override
  String get loading => 'Loading';


  @override
  String get compiling_project => 'COMPILING PROJECTS';


}


class _SFi extends S {
  _SFi([String locale = 'fi']) : super(locale);

  
  @override
  String get title => 'Eetu Kallioniemi | Portfolio';


  @override
  String get nav_about => 'Tietoja';


  @override
  String get nav_tools => 'Työkalut';


  @override
  String get nav_experience => 'Kokemus';


  @override
  String get nav_contact => 'Yhteys';


  @override
  String get hero_system => 'JÄRJESTELMÄ_KÄYNNISSÄ';


  @override
  String get hero_name => 'EETU KALLIONIEMI';


  @override
  String get hero_role_1 => 'Ohjelmistokehittäjä ';


  @override
  String get hero_role_2 => ' Flutter-asiantuntija';


  @override
  String get hero_cta => 'Käynnistä Protokolla';


  @override
  String get about_title => 'Kuka olen minä?';


  @override
  String get about_p1_prefix => 'Olen Orivedeltä kotoisin oleva ';


  @override
  String get about_p1_highlight => 'Flutter-painotteinen';


  @override
  String get about_p1_suffix => ' ohjelmistokehittäjä. Tulen moniammatillisesta taustasta, mikä on antanut minulle poikkeuksellisen vahvan työmoraalin ja käytännönläheisen asenteen.';


  @override
  String get about_p2 => 'Erikoistun skaalautuvien ja modernien sovellusten rakentamiseen. Aikaisemmat työnantajani ovat opettaneet minulle arkkitehtuurin merkityksen: kirjoitan koodia, joka on helppo ymmärtää ja ylläpitää.';


  @override
  String get stat_years => 'Vuotta kokemusta';


  @override
  String get stat_motivation => 'Motivaatio';


  @override
  String get attr_title => 'Ominaisuudet';


  @override
  String get attr_1_title => 'Käytännönläheinen:';


  @override
  String get attr_1_body => ' Oppiminen tekemällä ja virheistä.';


  @override
  String get attr_2_title => 'Nöyrä:';


  @override
  String get attr_2_body => ' Hyväksyn palautteen ja myönnän virheeni.';


  @override
  String get attr_3_title => 'Motivoitunut:';


  @override
  String get attr_3_body => ' Tiedän olevani oikealla alalla.';


  @override
  String get skills_title => 'Työkalupino';


  @override
  String get experience_title => 'Työhistoria';


  @override
  String get exp1_task_1 => 'Kehitin itsenäisesti 100% etänä käyttäen moderneja teknologioita kuten Flutter, AWS, Firebase ja Golang.';


  @override
  String get exp1_task_2 => 'Käyttöliittymä- ja käyttökokemussuunnittelu Figmalla hyödyntäen Material 3 -periaatteita.';


  @override
  String get exp1_task_3 => 'Koodin laatu varmistettiin tarkkojen vertaisarviointien kautta.';


  @override
  String get exp2_task_1 => 'Taustajärjestelmäinfrastruktuurin kehitys AWS:n palvelimettomilla palveluilla (API Gateway, Lambda, Cognito, S3).';


  @override
  String get exp2_task_2 => 'Käyttöliittymien kehitys Flutterilla ja Reactilla.';


  @override
  String get exp2_task_3 => 'Työskentely Scrum-mallin mukaisesti.';


  @override
  String get education_title => 'Koulutus';


  @override
  String get edu1_title => 'Fullstack kehittäjä';


  @override
  String get edu2_title => 'Ohjelmistokehittäjä';


  @override
  String get contact_title => 'Ota yhteyttä';


  @override
  String get contact_email => 'Sähköposti';


  @override
  String get contact_phone => 'Puhelin / 24/7';


  @override
  String get contact_location => 'Sijainti';


  @override
  String get footer_text => 'Suunniteltu tulevaisuutta varten // © 2026 Eetu Kallioniemi';


  @override
  String get aria_top => 'Palaa sivun alkuun';


  @override
  String get react_desc => 'React on ensimmäinen web-sovellusympäristö, jonka parissa opiskelin web-kehitystä. Sieltä tuli ensimmäistä kertaa tutuksi tilanhallinta, lifecycle ja näiden hookit, asynkronisuus sekä tietysti HTML ja CSS. Reactia olen päässyt käyttämään ammattikoulussa ja Ideal Learningin kurssilla';


  @override
  String get firebase_desc => 'Aprikoodilla tutustuin Firebasen Firestoreen ja sen tarjoamiin Stream-eventteihin. Se sopii Flutterin kanssa kuin nenä päähän. Tämän myötä myös jonkin verran tuli Firestore-sääntöjen (rules) konfigurointia ja tietokannan arkkitehtuurin suunnittelua.';


  @override
  String get aws_desc => 'Amabitille päästyäni pääsin taustasovelluskehityksen rooliin, missä työskentelin täysin AWS-alustalla. Siellä tutustuin autentikointiin, authorisointiin, Lambdaan, API Gatewayhin, S3:een, Secrets Manageriin ym. Pääosin deployattiin backend-palveluja CloudFormation YAML-templaten avulla. Loppua kohden ruvettiin myös siirtymään IAC-käsitteeseen eli ohjelmointikielen avulla määrittelemään ja konfiguroimaan taustapalveluja. Amabitiltä sain hyvän tuntemuksen AWS:stä.';


  @override
  String get figma_desc => 'Jo ennen Aprikoodi Oy:lle työllistymistä olin jonkin verran tutustunut Figmaan, mutta syvimmän oppimisen opin töissä, missä pääsin suunnittelemaan ja visualisoimaan keskustelupohjalta olevia suunnitelmia. Näin oli mukava lähteä kehittämään sovellusta, kun tiesi, että kaikki ovat samalla kartalla. Material 3 -designohjeet tulivat alustavasti myös tutuiksi.';


  @override
  String get golang_desc => 'Aprikoodi Oy:llä tuli kokemusta taustasovellusten rakentamisesta Golangilla. Golang on helppolukuinen ja tehokas ohjelmointikieli. Ihastuin Golangin idiomaattiseen tapaan kirjoittaa koodia.';


  @override
  String get cicd_desc => 'Amabitillä pääsin tekemään julkaisu- ja kehitysputkia sovelluksellemme. Aluksi tutustuminen oli innostavaa, ja sain paljon ideoita, kuinka automatisoida ja kehittää sovellusten ympäristöjä edelleen. Mielestäni vähänkään suuremmalle sovellukselle kannattaa rakentaa omat hiekkalaatikot kehityshaaroille sekä julkaisuputki laadun varmistamiseksi testien avulla.';


  @override
  String get wordpress_desc => 'Pääsin Amabitillä uudistamaan heidän kotisivujaan, jotka toimivat WordPressillä. Tässä pääsin ensikosketukseen WordPressiin. Aprikoodilla kehitin myös pienen räätälöidyn lisäosan WordPress-sivulle käyttäen Reactia.';


  @override
  String get python_desc => 'Pythonilla lähdin aikoinaan koulussa opettelemaan ohjelmoinnin logiikkaa. Myöhemmin Amabitillä kirjoittelin myös Lambda-funktioita Pythonilla.';


  @override
  String get csharp_desc => 'Koulussa, kun Unityn käyttöä harjoiteltiin, skriptit kirjoitettiin C#:lla. Nämä ovat varmasti jo osittain unohtuneet, mutta mielestäni mainitsemisen arvoisia.';


  @override
  String get flutter_desc => 'Flutter – aivan mahtava sovelluskehitysympäristö, joka sopii lähes tilanteeseen kuin tilanteeseen. Yksi koodikanta riittää, ja sen voi kääntää eri alustoille. Uskon vahvasti, että Flutter tulee tulevaisuudessa olemaan yksi vahvimmista teknologioista, ja että muut ympäristöt ottavat siitä mallia. Flutteriin tutustuin ensimmäistä kertaa, kun pääsin Amabitille työharjoitteluun. Siellä en kuitenkaan päässyt käyttämään Flutteria laajemmin, mutta Aprikoodi Oy:lle työllistyttyäni Flutter oli päätyökaluni lähes kahden vuoden ajan. Työnantajani oli myös vuosia käyttänyt Flutteria ja osasi ohjata hyviin Flutterin rakennusmalleihin.';


  @override
  String get projects => 'Projektit';


  @override
  String get projects_underwork => 'Projektiesittely on parhaillaan työn alla. Tarkista pian uudelleen nähdäksesi esitellyt työt.';


  @override
  String get loading => 'Ladataan';


  @override
  String get compiling_project => 'KÄÄNNETÄÄN PROJEKTEJA';


}

