class BaseModel {
  int _currentNavigationbarIndex = 0;
  int get currentNavigationbarIndex => _currentNavigationbarIndex;
  void updateNavigationIndex(int index) => _currentNavigationbarIndex = index;
}
