{ ... }:
{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
	device = "/dev/nvme0n1";
	content = {
	  type = "gpt";
	  partitions = {
	    ESP = {
	      size = "1G";
	      type = "EF00";
	      content = {
	        type = "filesystem";
		format = "vfat";
		mountpoint = "/boot";
	      };
	    };
	    root = {
	      size = "100%FREE";
	      content = {
	        type = "filesystem";
		format = "ext4";
		mountpoint = "/";
		mountOptions = [ "noatime" "umask=0077" ];
	      };
	    };
	    swap = {
	      size = "100%";
	      type = "8200";
	      content = {
	        type = "swap";
		discardPolicy = "both";
	      };
	    };
	  };
	};
      };
    };
  };
}
