import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_user_state.dart';

class MyUserCubit extends Cubit<MyUserState> {
  MyUserCubit() : super(MyUserInitial());
}
