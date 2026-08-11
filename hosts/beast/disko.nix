# Mirrors the laptop: GPT + 1G ESP, LUKS-encrypted LVM (swap + root ext4).
#
# ADJUST BEFORE INSTALL:
#   1. device       — confirm the target disk name on the beast. Check with `lsblk`.
#                     Common: /dev/nvme0n1 (NVMe) or /dev/sda (SATA).
#                     For NVMe the ESP partition becomes nvme0n1p1 automatically.
#   2. swap size     — 16G is fine for swap. For hibernate/resume you want
#                     swap >= RAM. Set accordingly (e.g. "64G" on a 64G box) or
#                     drop swap entirely and rely on zram if you never hibernate.
{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/nvme0n1";      # (1) confirm with lsblk
      content = {
        type = "gpt";
        partitions = {

          ESP = {
            priority = 1;
            name = "ESP";
            size = "1G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };

          luks = {
            size = "100%";
            content = {
              type = "luks";
              name = "cryptroot";
              settings.allowDiscards = true;
              content = {
                type = "lvm_pv";
                vg = "vg";
              };
            };
          };

        };
      };
    };

    lvm_vg.vg = {
      type = "lvm_vg";
      lvs = {
        swap = {
          size = "16G";             # (2) >= RAM if you want hibernate
          content = {
            type = "swap";
            resumeDevice = true;
          };
        };
        root = {
          size = "100%FREE";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };
}
