class ResFetch<T> {
  final int status;
  final T? data;
  const ResFetch({this.status = 1000, this.data});
}
