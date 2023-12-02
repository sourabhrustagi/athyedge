import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'loader_state.dart';

@Injectable()
class LoaderCubit extends Cubit<LoaderState> {
  LoaderCubit() : super(LoaderInitial());

  void show() {
    emit(Show());
  }

  void hide() {
    emit(Hide());
  }
}
