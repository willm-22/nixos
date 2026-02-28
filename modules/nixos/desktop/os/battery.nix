{ config, pkgs, lib, ... }:
{
  services.upower.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;  # adjust to taste

      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;

      WIFI_PWR_ON_BAT = "on";
      RUNTIME_PM_ON_BAT = "auto";
      PCIE_ASPM_ON_BAT = "powersupersave";
    };
  };

  services.power-profiles-daemon.enable = false;

  boot.kernelParams = [
    "mem_sleep_default=deep" 
    "nvme.noacpi=1"            
    "pcie_aspm=force"         
  ];

  environment.systemPackages = with pkgs; [
    powertop
    tlp
    acpi
  ];

  powerManagement.powertop.enable = true;
}
