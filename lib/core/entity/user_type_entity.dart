class UserTypeEntity {
  final String label;
  final String desc;
  final int index;
  final String? asset;

  UserTypeEntity({required this.label, required this.desc, required this.index, this.asset});

  static List<UserTypeEntity> getUserTypes() {
    return [
      UserTypeEntity(
        label: "TBP - TakSe Business Partner",
        desc: 'कोई भी भारतीय नागरिक FREE में पंजीकरण कर सकता है और टकसे सेवाओं का लाभ उठा सकता है।',
        index: 0,
      ),
      UserTypeEntity(
        label: "TBP - TakSe Business Partner",
        desc:
            'केवल साइबर कैफे, CSC सेंटर, और पैन कार्ड सेंटर के मालिक अपने बिजनेस को बढ़ाने और आमदनी को 2-3 गुना करने के लिए पंजीकरण कर सकते हैं।',
        index: 0,
      ),
      UserTypeEntity(
        label: "TBP - TakSe Business Partner",
        desc:
            'छोटे या बड़े व्यवसाय वाले लोग, जैसे सिम रिचार्ज, किराना दुकान, आदि, टकसे सर्विस मॉल खोलकर और डिजिटल बिजनेस संवाददाता बनकर अपनी आय बढ़ा सकते हैं।',
        index: 0,
      )
    ];
  }
}
