class User {
  final int id;
  final String name;
  final String imageUrl;

  User({
    this.id,
    this.name,
    this.imageUrl,
  });
}

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'images/greg.jpg',
);

// USERS
final User greg = User(
  id: 1,
  name: 'Greg',
  imageUrl: 'images/greg.jpg',
);

final User james = User(
  id: 2,
  name: 'James',
  imageUrl: 'images/james.jpg',
);

final User john = User(
  id: 3,
  name: 'John',
  imageUrl: 'images/john.jpg',
);

final User olivia = User(
  id: 4,
  name: 'Olivia',
  imageUrl: 'images/olivia.jpg',
);

final User sam = User(
  id: 5,
  name: 'Sam',
  imageUrl: 'images/sam.jpg',
);

final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: 'images/sophia.jpg',
);

final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: 'images/steven.jpg',
);
