import 'dart:math';

class DemoContent {
  static final names = [
    "Albert Flores",
    "Floyd Miles",
    "Savannah Nguyen",
    "Jenny Wilson",
    "Floyd Miles Junior"
  ];

  static final accounts =
      names.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

  static final jobTitles = [
    "Demonstrator",
    "Lecturer",
    "Senior Lecturer",
    "Professor",
    "Professor"
  ];

  static final avatars = [
    "https://gravatar.com/avatar/a3940eda5920f17dc0ec3d3d7133a6b9?s=200&d=robohash&r=xs",
    "https://gravatar.com/avatar/af592813a2e6404c19e7373c6e3fb4a9?s=200&d=robohash&r=x",
    "https://gravatar.com/avatar/c34f35dbb5b652752c3eb8c0d982ccc2?s=200&d=robohash&r=x",
    "https://gravatar.com/avatar/22a5a123b26b0ff953797de82caca891?s=200&d=robohash&r=x",
    "https://gravatar.com/avatar/17ce2802b6f5321d0a74b9e2b84cbcdd?s=200&d=robohash&r=x"
  ];

  static final courses = [
    "室內設計電腦繪圖",
    "影片剪輯特效",
    "網頁程式設計",
    "進階Solidworks機械製圖",
    "室內配線",
    "自來水管配管",
    "特定瓦斯器具裝修",
    "工業配線基礎",
    "工業機器人應用",
    "堆高機操作",
    "採購管理認證",
    "服裝電腦打版",
    "時尚插畫手繪電繪"
  ];

  static const summary =
      "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content.";

  static final summarys =
      courses.map((e) => summary * (Random().nextInt(20) + 5)).toList();

  static final hours =
      courses.map((e) => Random().nextInt(16 - 8) + 8).toList();
}
