class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  final double rating;
  bool isLiked = false;

  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author,this.rating);
}

List<Article> articles = [
  Article(
      'Japan\'s second largest metropolitan area',
      'https://media.istockphoto.com/id/185324700/photo/big-city-by-starry-night.jpg?s=612x612&w=0&k=20&c=ibKfO-ecMWbN_Vz1TDiFcdaNWdHnF08C8rXAupd058Q=',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Hussain Mustafa',
      4),
  Article(
      'Known as the sleepless town for obvious reasons',
      'https://t3.ftcdn.net/jpg/03/03/25/42/360_F_303254286_X3tXqqmRHAJnrdYfala1YLvuWkunvgII.jpg',
      300,
      50000,
      true,
      'Kabuikicho Japan',
      1250,
      'Tim Salvatore',
      3.5),
  Article(
      'Japan\'s second largest metropolitan area',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReAJjG_amJGGnOhJZqpnxhhJ0p9jWj9X5U53HnhvVUUn3RuVzbKdzDS2nhIFGGgEfGTkc&usqp=CAU',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya',
      5),
];
