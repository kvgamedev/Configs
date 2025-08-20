{ config, pkgs, ... }:

{
imports =
	[ # Include the results of the hardware scan.
	./hardware-configuration.nix
	];

# Bootloader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

# Use latest kernel.
boot.kernelPackages = pkgs.linuxPackages_latest;

networking.hostName = "nixos"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

networking.networkmanager.enable = true;

time.timeZone = "Asia/Kolkata";
i18n.defaultLocale = "en_IN";
i18n.extraLocaleSettings = {
	LC_ADDRESS = "en_IN";
	LC_IDENTIFICATION = "en_IN";
	LC_MEASUREMENT = "en_IN";
	LC_MONETARY = "en_IN";
	LC_NAME = "en_IN";
	LC_NUMERIC = "en_IN";
	LC_PAPER = "en_IN";
	LC_TELEPHONE = "en_IN";
	LC_TIME = "en_IN";
};

services.xserver.xkb = {
	layout = "us";
	variant = "";
};

hardware.graphics.enable = true;
services.xserver.videoDrivers = [ "nvidia" ];
hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		powerManagement.finegrained = false;
		open = false;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
		# prime = {
		# 	sync.enable = true;
		# 	nvidiaBusId = "PCI:1:0:0";
		# };
};

users.users.kv = {
	isNormalUser = true;
	description = "KV";
	extraGroups = [ "networkmanager" "wheel" ];
	packages = with pkgs; [];
	shell = pkgs.fish;
};

nixpkgs.config.allowUnfree = true;

# $ nix search wget
environment.systemPackages = with pkgs; [
	neovim
	hyprland
	kitty
	ghostty
	git
	git-lfs
	lazygit
	fzf
	brightnessctl
	noto-fonts
	noto-fonts-emoji
	yazi
	fish
	starship
	keyd
	rofi-wayland
	unzip
	zoxide
	eza
	bat
	ripgrep
	fd
	brave
	wl-clipboard
	cliphist
	bottom
	mission-center
	nvtopPackages.nvidia

	# Development
	gnumake
	cmake
	gcc

	zig
	zls
	clang-tools

	glfw
	imgui

	# Ricing
	waybar
	matugen
	swww
];

fonts.packages = with pkgs; [
	nerd-fonts.noto
	noto-fonts-color-emoji
];

programs.hyprland.enable = true;
environment.sessionVariables.NIXOS_OZONE_WL = "1";
programs.fish.enable = true;

services.keyd = {
	enable = true;
	keyboards = {
		default = {
			ids = [ "*" ];
			settings = {
				main = {
					capslock = "timeout(escape, 70, leftcontrol)";
					escape = "capslock";
				};
				otherlayer = {};
			};
			extraConfig = ''
				'';
		};
	};
};

environment.variables.EDITOR = "nvim";
environment.variables.VISUAL = "nvim";
programs.neovim = {
	enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;
};

# programs.nix-ld.enable = true;
# programs.nix-ld.libraries = with pkgs; [
# ];

nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

system.stateVersion = "25.05";
}
