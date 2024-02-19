class CatInformation {
  final int id;
  final String catBreed;
  final String catImage;
  final double catWeight;
  final double catHeight;
  final String catDescription;
  final String origin;
  final double price;

  CatInformation({
    required this.id,
    required this.catBreed,
    required this.catImage,
    required this.catWeight,
    required this.catHeight,
    required this.catDescription,
    required this.origin,
    required this.price,
  });
}

final List<CatInformation> cats = [
  CatInformation(
    id: 0,
    catBreed: 'Abyssinian',
    catImage: 'assets/images/AbyssinianCat.jpg',
    catWeight: 3.4,
    catHeight: 23,
    catDescription:
        'The Abyssinian is a breed of domestic short-haired cat with a distinctive'
        '"ticked" tabby coat, in which individual hairs are banded with different colors.',
    origin: 'Ethiopia',
    price: 2500,
  ),
  CatInformation(
    id: 1,
    catBreed: 'Bengal',
    catImage: 'assets/images/BengalCat.jpg',
    catWeight: 3.2,
    catHeight: 23,
    catDescription:
        'The Bengal cat is a breed of hybrid cat created from crossing'
        'of a Asian leopard cat, with domestic cats, especially the spotted Egyptian Mau.',
    origin: 'USA',
    price: 1700,
  ),
  CatInformation(
    id: 2,
    catBreed: 'British Shorthair',
    catImage: 'assets/images/BritishShorthairCat.jpg',
    catWeight: 3.3,
    catHeight: 24,
    catDescription:
        'The British Shorthair is the pedigreed version of the traditional British domestic cat,'
        'with a distinctively stocky body, thick coat, and broad face.',
    origin: 'Great Britain',
    price: 2700,
  ),
  CatInformation(
    id: 3,
    catBreed: 'Maine Coon',
    catImage: 'assets/images/MainecoonCat.jpg',
    catWeight: 8.7,
    catHeight: 33,
    catDescription:
        'The Maine Coon is a large domesticated cat breed. It is one of the oldest natural breeds in North America.'
        'The breed originated in the U.S. state of Maine, where it is the official state cat.',
    origin: 'Maine',
    price: 1850,
  ),
  CatInformation(
    id: 4,
    catBreed: 'Orange',
    catImage: 'assets/images/OrangeCat.jpg',
    catWeight: 3.5,
    catHeight: 23,
    catDescription:
        'Admirers of orange tabbies describe them as mild-tempered, playful, gluttonous, opinionated and affectionate.',
    origin: 'Egypt',
    price: 799,
  ),
  CatInformation(
    id: 5,
    catBreed: 'Persian',
    catImage: 'assets/images/PersianCat.jpg',
    catWeight: 2.7,
    catHeight: 25,
    catDescription:
        'The Persian cat, also known as the Persian Longhair, is a long-haired breed of cat characterised by a round face and short muzzle.',
    origin: 'Iran',
    price: 2299,
  ),
  CatInformation(
    id: 6,
    catBreed: 'Russian Blue',
    catImage: 'assets/images/RussianBlueCat.jpg',
    catWeight: 4.5,
    catHeight: 22.5,
    catDescription:
        'The Russian Blue cat, commonly referred to as just Russian Blue, is a cat breed with colors that vary from'
        'a light shimmering silver to a darker, slate grey.',
    origin: 'Russia',
    price: 1399,
  ),
  CatInformation(
    id: 7,
    catBreed: 'Siamese',
    catImage: 'assets/images/SiameseCat.jpg',
    catWeight: 4.7,
    catHeight: 23,
    catDescription:
        'The Siamese is built on long athletic lines, standing tall on slender legs with neat oval paws.'
        'Ears are large, pricked and give an intelligent expression, following the lines of the triangular shaped head.',
    origin: 'Siamese',
    price: 699,
  ),
  CatInformation(
    id: 8,
    catBreed: 'Sphynx',
    catImage: 'assets/images/SphynxCat.jpg',
    catWeight: 4.5,
    catHeight: 23,
    catDescription:
        'The skin has a texture of chamois leather, as it has fine hairs, or the cat may be completely hairless.'
        'Whiskers may be present, either whole or broken, or may be totally absent.'
        'Per the breed standards, they have a somewhat wedge-shaped head with large eyes and ears, quite long legs and tail, and neat rounded paws.',
    origin: 'Toronto',
    price: 2799,
  ),
  CatInformation(
    id: 9,
    catBreed: 'Tabby',
    catImage: 'assets/images/TabbyCat.jpg',
    catWeight: 4.5,
    catHeight: 23,
    catDescription:
        'A tabby cat, or simply tabby, is any domestic cat (Felis catus) with a distinctive M-shaped marking on its forehead;'
        'stripes by its eyes and across its cheeks, along its back, and around its legs and tail',
    origin: 'Ancient Egypt',
    price: 1500,
  ),
];
