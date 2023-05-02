part of 'image_picker_bloc.dart';

 class ImagePickerState {
XFile ? anImage;

ImagePickerState({required this.anImage});
}

class ImagePickerInitial extends ImagePickerState {
  ImagePickerInitial():super(anImage: null);
}
