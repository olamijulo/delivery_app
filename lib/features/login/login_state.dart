// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginState {
  bool? isLoading;
  String? userName;
  String? profileImgUrl;

  LoginState({this.userName, this.isLoading = false, this.profileImgUrl});

  LoginState copyWith(
      {bool? isLoading, String? userName, String? profileImgUrl}) {
    return LoginState(
        isLoading: isLoading ?? this.isLoading,
        userName: userName ?? this.userName,
        profileImgUrl: profileImgUrl ?? this.profileImgUrl);
  }
}
