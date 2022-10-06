import 'package:social_media/Tabs/profile/model/userdetails.dart';

List<UserDetails> usersListFromJson(List list) =>
    List<UserDetails>.from(list.map((x) => UserDetails.fromJson(x)));
