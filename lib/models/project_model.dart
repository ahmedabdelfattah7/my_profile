class ProjectModel {

  const ProjectModel({
    required this.name,
    required this.description,
    required this.technologies, this.appStoreUrl,
    this.playStoreUrl,
    this.imageAsset,
  });
  final String name;
  final String description;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final List<String> technologies;
  final String? imageAsset;
}
