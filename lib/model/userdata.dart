import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';
import 'account.dart';

class Userdata {
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/images1.jpg',
      username: 'John Doe',
      time: '2 hrs ago',
      postcontent: 'Had a great day at the beach!',
      posting: 'assets/images7.jpg',
      numcomments: '24',
      numshare: '5',
      isLiked: false,
      comments: [
        Usercomment(
          commenterImg: 'assets/images3.jpg',
          commenterName: 'Jane Smith',
          commentTime: '1 hr ago',
          commentContent: 'Looks fun!',
        ),
        Usercomment(
          commenterImg: 'assets/images2.jpg',
          commenterName: 'Mike Johnson',
          commentTime: '30 mins ago',
          commentContent: 'Wish I was there!',
        ),
        Usercomment(
          commenterImg: 'assets/images4.jpg',
          commenterName: 'Emily Davis',
          commentTime: '15 mins ago',
          commentContent: 'Great photo!',
        ),
      ],
    ),
    Userpost(
      userimg: 'assets/images3.jpg',
      username: 'Jane Smith',
      time: '3 hrs ago',
      postcontent: 'Loving the new cafe in town.',
      posting: 'assets/images3.jpg',
      numcomments: '18',
      numshare: '3',
      isLiked: true,
    ),
    Userpost(
      userimg: 'assets/images2.jpg',
      username: 'Mike Johnson',
      time: '5 hrs ago',
      postcontent: 'Just finished a 10k run!',
      posting: 'assets/images2.jpg',
      numcomments: '30',
      numshare: '7',
      isLiked: false,
    ),
    Userpost(
      userimg: 'assets/images6.jpg',
      username: 'Johnson Stewart',
      time: '5 hrs ago',
      postcontent: 'Just finished a 10k run!',
      posting: 'assets/images6.jpg',
      numcomments: '30',
      numshare: '7',
      isLiked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/images2.jpg', name: 'Alice'),
    Friend(img: 'assets/images1.jpg', name: 'Bob'),
    Friend(img: 'assets/images4.jpg', name: 'Charlie'),
    Friend(img: 'assets/images3.jpg', name: 'Diana'),
    Friend(img: 'assets/images6.jpg', name: 'Ethan'),
    Friend(img: 'assets/images5.jpg', name: 'Fiona'),
  ];

  Account myUserAccount = Account(
    name: 'Keanu R. Masaway',
    email: 'keanumasaway@gmail.com',
    img: 'assets/images7.jpg',
    numFollowers: '1 Million',
    numPosts: '350',
    numFollowing: '500',
    numFriends: '400',
  );
}
