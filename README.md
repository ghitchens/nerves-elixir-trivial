Nerves / Elixir
===============

This __trivial__ example demonstrates building an Elixir-based application 
using Nerves, and deploying firmware to the [BeagleBone Black](http://beagleboard.org/Products/BeagleBone+Black).  All it does is make the LED bar flash back and forth in a pattern.

This example demonstrates:

- building host [Elixir](http://elixir-lang.org) in the Nerves SDK
- releasing an Elixir app via relx
- turning released Elixir app into [Nerves](http://nerves-project.org) image
- burning an sdcard that boots to an Elixir App on the BeagleBone Black

### Some prerequisites

I assume you already know how to build [Nerves](http://nerves-project.org) from source, and deploy the [Nerves Sample App](https://github.com/nerves-project/nerves-demo) on the BeagleBone Black, 

There are __lots__ of trick in terms of getting the stock nerves build to work, so please do that first, and make sure the built sample builds and boots.

### Building Nerves with Elixir support

- Get a branch of nerves with Elixir support (for now, use [my fork](https://github.com/ghitchens/nerves-sdk))
- Run "make menuconfig" and enable Elxir support
- Build Buildroot and the Nerves SDK ("make")
- Build/install Frank's [mmccopy](https://github.com/fhunleth/mmccopy) utility (used by sample makefile)

### Building the trivial Elixir sample

      source <nerves-sdk>/nerves-env.sh   # bring in nerves enviornment
            
      make              # compiles and builds _release
      make firmware     # builds firmware from release
      make sdcard       # attempts to burn sdcard using mmccopy      
      
## Known Issues

This example was hacked together __very__ quickly, it will hopefully improve. 
Since I'm quite new to Buildroot and Nerves, feel free to offer suggestions or pull requests!   Yes, I know...

- my makefile is pathological
- this doesn't demo any dependencies (though they work)
- the interpreter that boots in the console Eshell, not IEx