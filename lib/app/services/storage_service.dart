import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:todo/app/modules/widgets/loading_dialogs.dart';

Future<String> uploadToStorage(
    {required File file,
    required String folderName,
    String? imageName,
    bool showLoader = true}) async {
  if (showLoader) {
    LoadingDialog.showLoadingDialog(message: "Processing...");
  }

  try {
    final Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
          imageName == null
              ? '$folderName/file${DateTime.now().millisecondsSinceEpoch}'
              : '$folderName/$imageName',
        );

    final UploadTask uploadTask = firebaseStorageRef.putFile(file);

    final TaskSnapshot downloadUrl = await uploadTask;

    String url = await downloadUrl.ref.getDownloadURL();
    if (showLoader) {
      LoadingDialog.hideLoadingDialog();
    }
    return url;
  } on Exception catch (e) {
    if (showLoader) {
      LoadingDialog.hideLoadingDialog();
    }
    LoadingDialog.showErrorDialog(message: e.toString());
    return "";
  }
}

Future<List<String>> uploadMultipleImagesToStorage({
  required List<File?> files,
  required String folderName,
  bool showLoader = true,
}) async {
  List<String> urls = [];
  if (showLoader) {
    LoadingDialog.showLoadingDialog(message: "Uploading Images...");
  }

  try {
    for (var file in files) {
      if (file == null) {
        continue;
      }
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      String url = await uploadToStorage(
        file: file,
        folderName: folderName,
        imageName: imageName,
        showLoader: false,
      );
      if (url.isNotEmpty) {
        urls.add(url);
      }
    }

    if (showLoader) {
      LoadingDialog.hideLoadingDialog();
    }
    return urls;
  } catch (e) {
    if (showLoader) {
      LoadingDialog.hideLoadingDialog();
    }
    LoadingDialog.showErrorDialog(message: e.toString());
    return [];
  }
}

Future<void> deleteImageFromLink(String link) async {
  await FirebaseStorage.instance.ref(link).delete();
}
