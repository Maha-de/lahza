import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompleteProfileMap extends StatefulWidget {
  final LatLng? location;
  final VoidCallback onTap;

  const CompleteProfileMap({
    super.key,
    required this.location,
    required this.onTap,
  });

  @override
  State<CompleteProfileMap> createState() => _CompleteProfileMapState();
}

class _CompleteProfileMapState extends State<CompleteProfileMap> {
  GoogleMapController? _controller;

  @override
  void didUpdateWidget(covariant CompleteProfileMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.location != null && widget.location != oldWidget.location) {
      _controller?.animateCamera(CameraUpdate.newLatLng(widget.location!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = widget.location ?? const LatLng(30.0444, 31.2357);

    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: IgnorePointer(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: location,
                  zoom: 16,
                ),
                onMapCreated: (controller) {
                  _controller = controller;
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                compassEnabled: false,
                mapToolbarEnabled: false,
                buildingsEnabled: true,
                rotateGesturesEnabled: false,
                zoomGesturesEnabled: false,
                scrollGesturesEnabled: false,
                tiltGesturesEnabled: false,
                markers: {
                  if (widget.location != null)
                    Marker(
                      markerId: const MarkerId('user'),
                      position: widget.location!,
                    ),
                },
              ),
            ),
          ),

          /// يخلي أي ضغطة على الخريطة تفتح شاشة اختيار الموقع
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: widget.onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
