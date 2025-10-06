import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get english;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'ES'**
  String get spanish;

  /// No description provided for @access.
  ///
  /// In en, this message translates to:
  /// **'Access'**
  String get access;

  /// No description provided for @test.
  ///
  /// In en, this message translates to:
  /// **'Test button'**
  String get test;

  /// No description provided for @futureText.
  ///
  /// In en, this message translates to:
  /// **'Your future is full of opportunities. Dare to move forward and reach your goals!'**
  String get futureText;

  /// No description provided for @techText.
  ///
  /// In en, this message translates to:
  /// **'Technology and comprehensive support to boost employment employment'**
  String get techText;

  /// No description provided for @techParagraph1.
  ///
  /// In en, this message translates to:
  /// **'Enreda combines technology and community action to activate and improve the path to employment, connects the actors and resources of the territory linked to employment, while energizing the labor market.'**
  String get techParagraph1;

  /// No description provided for @techParagraph2.
  ///
  /// In en, this message translates to:
  /// **'If you are looking for a job, Enreda helps you discover your skills to boost your career.'**
  String get techParagraph2;

  /// No description provided for @techParagraph3.
  ///
  /// In en, this message translates to:
  /// **'If you are looking for talent, Enreda is the recruitment portal with impact that your company needs.'**
  String get techParagraph3;

  /// No description provided for @techParagraph4.
  ///
  /// In en, this message translates to:
  /// **'If you are a social entity, Enreda is the tool to support socio-labor intervention and impact measurement.'**
  String get techParagraph4;

  /// No description provided for @participant.
  ///
  /// In en, this message translates to:
  /// **'Participant'**
  String get participant;

  /// No description provided for @participants.
  ///
  /// In en, this message translates to:
  /// **'Participants'**
  String get participants;

  /// No description provided for @participantSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Do you know how to start your path to employment?'**
  String get participantSubtitle;

  /// No description provided for @participantText.
  ///
  /// In en, this message translates to:
  /// **'Enreda brings out the potential of your skills and abilities. It connects you with employment, education and volunteer opportunities, helping you to strengthen your capabilities, acquire new skills and expand your network of contacts in our networking space.'**
  String get participantText;

  /// No description provided for @socialEntities.
  ///
  /// In en, this message translates to:
  /// **'Social entities'**
  String get socialEntities;

  /// No description provided for @socialEntitiesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Do you want to increase the job potential of your participants?'**
  String get socialEntitiesSubtitle;

  /// No description provided for @socialEntitiesText.
  ///
  /// In en, this message translates to:
  /// **'Enreda helps social entities to increase the reach of their resources and activities as well as to provide quality accompaniment. The digital platform allows the creation and dissemination of CVs and the connection with resources and adapted job offers. It also improves case tracking, management efficiency and systematization of the methodology to better reach more people.'**
  String get socialEntitiesText;

  /// No description provided for @companies.
  ///
  /// In en, this message translates to:
  /// **'Companies'**
  String get companies;

  /// No description provided for @companiesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Looking for talent with impact?'**
  String get companiesSubtitle;

  /// No description provided for @companiesText.
  ///
  /// In en, this message translates to:
  /// **'Enreda connects your company with motivated and committed professional profiles in the territory that will meet your expectations and your needs. It allows you to publish job offers and select candidates in an agile way, not only based on knowledge, but also on competencies.'**
  String get companiesText;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get learnMore;

  /// No description provided for @byHand.
  ///
  /// In en, this message translates to:
  /// **'By the hand of...'**
  String get byHand;

  /// No description provided for @enredadas.
  ///
  /// In en, this message translates to:
  /// **'Enredadas'**
  String get enredadas;

  /// No description provided for @funders.
  ///
  /// In en, this message translates to:
  /// **'Funders'**
  String get funders;

  /// No description provided for @daysTransforming.
  ///
  /// In en, this message translates to:
  /// **'Days transforming social reality'**
  String get daysTransforming;

  /// No description provided for @institutionsAndCompanies.
  ///
  /// In en, this message translates to:
  /// **'Institutions and companies'**
  String get institutionsAndCompanies;

  /// No description provided for @resourcesEnabled.
  ///
  /// In en, this message translates to:
  /// **'Resources enabled'**
  String get resourcesEnabled;

  /// No description provided for @jobTitle.
  ///
  /// In en, this message translates to:
  /// **'Start your journey to professional success'**
  String get jobTitle;

  /// No description provided for @jobParagraph1.
  ///
  /// In en, this message translates to:
  /// **'Imagine a world where your life, educational and professional experiences become the bridge to your next job.'**
  String get jobParagraph1;

  /// No description provided for @jobParagraph2.
  ///
  /// In en, this message translates to:
  /// **'At Enreda, we transform this dream into reality. Our platform accompanies you every step of the way: from rediscovering your skills to creating a CV that shines. With interactive tools like our chatbot and a gamification system, we motivate you to reach your goals.'**
  String get jobParagraph2;

  /// No description provided for @jobParagraph3.
  ///
  /// In en, this message translates to:
  /// **'Access resources, participate in activities and receive notifications directly in our app - your future starts here!'**
  String get jobParagraph3;

  /// No description provided for @activeAccount.
  ///
  /// In en, this message translates to:
  /// **'Activate your account!'**
  String get activeAccount;

  /// No description provided for @rediscover.
  ///
  /// In en, this message translates to:
  /// **'Re-discover'**
  String get rediscover;

  /// No description provided for @reimagine.
  ///
  /// In en, this message translates to:
  /// **'Re-imagine'**
  String get reimagine;

  /// No description provided for @rebuild.
  ///
  /// In en, this message translates to:
  /// **'Re-build'**
  String get rebuild;

  /// No description provided for @rediscoverText.
  ///
  /// In en, this message translates to:
  /// **'Discover your hidden strengths and transferable skills that will make you stand out in the world of work.'**
  String get rediscoverText;

  /// No description provided for @reimagineText.
  ///
  /// In en, this message translates to:
  /// **'Imagine new possibilities for your career with creative and customized solutions at your fingertips.'**
  String get reimagineText;

  /// No description provided for @rebuildText.
  ///
  /// In en, this message translates to:
  /// **'Rebuild your future career with innovative tools and the support of our community, taking your employability to the next level.'**
  String get rebuildText;

  /// No description provided for @jobItemsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your next job is waiting for you!'**
  String get jobItemsTitle;

  /// No description provided for @chatbot.
  ///
  /// In en, this message translates to:
  /// **'Chatbot'**
  String get chatbot;

  /// No description provided for @competencies.
  ///
  /// In en, this message translates to:
  /// **'Competencies'**
  String get competencies;

  /// No description provided for @gamification.
  ///
  /// In en, this message translates to:
  /// **'Gamification'**
  String get gamification;

  /// No description provided for @cvCreation.
  ///
  /// In en, this message translates to:
  /// **'CV creation'**
  String get cvCreation;

  /// No description provided for @resourcesAccess.
  ///
  /// In en, this message translates to:
  /// **'Access to offers and resources'**
  String get resourcesAccess;

  /// No description provided for @enredaApp.
  ///
  /// In en, this message translates to:
  /// **'Access to training pills'**
  String get enredaApp;

  /// No description provided for @chatbotText.
  ///
  /// In en, this message translates to:
  /// **'Enreda has a chatbot that accompanies you and guides you to rediscover and recognize your competencies through your life, professional and training experiences.'**
  String get chatbotText;

  /// No description provided for @competenciesText.
  ///
  /// In en, this message translates to:
  /// **'Did you know that in life experiences you acquire skills that are transferable to employment? Enreda will allow you to identify and recognize the skills and abilities you have acquired and value them for employment.'**
  String get competenciesText;

  /// No description provided for @gamificationText.
  ///
  /// In en, this message translates to:
  /// **'With Enreda, you can recognize and record achievements on your path to employment - you\'ll see your progress, feel more motivated and always be ready for your next challenges!'**
  String get gamificationText;

  /// No description provided for @cvCreationText.
  ///
  /// In en, this message translates to:
  /// **'The Enreda platform provides you with the tools to create your CV quickly and easily, taking into account your skills, knowledge, experience and training.'**
  String get cvCreationText;

  /// No description provided for @resourcesAccessText.
  ///
  /// In en, this message translates to:
  /// **'Through Enreda you will be able to learn about different types of resources in which to participate, in addition to strengthening and acquiring new skills, you will expand your network of contacts.'**
  String get resourcesAccessText;

  /// No description provided for @enredaAppText.
  ///
  /// In en, this message translates to:
  /// **'Enreda offers you free training pills in short videos to improve your skills and open doors in the working world. With practical and accessible content, these educational capsules adapt to your time, providing you with effective tools to face work challenges.'**
  String get enredaAppText;

  /// No description provided for @entityTitle.
  ///
  /// In en, this message translates to:
  /// **'Transform lives with Enreda: Technology at the service of job accompaniment.'**
  String get entityTitle;

  /// No description provided for @entityParagraph1.
  ///
  /// In en, this message translates to:
  /// **'Do you want your programs and resources to go further? Do you want to increase the employment potential of your participants Enreda helps social entities to improve the employability situation of their participants.'**
  String get entityParagraph1;

  /// No description provided for @entityParagraph2.
  ///
  /// In en, this message translates to:
  /// **'It allows the generation of updated and professional CVs from a competency-based approach, highlighting the skills and abilities of each person. It favors their certification, thus increasing their value.'**
  String get entityParagraph2;

  /// No description provided for @entityParagraph3.
  ///
  /// In en, this message translates to:
  /// **'Facilitates the follow-up of the itineraries, systematizing each process and action. It makes it easy and intuitive to visualize each participant\'s current stage on the path to employment.'**
  String get entityParagraph3;

  /// No description provided for @bePartEnreda.
  ///
  /// In en, this message translates to:
  /// **'Be part of Enreda!'**
  String get bePartEnreda;

  /// No description provided for @rediscoverEntity.
  ///
  /// In en, this message translates to:
  /// **'Rediscover a new way of accompanying participants using technology adapted to the social sector, enhancing their development and personal growth.'**
  String get rediscoverEntity;

  /// No description provided for @reimagineEntity.
  ///
  /// In en, this message translates to:
  /// **'Reimagines a just world where employability is accessible to all, promoting equal opportunity and social welfare.'**
  String get reimagineEntity;

  /// No description provided for @rebuildEntity.
  ///
  /// In en, this message translates to:
  /// **'Rebuilds the competency-based hiring process and forms strategic alliances to foster diverse and inclusive talent, creating a positive impact on society.'**
  String get rebuildEntity;

  /// No description provided for @entityItemsTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover all the options that Enreda Entidad offers you.'**
  String get entityItemsTitle;

  /// No description provided for @intervention.
  ///
  /// In en, this message translates to:
  /// **'Direct intervention'**
  String get intervention;

  /// No description provided for @enredaMethodology.
  ///
  /// In en, this message translates to:
  /// **'Enreda methodology'**
  String get enredaMethodology;

  /// No description provided for @solutionDesign.
  ///
  /// In en, this message translates to:
  /// **'Design of tailor-made solutions for intervention'**
  String get solutionDesign;

  /// No description provided for @resourcesCreation.
  ///
  /// In en, this message translates to:
  /// **'Creation of resources'**
  String get resourcesCreation;

  /// No description provided for @entitiesDirectory.
  ///
  /// In en, this message translates to:
  /// **'Organize and manage your Agenda'**
  String get entitiesDirectory;

  /// No description provided for @interventionText.
  ///
  /// In en, this message translates to:
  /// **'It offers personalized attention to each candidate, assessing their needs and providing ongoing support to improve their employability.'**
  String get interventionText;

  /// No description provided for @enredaMethodologyText.
  ///
  /// In en, this message translates to:
  /// **'Apply our innovative methodology that combines technology and social knowledge to enhance the integral development of each participant.'**
  String get enredaMethodologyText;

  /// No description provided for @solutionDesignText.
  ///
  /// In en, this message translates to:
  /// **'Create customized strategies for each case, adapting our resources and tools to the specific needs of your participants.'**
  String get solutionDesignText;

  /// No description provided for @resourcesCreationText.
  ///
  /// In en, this message translates to:
  /// **'Develops and shares educational and training materials that support the professional and personal growth of participants. Provides guides, training programs and practical tools to improve the employability and competencies of each individual.'**
  String get resourcesCreationText;

  /// No description provided for @entitiesDirectoryText.
  ///
  /// In en, this message translates to:
  /// **'Organize and manage the basic and contact information of other entities. Maintain your own private agenda, accessible to all your organization\'s techniques, and always have the necessary data at hand to collaborate effectively.'**
  String get entitiesDirectoryText;

  /// No description provided for @talentTitle.
  ///
  /// In en, this message translates to:
  /// **'Your inclusive and engaged talent portal'**
  String get talentTitle;

  /// No description provided for @talentParagraph1.
  ///
  /// In en, this message translates to:
  /// **'At Enreda, we believe that inclusive talent is key to success and innovation in your company. Our platform allows you to post job offers and connect with professional talent, boosting local development and strengthening the skills of your team.'**
  String get talentParagraph1;

  /// No description provided for @talentParagraph2.
  ///
  /// In en, this message translates to:
  /// **'We implement a job placement model that combines technology and personalized support, ensuring that each candidate receives the necessary support to successfully integrate into the labor market.'**
  String get talentParagraph2;

  /// No description provided for @talentParagraph3.
  ///
  /// In en, this message translates to:
  /// **'We adapt and certify skills to bring real value to companies and encourage personal and professional growth, preparing each candidate for success.'**
  String get talentParagraph3;

  /// No description provided for @exploreProfiles.
  ///
  /// In en, this message translates to:
  /// **'Discover talent'**
  String get exploreProfiles;

  /// No description provided for @rediscoverTalent.
  ///
  /// In en, this message translates to:
  /// **'Explore a recruitment portal with impact, where every posted offer connects you with committed talent ready to transform your company.'**
  String get rediscoverTalent;

  /// No description provided for @reimagineTalent.
  ///
  /// In en, this message translates to:
  /// **'Imagine a recruitment process based on competencies and social responsibility, ensuring that every hire contributes to the well-being of the community.'**
  String get reimagineTalent;

  /// No description provided for @rebuildTalent.
  ///
  /// In en, this message translates to:
  /// **'Rebuild your team with an inclusive talent pipeline, specifically trained to meet your company\'s unique needs and foster a diverse and dynamic work environment.'**
  String get rebuildTalent;

  /// No description provided for @talentItemsTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover all the options offered by Enreda Companies'**
  String get talentItemsTitle;

  /// No description provided for @jobOffersPublication.
  ///
  /// In en, this message translates to:
  /// **'Publication of job offers'**
  String get jobOffersPublication;

  /// No description provided for @candidatesFollow.
  ///
  /// In en, this message translates to:
  /// **'Profiles tracking'**
  String get candidatesFollow;

  /// No description provided for @candidatesSelection.
  ///
  /// In en, this message translates to:
  /// **'Selection process'**
  String get candidatesSelection;

  /// No description provided for @jobOffersPublicationText.
  ///
  /// In en, this message translates to:
  /// **'Publish your job offers in a simple and efficient way. With our platform, you will reach a broad base of qualified people, optimizing your recruitment efforts.'**
  String get jobOffersPublicationText;

  /// No description provided for @candidatesFollowText.
  ///
  /// In en, this message translates to:
  /// **'Track candidates in detail from application to hiring. Our platform allows you to manage and organize all applicant information in one place, facilitating decision making.'**
  String get candidatesFollowText;

  /// No description provided for @candidatesSelectionText.
  ///
  /// In en, this message translates to:
  /// **'Optimize the entire recruitment process with our advanced tools. Facilitate interview scheduling, conduct assessments and find the best talent for your company quickly and efficiently.'**
  String get candidatesSelectionText;

  /// No description provided for @resources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get resources;

  /// No description provided for @jobSearch.
  ///
  /// In en, this message translates to:
  /// **'Looking for a job'**
  String get jobSearch;

  /// No description provided for @entities.
  ///
  /// In en, this message translates to:
  /// **'Entities'**
  String get entities;

  /// No description provided for @talentSearch.
  ///
  /// In en, this message translates to:
  /// **'Looking for talent'**
  String get talentSearch;

  /// No description provided for @joinNow.
  ///
  /// In en, this message translates to:
  /// **'Join now!'**
  String get joinNow;

  /// No description provided for @resourcesAbout.
  ///
  /// In en, this message translates to:
  /// **'At Enreda, we connect you with educational resources, employment opportunities, training, internships, volunteering and more. Build your own path with the tools you need to move forward.'**
  String get resourcesAbout;

  /// No description provided for @resourcesSearch.
  ///
  /// In en, this message translates to:
  /// **'Search by area'**
  String get resourcesSearch;

  /// No description provided for @personTextBea.
  ///
  /// In en, this message translates to:
  /// **'Beatriz Villavicencio, an employment counselor, provides advice and resources to participants to maximize their career opportunities. Her strategic and personalized approach helps build strong and successful careers.'**
  String get personTextBea;

  /// No description provided for @personTextMaria.
  ///
  /// In en, this message translates to:
  /// **'Maria Barroso, a social worker with a solid background, is dedicated to guiding participants towards a better future. Her commitment and empathy are key in transforming lives, creating a lasting positive impact.'**
  String get personTextMaria;

  /// No description provided for @personTextLaura.
  ///
  /// In en, this message translates to:
  /// **'Laura García, a psychologist specializing in labor reinsertion, works tirelessly to strengthen the participants\' self-esteem and skills. Her psychological support is fundamental in their path to professional success.'**
  String get personTextLaura;

  /// No description provided for @personTextValeria.
  ///
  /// In en, this message translates to:
  /// **'Valeria Payán, coordinator of the transversal axis of New Narratives in the Canary Islands, is an expert in gender, migration, citizen participation and community dynamization. With extensive experience in prevention and vocational training, she promotes social and labor integration, creating bridges between people at risk of social exclusion and labor markets.'**
  String get personTextValeria;

  /// No description provided for @personTextAidira.
  ///
  /// In en, this message translates to:
  /// **'Social worker and project technician, she participates in active listening to the community as an active agent of change. Her experience is marked by group and community work with different groups, with a participatory and dynamic approach, with an inclusive work ethic, listening and cooperative resolution, respecting diversity.'**
  String get personTextAidira;

  /// No description provided for @personTextAna.
  ///
  /// In en, this message translates to:
  /// **'Ana González, social worker and social and labor intervention technician, facilitates social and labor integration. She collaborates with other professionals to promote individual progress and open up new job opportunities, pushing each person towards a better future.'**
  String get personTextAna;

  /// No description provided for @personTextIdaira.
  ///
  /// In en, this message translates to:
  /// **'Idaira Quintero Martín, Social and Labor Insertion Technician and Social Worker specialized in Equality and Migration, is dedicated to the empowerment and social inclusion of vulnerable people. With extensive experience in social intervention and group facilitation, her work promotes pre-employment training and welfare, with a strong commitment to social justice.'**
  String get personTextIdaira;

  /// No description provided for @personTextMorelia.
  ///
  /// In en, this message translates to:
  /// **'Morelia Rivero, Labor Prospector, in charge of analyzing and managing labor market demands, analyzing the needs of companies, outlining suitable collaboration strategies, promoting talent and job opportunities for our participants.'**
  String get personTextMorelia;

  /// No description provided for @personPosition.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get personPosition;

  /// No description provided for @positionBea.
  ///
  /// In en, this message translates to:
  /// **'Project technology'**
  String get positionBea;

  /// No description provided for @positionMaria.
  ///
  /// In en, this message translates to:
  /// **'Technique of social and labor insertion'**
  String get positionMaria;

  /// No description provided for @positionLaura.
  ///
  /// In en, this message translates to:
  /// **'Canary Islands node coordination'**
  String get positionLaura;

  /// No description provided for @positionValeria.
  ///
  /// In en, this message translates to:
  /// **'New narrative techniques'**
  String get positionValeria;

  /// No description provided for @positionAidira.
  ///
  /// In en, this message translates to:
  /// **'Project technology'**
  String get positionAidira;

  /// No description provided for @positionAna.
  ///
  /// In en, this message translates to:
  /// **'Technician in socio-labor insertion'**
  String get positionAna;

  /// No description provided for @positionIdaira.
  ///
  /// In en, this message translates to:
  /// **'Technician in socio-labor insertion'**
  String get positionIdaira;

  /// No description provided for @positionMorelia.
  ///
  /// In en, this message translates to:
  /// **'Technician in labor prospecting'**
  String get positionMorelia;

  /// No description provided for @personTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Enreda Canarias Team'**
  String get personTitle;

  /// No description provided for @enredaCompanies.
  ///
  /// In en, this message translates to:
  /// **'Enredadas Companies'**
  String get enredaCompanies;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My account'**
  String get myAccount;

  /// No description provided for @professionalAccount.
  ///
  /// In en, this message translates to:
  /// **'Professional account'**
  String get professionalAccount;

  /// No description provided for @pillsText.
  ///
  /// In en, this message translates to:
  /// **'Explore our short and practical training videos, designed to boost your job skills quickly and effectively, click and start opening new opportunities!'**
  String get pillsText;

  /// No description provided for @pillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Formative pills'**
  String get pillsTitle;

  /// No description provided for @job.
  ///
  /// In en, this message translates to:
  /// **'Job'**
  String get job;

  /// No description provided for @practices.
  ///
  /// In en, this message translates to:
  /// **'Practices'**
  String get practices;

  /// No description provided for @formation.
  ///
  /// In en, this message translates to:
  /// **'Formation'**
  String get formation;

  /// No description provided for @volunteering.
  ///
  /// In en, this message translates to:
  /// **'Volunteering'**
  String get volunteering;

  /// No description provided for @entertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get entertainment;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @partOfChange.
  ///
  /// In en, this message translates to:
  /// **'Be part of the change,'**
  String get partOfChange;

  /// No description provided for @enredate.
  ///
  /// In en, this message translates to:
  /// **'¡Enredate!'**
  String get enredate;

  /// No description provided for @contactNow.
  ///
  /// In en, this message translates to:
  /// **'Contact now'**
  String get contactNow;

  /// No description provided for @joinEnreda.
  ///
  /// In en, this message translates to:
  /// **'Join Enreda and build your future with us'**
  String get joinEnreda;

  /// No description provided for @discoverFooter.
  ///
  /// In en, this message translates to:
  /// **'Discover how we transform the path to employment, listening and collaborating with the ecosystem to create networked opportunities.'**
  String get discoverFooter;

  /// No description provided for @inscribeNow.
  ///
  /// In en, this message translates to:
  /// **'I want to register now'**
  String get inscribeNow;

  /// No description provided for @putEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and join'**
  String get putEmail;

  /// No description provided for @viewMore.
  ///
  /// In en, this message translates to:
  /// **'View more'**
  String get viewMore;

  /// No description provided for @impulsedBy.
  ///
  /// In en, this message translates to:
  /// **'Impulsed by...'**
  String get impulsedBy;

  /// No description provided for @impulsedByText.
  ///
  /// In en, this message translates to:
  /// **'Enreda was born from the collaboration between Sic4Change and Proyecto Kieu, with the aim of boosting talent and promoting employment. Together, we propose a paradigm shift based on competencies and territorial approach.'**
  String get impulsedByText;

  /// No description provided for @downloadTitle.
  ///
  /// In en, this message translates to:
  /// **'Keep your progress always with you Download Enreda App and don\'t miss anything!'**
  String get downloadTitle;

  /// No description provided for @downloadText1.
  ///
  /// In en, this message translates to:
  /// **'With the Enreda app, you\'ll have access to all the tools and resources you need to advance on your path to employment. Monitor your achievements, receive important notifications, and stay in touch with your support network from anywhere. '**
  String get downloadText1;

  /// No description provided for @downloadText2.
  ///
  /// In en, this message translates to:
  /// **'Download it now and start building your future today!'**
  String get downloadText2;

  /// No description provided for @contactFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact form'**
  String get contactFormTitle;

  /// No description provided for @contactFormText.
  ///
  /// In en, this message translates to:
  /// **'Transform the future of your participants. Tell us briefly about your project and we will contact you.'**
  String get contactFormText;

  /// No description provided for @contactFormName.
  ///
  /// In en, this message translates to:
  /// **'Name and surname'**
  String get contactFormName;

  /// No description provided for @contactFormEntityName.
  ///
  /// In en, this message translates to:
  /// **'Name of entity'**
  String get contactFormEntityName;

  /// No description provided for @contactFormEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactFormEmail;

  /// No description provided for @contactFormPhone.
  ///
  /// In en, this message translates to:
  /// **'Telephone number'**
  String get contactFormPhone;

  /// No description provided for @contactFormFree.
  ///
  /// In en, this message translates to:
  /// **'How can we help you?'**
  String get contactFormFree;

  /// No description provided for @contactFormTextCompany.
  ///
  /// In en, this message translates to:
  /// **'Would you like to find talent quickly and easily? Fill out this form and we will contact you.'**
  String get contactFormTextCompany;

  /// No description provided for @contactFormCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Name of company'**
  String get contactFormCompanyName;

  /// No description provided for @contactFormSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get contactFormSend;

  /// No description provided for @contactFormEmpty.
  ///
  /// In en, this message translates to:
  /// **'This field cannot be empty'**
  String get contactFormEmpty;

  /// No description provided for @locationTitle.
  ///
  /// In en, this message translates to:
  /// **'Where we are'**
  String get locationTitle;

  /// No description provided for @locationText.
  ///
  /// In en, this message translates to:
  /// **'An innovative program focused on promoting talent for employment through community and territorial dynamism'**
  String get locationText;

  /// No description provided for @downloadDrawer.
  ///
  /// In en, this message translates to:
  /// **'Download the app'**
  String get downloadDrawer;

  /// No description provided for @iAmCompany.
  ///
  /// In en, this message translates to:
  /// **'I am company'**
  String get iAmCompany;

  /// No description provided for @iAmEntity.
  ///
  /// In en, this message translates to:
  /// **'I am entity'**
  String get iAmEntity;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
