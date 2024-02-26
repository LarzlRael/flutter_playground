part of 'forms.dart';

class FilePicker extends HookWidget {
  final Function(String?) takePhoto;
  final Function(List<String>?) onSelectedFiles;
  final String? placeholder;
  final String nameField;
  final List<String>? initialValue;
  final Function(String?)? onRemoveImage;
  const FilePicker({
    super.key,
    this.placeholder,
    this.initialValue,
    this.onRemoveImage,
    required this.takePhoto,
    required this.onSelectedFiles,
    required this.nameField,
  });

  @override
  Widget build(BuildContext context) {
    final selectedImages = useState<List<String>>([]);
    useEffect(() {
      selectedImages.value = initialValue ?? [];
      return () {};
    }, []);
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              !selectedImages.value.isEmpty
                  ? const SizedBox()
                  : TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle),
                      label: const Text("Agrega imágenes"),
                    ),
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      final photoPath =
                          await CamerGalleryServiceImp().selectFromGallery();
                      if (photoPath == null) return;
                      selectedImages.value = [
                        ...photoPath,
                        ...selectedImages.value
                      ];
                      onSelectedFiles(photoPath);
                    },
                    icon: const Icon(Icons.photo_album),
                  ),
                  IconButton(
                    onPressed: () async {
                      final photoPath =
                          await CamerGalleryServiceImp().takePhoto();
                      if (photoPath == null) return;
                      takePhoto(photoPath);
                      selectedImages.value = [
                        photoPath,
                        ...selectedImages.value
                      ];
                    },
                    icon: const Icon(Icons.camera_alt),
                  ),
                ],
              ),
            ],
          ),
          selectedImages.value.isEmpty
              ? const SizedBox()
              : SizedBox(
                  height: 250,
                  width: 600,
                  child: ImageGallery(
                    images: selectedImages.value,
                    deleteImage: (image) {
                      selectedImages.value = [...selectedImages.value]
                        ..removeWhere((element) => element == image);
                      onRemoveImage!(image);
                      onSelectedFiles(selectedImages.value);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
