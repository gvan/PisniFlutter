abstract class IFavoriteService {
  Future<void> addToFavorite(String songId);
  Future<void> removeFromFavorite(String songId);
  Future<List<String>> getFavorites();
}