import 'package:bloc/bloc.dart';
import 'package:moga/features/post/data/firebase/post_repo_imple.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this.postRepo) : super(PostInitial());
  PostRepoImplementation postRepo;
}
