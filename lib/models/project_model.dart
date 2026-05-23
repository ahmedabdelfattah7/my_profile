class ProjectModel {
  final String name;
  final String description;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final List<String> technologies;
  final String? imageAsset;

  const ProjectModel({
    required this.name,
    required this.description,
    this.appStoreUrl,
    this.playStoreUrl,
    required this.technologies,
    this.imageAsset,
  });
}
