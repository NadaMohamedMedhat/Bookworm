class AuthorModel {
  final String id;
  final String name;
  final String image;

  AuthorModel({
    required this.id,
    required this.name,
    required this.image,
  });
}

List authors = [
  AuthorModel(
      id: '1',
      name: 'ahmed tawfik',
      image:
          'https://english.ahram.org.eg/Media/News/2018/4/2/2018-636583049637105859-710.jpg'),
  AuthorModel(
      id: '2',
      name: 'Naguib Mahfouz',
      image: 'https://see.news/wp-content/uploads/2020/10/EbKJTcmXsAI-1XH.jpg'),
  AuthorModel(
      id: '3',
      name: 'William Shakespeare',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Shakespeare.jpg/220px-Shakespeare.jpg'),
  AuthorModel(
      id: '4',
      name: 'Agatha Christie',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/c/cf/Agatha_Christie.png'),
  AuthorModel(
      id: '5',
      name: 'Harold Robbins',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Harold_Robbins_%281979%29.jpg/220px-Harold_Robbins_%281979%29.jpg'),
  AuthorModel(
      id: '6',
      name: 'Dr. Seuss',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Theodor_Seuss_Geisel_%2801037v%29.jpg/220px-Theodor_Seuss_Geisel_%2801037v%29.jpg'),
  AuthorModel(
      id: '7',
      name: 'Paulo Coelho',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Coelhopaulo26012007-1.jpg/220px-Coelhopaulo26012007-1.jpg'),
  AuthorModel(
      id: '8',
      name: 'Erle Stanley Gardner',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Erle-Stanley-Gardner-1966.jpg/800px-Erle-Stanley-Gardner-1966.jpg'),
  AuthorModel(
      id: '9',
      name: 'Roald Dahl',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Roald_Dahl.jpg/220px-Roald_Dahl.jpg'),
  AuthorModel(
      id: '10',
      name: 'Anne Rice',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Anne_Rice.jpg/220px-Anne_Rice.jpg'),
];
