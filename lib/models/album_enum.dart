enum AlbumEnum {
  // Studio albums
  theAlbum(
    name: 'THE ALBUM',
    imagePath: 'assets/images/the_album.jpg',
    releaseDate: '2020.10.02',
  ),
  bornPink(
    name: 'BORN PINK',
    imagePath: 'assets/images/born_pink.jpg',
    releaseDate: '2022.09.16',
  ),

  // Single albums
  squareOne(
    name: 'SQUARE ONE',
    imagePath: 'assets/images/square_one.jpg',
    releaseDate: '2016.08.08',
  ),
  squareTwo(
    name: 'SQUARE TWO',
    imagePath: 'assets/images/square_two.jpg',
    releaseDate: '2016.11.01',
  ),

  // Extended plays
  squareUp(
    name: 'SQUARE UP',
    imagePath: 'assets/images/square_up.jpg',
    releaseDate: '2018.06.15',
  ),
  killThisLove(
    name: 'KILL THIS LOVE',
    imagePath: 'assets/images/kill_this_love.jpg',
    releaseDate: '2019.04.05',
  ),

  // Singles
  asIfItsYourLast(
    name: 'As If It\'s Your Last',
    imagePath: 'assets/images/as_if_its_your_last.jpg',
    releaseDate: '2017.06.22',
  ),

  // Jennie
  solo(
    name: 'SOLO',
    imagePath: 'assets/images/solo.jpg',
    releaseDate: '2018.11.12',
  ),

  // Lisa
  lalisa(
    name: 'LALISA',
    imagePath: 'assets/images/lalisa.jpg',
    releaseDate: '2021.09.10',
  ),

  // Rose
  r(
    name: '-R-',
    imagePath: 'assets/images/r.jpg',
    releaseDate: '2021.03.12',
  ),
  ;

  const AlbumEnum({
    required this.name,
    required this.imagePath,
    required this.releaseDate,
  });

  final String name;
  final String imagePath;
  final String releaseDate;
}
