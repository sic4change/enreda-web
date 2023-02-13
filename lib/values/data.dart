part of values;

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: StringConst.TWITTER_URL,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
    SocialButtonData(
      tag: StringConst.FACEBOOK_URL,
      iconData: FontAwesomeIcons.facebook,
      url: StringConst.FACEBOOK_URL,
    ),
    SocialButtonData(
      tag: StringConst.LINKED_IN_URL,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialButtonData(
      tag: StringConst.INSTAGRAM_URL,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
  ];

  static List<SocialButtonData> socialDataTeam = [
    SocialButtonData(
      tag: StringConst.LINKED_IN_URL,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialButtonData(
      tag: StringConst.TWITTER_URL,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
  ];


  static List<SkillLevelData> skillLevelData = [
    SkillLevelData(
      skill: StringConst.YOUNGS,
      level: 80,
    ),
    SkillLevelData(
      skill: StringConst.INSTITUTIONS,
      level: 90,
    ),
    SkillLevelData(
      skill: StringConst.COMPANIES,
      level: 70,
    ),
  ];

  static List<SkillCardData> skillCardData = [
    SkillCardData(
      title: StringConst.YOUNGS,
      subtitle: StringConst.YOUNG_1_DESC.toUpperCase(),
      description: StringConst.YOUNG_2_DESC,
      iconData: FontAwesomeIcons.user,
      imageString: ImagePath.SKILL_01,
    ),
    SkillCardData(
      title: StringConst.INSTITUTIONS,
      subtitle: StringConst.INSTITUTIONS_1_DESC.toUpperCase(),
      description: StringConst.INSTITUTIONS_2_DESC,
      iconData: Icons.pages_outlined,
      imageString: ImagePath.SKILL_02,
    ),
    SkillCardData(
      title: StringConst.COMPANIES,
      subtitle: StringConst.COMPANIES_1_DESC.toUpperCase(),
      description: StringConst.COMPANIES_2_DESC,
      iconData: FontAwesomeIcons.building,
      imageString: ImagePath.SKILL_03,
    ),
    SkillCardData(
      title: StringConst.CITIZENS,
      subtitle: StringConst.CITIZENS_1_DESC.toUpperCase(),
      description: StringConst.CITIZENS_2_DESC,
      iconData: FontAwesomeIcons.userFriends,
      imageString: ImagePath.SKILL_04,
    ),
  ];

  static List<HandCategoryData> projectCategories = [
    HandCategoryData(title: StringConst.ALL, number: 6, isSelected: true),
    HandCategoryData(title: StringConst.OBRA_SOCIAL, number: 1),
    HandCategoryData(title: StringConst.AAPP, number: 1),
    HandCategoryData(title: StringConst.COLABORATOR, number: 2),
    HandCategoryData(title: StringConst.ONG, number: 3),
  ];

  static List<String> awards1 = [
    StringConst.DIAGNOSIS_1,
    StringConst.DIAGNOSIS_2,
  ];

  static List<String> awardsUrl1 = [
    StringConst.DIAGNOSIS_WEB_1,
    StringConst.DIAGNOSIS_WEB_2,
  ];

  static List<PersonCardData> blogData = [
    PersonCardData(
      name: StringConst.TEAM_PERSON_1,
      position: StringConst.POSITION_PERSON_1,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.TEAM_01,
        urlLinkedin: "https://www.linkedin.com/in/borja-monreal/",
        urlTwitter: "https://twitter.com/Borja_Monreal"
    ),
    PersonCardData(
      name: StringConst.TEAM_PERSON_2,
      position: StringConst.POSITION_PERSON_2,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.TEAM_02,
        urlLinkedin: "https://www.linkedin.com/in/blanca-p%C3%A9rez-lozano-3166469a/",
        urlTwitter: "https://twitter.com/blancaploz"
    ),
    PersonCardData(
      name: StringConst.TEAM_PERSON_3,
      position: StringConst.POSITION_PERSON_3,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.TEAM_03,
        urlLinkedin: "https://www.linkedin.com/in/aaron-asencio-tavio-61155021/",
        urlTwitter: ""
    ),
    PersonCardData(
      name: StringConst.TEAM_PERSON_4,
      position: StringConst.POSITION_PERSON_4,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.TEAM_04,
        urlLinkedin: "https://www.linkedin.com/in/cristina-paredes-carrascosa-05a4731a1/",
        urlTwitter: ""
    ),
  ];

  static List<MainPageData> mainPageData = [
    MainPageData(
        circleImagePath: ImagePath.HOME_CIRCLE_WEB,
        headerImagePath: ImagePath.DEV_HEADER,
        introText: StringConst.INTRO,
        positionText: StringConst.POSITION,
        aboutText: StringConst.ABOUT_1,
        buttonText: StringConst.DISCOVER,
        storesButtons: BuildStoresButtons(160, 65),
        chatButton: false,
    ),
    MainPageData(
        circleImagePath: ImagePath.HOME_CIRCLE_WEB,
        headerImagePath: ImagePath.DEV_HEADER2,
        introText: StringConst.INTRO2,
        positionText: StringConst.POSITION2,
        aboutText: StringConst.ABOUT_2,
        buttonText: StringConst.DISCOVER2,
        chatButton: true,
    ),
    MainPageData(
      circleImagePath: ImagePath.HOME_CIRCLE_WEB,
      headerImagePath: ImagePath.DEV_HEADER3,
      introText: StringConst.INTRO3,
      positionText: StringConst.POSITION3,
      aboutText: StringConst.ABOUT_1,
      buttonText: StringConst.DISCOVER,
      chatButton: false,
    ),

  ];

  static List<EnredaCardData> enredaCardData = [
    EnredaCardData(
      title: StringConst.SEARCH_JOB.toUpperCase(),
      subtitle: StringConst.SEARCH_JOB_SUB,
      imageString: ImagePath.SEARCH_JOB,
      onTapCard: UnemployedRegistering(),
    ),
    EnredaCardData(
      title: StringConst.COLABORATOR.toUpperCase(),
      subtitle: StringConst.COLABORATOR_SUB,
      imageString: ImagePath.FOR_COLABORATOR,
      onTapCard: MentorRegistering(),

    ),
    EnredaCardData(
      title: StringConst.ORGANIZATION.toUpperCase(),
      subtitle: StringConst.FREELANCER_DESC,
      imageString: ImagePath.FOR_ORGANIZATION,
      onTapCard: OrganizationRegistering(),
    ),
  ];

  static List<CompanyData> allProjects = [
    CompanyData(
        title: StringConst.COMPANY_1_TITLE,
        category: StringConst.US,
        projectCoverUrl: ImagePath.PORTFOLIO_1,
        width: 0.225,
        url: "https://www.sic4change.org/",
    ),
    CompanyData(
        title: StringConst.PROYECTO_KIEU,
        category: StringConst.ONG,
        projectCoverUrl: ImagePath.PORTFOLIO_2,
        width: 0.225,
        url: "https://www.proyectokieu.org/",
    ),
    CompanyData(
        title: StringConst.LA_CAIXA,
        category: StringConst.OBRA_SOCIAL,
        projectCoverUrl: ImagePath.PORTFOLIO_3,
        width: 0.225,
        url: "https://fundacionlacaixa.org/es/",
    ),
    CompanyData(
        title: StringConst.COPAN,
        category: StringConst.MANCOMUNIDAD,
        projectCoverUrl: ImagePath.PORTFOLIO_4,
      width: 0.225,
        url: "https://www.copanchorti.org/",
    ),
    CompanyData(
        title: StringConst.GOBCAN,
        category: StringConst.AAPP,
        projectCoverUrl: ImagePath.PORTFOLIO_5,
        width: 0.225,
        url: "https://www.gobiernodecanarias.org/principal/",
    ),
    CompanyData(
        title: StringConst.GOBES,
        category: StringConst.AAPP,
        projectCoverUrl: ImagePath.PORTFOLIO_6,
        width: 0.225,
        url: "https://www.mdsocialesa2030.gob.es/",
    ),
    CompanyData(
      title: StringConst.GOBES,
      category: StringConst.AAPP,
      projectCoverUrl: ImagePath.PORTFOLIO_7,
      width: 0.225,
      url: "https://www.mites.gob.es/",
    ),
  ];

  static List<CompanyData> branding = [
    CompanyData(
      title: StringConst.LA_CAIXA,
      category: StringConst.OBRA_SOCIAL,
      projectCoverUrl: ImagePath.PORTFOLIO_3,
      width: 0.225,
    ),
  ];
  static List<CompanyData> packaging = [
    CompanyData(
      title: StringConst.GOBCAN,
      category: StringConst.AAPP,
      projectCoverUrl: ImagePath.PORTFOLIO_5,
      width: 0.2375,
    ),
  ];
  static List<CompanyData> photograhy = [
    CompanyData(
        title: StringConst.COMPANY_1_TITLE,
        category: StringConst.US,
        projectCoverUrl: ImagePath.PORTFOLIO_1,
        width: 0.5,
        url: "https://www.sic4change.org/",
        mobileHeight: 0.3
    ),
    CompanyData(
        title: StringConst.PROYECTO_KIEU,
        category: StringConst.ONG,
        projectCoverUrl: ImagePath.PORTFOLIO_2,
        width: 0.225,
        url: "https://www.proyectokieu.org/",
        mobileHeight: 0.3
    ),
    CompanyData(
        title: StringConst.LA_CAIXA,
        category: StringConst.OBRA_SOCIAL,
        projectCoverUrl: ImagePath.PORTFOLIO_3,
        width: 0.225,
        url: "https://fundacionlacaixa.org/es/",
        mobileHeight: 0.3
    ),
    CompanyData(
        title: StringConst.COPAN,
        category: StringConst.MANCOMUNIDAD,
        projectCoverUrl: ImagePath.PORTFOLIO_4,
        width: 0.2375,
        url: "https://www.copanchorti.org/",
        mobileHeight: 0.3
    ),
    CompanyData(
        title: StringConst.GOBCAN,
        category: StringConst.AAPP,
        projectCoverUrl: ImagePath.PORTFOLIO_5,
        width: 0.2375,
        url: "https://www.gobiernodecanarias.org/principal/",
        mobileHeight: 0.3
    ),
    CompanyData(
        title: StringConst.GOBES,
        category: StringConst.AAPP,
        projectCoverUrl: ImagePath.PORTFOLIO_6,
        width: 0.5,
        url: "https://www.mdsocialesa2030.gob.es/",
        mobileHeight: 0.3
    ),
    CompanyData(
        title: StringConst.GOBES,
        category: StringConst.AAPP,
        projectCoverUrl: ImagePath.PORTFOLIO_7,
        width: 0.5,
        url: "https://www.mites.gob.es/",
        mobileHeight: 0.3
    ),
  ];
}
