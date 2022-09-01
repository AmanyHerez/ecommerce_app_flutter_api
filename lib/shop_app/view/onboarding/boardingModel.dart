class BoardingModel {
   String image;
  String title;
  String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });

}

 final  List<BoardingModel>?  boarding = [
  BoardingModel(
    image: 'asset/image/board1.png',
    title: '''20% Discount\nNew Arrival Product''',
    body:
        'Publish up your selfies to make yourself\nmore beautiful with this app.',
  ),
  BoardingModel(
    image: 'asset/image/board2.png',
    title: '''Take Advantage\nOf The Offer Shopping ''',
    body: 'Publish up your selfies to make yourself\nmore beautiful with this app.',
  ),
  BoardingModel(
    image: 'asset/image/board3.png',
    title: '''All Types Offers\nWithin Your Reach''',
    body: 'Publish up your selfies to make yourself\nmore beautiful with this app.',
  ),
];
