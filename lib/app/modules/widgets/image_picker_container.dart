import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/app/services/image_picker_service.dart';

// ignore: must_be_immutables
class ImagePickerContainer extends StatefulWidget {
  final Function(File) onImagePicked;
  String? imageUrl;
  ImagePickerContainer({super.key, required this.onImagePicked, this.imageUrl});

  @override
  State<ImagePickerContainer> createState() => _ImagePickerContainerState();
}

class _ImagePickerContainerState extends State<ImagePickerContainer> {
  File? _image;
  final ImagePickerServices _imagePickerServices = ImagePickerServices();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          _image = await _imagePickerServices.getImageFromGallery();
          if (_image != null) {
            setState(() {
              widget.imageUrl = null;
            });
            widget.onImagePicked(_image!);
          }
        },
        child: widget.imageUrl != null
            ? CachedNetworkImage(imageUrl: widget.imageUrl!)
            : _image == null
                ? Container(
                    height: 100.h,
                    color: Colors.grey,
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Tap to pick an image',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ))
                : Image.file(_image!));
  }
}
