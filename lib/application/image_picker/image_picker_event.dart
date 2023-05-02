part of 'image_picker_bloc.dart';

class ImagePickerEvent {}

class CameraImage extends ImagePickerEvent{}

class GalleryImage extends ImagePickerEvent{}

class RemoveImage extends ImagePickerEvent{}