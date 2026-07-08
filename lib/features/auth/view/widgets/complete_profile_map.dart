import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompleteProfileMap extends StatelessWidget {
  final LatLng? location;
  final void Function(GoogleMapController) onMapCreated;
  final ValueChanged<LatLng> onTap;

  const CompleteProfileMap({
    super.key,
    required this.location,
    required this.onMapCreated,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: location ?? const LatLng(30.0444, 31.2357),
          zoom: 16,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        buildingsEnabled: true,
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
        onMapCreated: onMapCreated,
        onTap: onTap,
        markers: {
          if (location != null)
            Marker(markerId: const MarkerId("user"), position: location!),
        },
      ),
    );
  }
}
