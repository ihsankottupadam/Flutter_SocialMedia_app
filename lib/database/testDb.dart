import 'package:social_media/models/user_story.dart';

class TestDB {
  static final List<String> avatars = [
    'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS5yHsdTR4QKrcZTpNHemKH0Zhh368U985Ig&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQexMxVl_vKyt0QD5LmtueH38meNXPFrv3B1Q&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx6zNjOngXCJkQJQkAGjTuPbfmW0Yezm0cBg&usqp=CAU',
  ];
  static final List<String> postUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROAuLtGRpvuDR0nKvAcFa2fSCZXaNg4_Jo-A&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQexMxVl_vKyt0QD5LmtueH38meNXPFrv3B1Q&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkS4mQZJH-SAi6Yf1PRXhMsojtGNv3beafgw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx6zNjOngXCJkQJQkAGjTuPbfmW0Yezm0cBg&usqp=CAU'
  ];
  static final List<UserStory> stories = [
    UserStory(
        userid: 1,
        avatar:
            'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
        userName: 'amar',
        contents: [
          StoryItem(
              contentUri:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROAuLtGRpvuDR0nKvAcFa2fSCZXaNg4_Jo-A&usqp=CAU')
        ]),
    UserStory(
        userid: 1,
        userName: 'Albin',
        avatar:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS5yHsdTR4QKrcZTpNHemKH0Zhh368U985Ig&usqp=CAU',
        contents: [
          StoryItem(
              contentUri:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQexMxVl_vKyt0QD5LmtueH38meNXPFrv3B1Q&usqp=CAU')
        ]),
    UserStory(
        userid: 1,
        userName: 'Thomas',
        avatar:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKfO-am-FjtYfa2gUMWs4_QjsUVXMNA47vDA&usqp=CAU',
        contents: [
          StoryItem(
              contentUri:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkS4mQZJH-SAi6Yf1PRXhMsojtGNv3beafgw&usqp=CAU')
        ]),
    UserStory(userid: 1, userName: 'Vivek', isFullViewd: true, contents: [
      StoryItem(
          contentUri:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx6zNjOngXCJkQJQkAGjTuPbfmW0Yezm0cBg&usqp=CAU')
    ])
  ];
}
