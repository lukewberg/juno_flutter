class Navigation {}

class NavItem {
  final String as;
  final String? name;
  final String path;
  final String type;
  final Map<String, dynamic>? data;
  final List<NavItem> children;

  NavItem(
    this.as,
    this.path,
    this.type,
    this.children, {
    this.name,
    this.data,
  });
}

class ComponentConfig {

}