import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'set_user_data_state.dart';

class SetUserDataCubit extends Cubit<SetUserDataState> {
  SetUserDataCubit() : super(SetUserDataInitial());
}
