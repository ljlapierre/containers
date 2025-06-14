Since running this natively in NixOS appears to be a pain, I'm packaging it up as a container so it's easier to run.

Download links & upstream documentation here: https://www.sonicwall.com/products/remote-access/vpn-clients

I first attempted to create this using Podman directly... but all information I found on the internet said "Just do GUI apps in Distrobox"

I wrote this as a simple repeatable build script.

### Usage

```
./build.sh
```
```
./cleanup.sh
```