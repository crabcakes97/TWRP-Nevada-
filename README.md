
# TWRP Device Tree for Motorola nevada (Moto G Play - 2026)

## Device Info
- Codename: nevada
- Model: Moto G Play - 2026 (XT2615V)
- SoC: MediaTek Dimensity 6300 / MT6835
- Kernel: 5.15
- Android version base: 16 (from stock)

## Source
Base tree pulled from Hovatek's Online TWRP Builder, then hand-fixed because
the auto-generated version had a fstab that thought it was cosplaying as the
stock init fstab. It was not. Full credit to Hovatek for the 90%, this repo
is the other 10% 😂

## Building

1. Sync TWRP source (twrp-12.1 or latest supporting header v4 + vendor_boot):
```bash
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync
```

2. Clone this device tree:
```bash
git clone https://github.com/crabcakes97/TWRP-Nevada-.git device/motorola/nevada
```

3. Build:
```bash
. build/envsetup.sh
lunch twrp_nevada-eng
mka vendorbootimage -j$(nproc)
```
(Yes, `vendorbootimage`, not `recoveryimage` — this device packs TWRP into
vendor_boot. `TARGET_NO_RECOVERY := true` will laugh at you otherwise.)

## Bug fixes in this tree
- **Storage/data not mounting**: original fstab was in stock Android init
  format (`source mountpoint type flags`) instead of TWRP's format
  (`mountpoint fstype device flags`). Same info, wrong order, TWRP had no
  idea what it was looking at. Fixed + deduped the dynamic partitions.
- **Garbled/melted text**: MTK framebuffer stride mismatch, not a font issue.
  Fixed with `RECOVERY_GRAPHICS_USE_LINELENGTH := true`.
- **Branding**: `TW_DEVICE_VERSION` set to romlord14495.

## Status
Source-level fixes look correct, not boot-tested yet. If you flash it and it
works, we did science. If not, open an issue with the TWRP log.
