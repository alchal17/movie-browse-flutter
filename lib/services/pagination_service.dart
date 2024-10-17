  abstract interface class PaginationService<T> {
    Future<T> getByPage(int page);
  }