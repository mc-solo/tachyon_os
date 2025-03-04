#include <efi.h>
#include <efilib.h>

EFI_STATUS EFIAPI efi_main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
    InitializedLib(ImageHandle, SystemTable);
    Print(L"UEFI LOADED\n");
    return EFI_SUCCESS;
}