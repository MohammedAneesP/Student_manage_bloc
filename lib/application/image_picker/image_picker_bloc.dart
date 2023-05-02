import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitial()) {
    on<CameraImage>((event, emit) async {
      XFile? imageCamera =
          await ImagePicker().pickImage(source: ImageSource.camera);
      return emit(ImagePickerState(anImage: imageCamera));
    });
    on<GalleryImage>((event, emit) async {
      XFile? imageGallery =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      return emit(ImagePickerState(anImage: imageGallery));
    });
    on<RemoveImage>((event, emit) {
      return emit(ImagePickerState(anImage: null));
    });
  }
}
