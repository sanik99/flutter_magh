



class Book{

  final String imageUrl;
  final String title;
  final String detail;
  final String rating;
  final String genre;

 Book({
    required this.detail,
   required this.title,
   required this.imageUrl,
   required this.rating,
   required this.genre,
});



}

List<Book> books = [
  Book(
      detail: 'To Kill a Mockingbird is a novel by the American author Harper Lee. It was published in 1960 and was instantly successful. In the United States, it is widely read in high schools and middle schools',
      title: 'To Kill a Mockingbird',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ2qkJLjkVrYGC7JvdfFVZQU-LIVBDggNsIHxmb8SOjLV3HsVnu',
      rating: '⭐⭐⭐⭐',
      genre: 'horror'
  ),
  Book(
      detail: 'To Kill a Mockingbird is a novel by the American author Harper Lee. It was published in 1960 and was instantly successful. In the United States, it is widely read in high schools and middle schools',
      title: 'To Kill a Mockingbird',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ2qkJLjkVrYGC7JvdfFVZQU-LIVBDggNsIHxmb8SOjLV3HsVnu',
      rating: '⭐⭐⭐⭐⭐',
      genre: 'thriller'
  ),
  Book(
      detail: 'To Kill a Mockingbird is a novel by the American author Harper Lee. It was published in 1960 and was instantly successful. In the United States, it is widely read in high schools and middle schools',
      title: 'To Kill a Mockingbird',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ2qkJLjkVrYGC7JvdfFVZQU-LIVBDggNsIHxmb8SOjLV3HsVnu',
      rating: '⭐⭐⭐⭐',
      genre: 'comedy'
  ),
];
