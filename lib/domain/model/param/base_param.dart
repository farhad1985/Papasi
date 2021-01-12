class BaseParam {
  String token = "37456D20-10EB-E711";
  String accountId = "85CC7E7C-5DCC-E811-80D6-005056903F11";
  String countryAbbreviationCode = "ir";
  String languageAbbreviationCode = "Fa";
  String countryAbbreviationCodeContact = "ir";
  int subSystem = 1;
  int version = 0;
  int deviceType = 10;

  Map<String, dynamic> toJSON() => {
        'Token': token,
        'AccountId': accountId,
        'CountryAbbreviationCode': countryAbbreviationCode,
        'LanguageAbbreviationCode': languageAbbreviationCode,
        'CountryAbbreviationCodeContact': countryAbbreviationCodeContact,
        'SubSystem': subSystem,
        'Version': version,
        'DeviceType': deviceType,
      };
}
