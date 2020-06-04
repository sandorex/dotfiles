# Usb Controller Preventing Sleep
When i make my computer sleep the fans keep spinning and the LED is fully on, not blinking as it should be

> **WARNING** The fix provided will most likely need to be modified to work for you

In `journalctl` i found
```
Jun 03 11:13:16 aurum kernel: PM: Some devices failed to suspend, or early wake event detected
Jun 03 11:13:16 aurum kernel: PM: Device 0000:00:12.0 failed to suspend async: error -16
Jun 03 11:13:16 aurum kernel: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x160 returns -16
Jun 03 11:13:16 aurum kernel: PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x30 returns -16
```

So it's `pci:0000:00:12.0` thats making it fail to suspend, after running `lspci | grep '00:12'` i got
```
00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI0 Controller (prog-if 10 [OHCI])
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
	Flags: bus master, 66MHz, medium devsel, latency 32, IRQ 18, NUMA node 0
	Memory at fe30a000 (32-bit, non-prefetchable) [size=4K]
	Kernel driver in use: ohci-pci
```

It's a OHCI controller (whatever that is), so let's disable it on suspend and wake using `bind` and `unbind`
