class Post {
  const Post({this.title, this.author, this.imageUrl});

  final String title;
  final String author;
  final String imageUrl;
}

final List<Post> posts = [
  Post(
      title: "wanzi1",
      author: "liubang",
      imageUrl:
          "https://wx4.sinaimg.cn/mw690/7e608cb2gy1goja24qnbzj21n82gtb2c.jpg"),
  Post(
      title: "wanzi2",
      author: "liubang",
      imageUrl:
          "https://wx3.sinaimg.cn/mw690/7e608cb2gy1goexms6qmnj21sc2ds4qq.jpg"),
  Post(
      title: "wanzi3",
      author: "liubang",
      imageUrl:
          "https://wx1.sinaimg.cn/mw690/7e608cb2gy1gnwbx0q0ruj21o02yo4qr.jpg"),
];
