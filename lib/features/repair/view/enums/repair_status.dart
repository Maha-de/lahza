enum RepairStatus {
  pending,
  inspecting,
  inspectionDone,
  confirmed,
  representativeSent,
  representativeGoing,
  devicePickedUp,
  deviceAtCenter,
  inRepair,
  technicianAssigned,
  technicianGoing,
  technicianArrived,
  completed,
  canceled,
  unknown;

  static RepairStatus fromString(String? value) {
    switch (value?.toUpperCase()) {
      case 'PENDING':
        return RepairStatus.pending;

      case 'INSPECTING':
        return RepairStatus.inspecting;

      case 'INSPECTION_DONE':
        return RepairStatus.inspectionDone;

      case 'CONFIRMED':
        return RepairStatus.confirmed;

      case 'REPRESENTATIVE_SENT':
        return RepairStatus.representativeSent;

      case 'REPRESENTATIVE_GOING':
        return RepairStatus.representativeGoing;

      case 'DEVICE_PICKED_UP':
        return RepairStatus.devicePickedUp;

      case 'DEVICE_AT_CENTER':
        return RepairStatus.deviceAtCenter;

      case 'IN_REPAIR':
        return RepairStatus.inRepair;

      case 'TECHNICIAN_ASSIGNED':
        return RepairStatus.technicianAssigned;

      case 'TECHNICIAN_GOING':
        return RepairStatus.technicianGoing;

      case 'TECHNICIAN_ARRIVED':
        return RepairStatus.technicianArrived;

      case 'COMPLETED':
        return RepairStatus.completed;

      case 'CANCELED':
        return RepairStatus.canceled;

      default:
        return RepairStatus.unknown;
    }
  }
}
