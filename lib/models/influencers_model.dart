class InfluencersModels {
  final String photoUrl;
  final String influencerName;
  final String influencerFan;
  InfluencersModels({
    required this.photoUrl,
    required this.influencerName,
    required this.influencerFan,
  });
}


final List<InfluencersModels> influencersList = [
  InfluencersModels(
    photoUrl: 'https://example.com/photo1.jpg',
    influencerName: 'Influencer One',
    influencerFan: '1M',
  ),
  InfluencersModels(
    photoUrl: 'https://example.com/photo2.jpg',
    influencerName: 'Influencer Two',
    influencerFan: '500K',
  ),
  InfluencersModels(
    photoUrl: 'https://example.com/photo3.jpg',
    influencerName: 'Influencer Three',
    influencerFan: '750K',
  ),
  // Add more influencers as needed
];