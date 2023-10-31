# Miscalleneous Shell Scripts
A collection of bash shell scripts serving as the solution to the questions in [this file](ICS_2305_BASH_ASSIGNEMNT.pdf)

## 5. image-conversion.sh
This script depends on the [imagemagik](https://imagemagick.org/) package. For Debain-based systems, the following command can be used to get it:
```bash
sudo apt update
sudo apt install imagemagik
```

You can test that this command behaves as expected using 

### Image Attributions
These are the attributions for the images in the [images](./images/) folder.


- [The Red Train](https://pin.it/AXH55AM) by [HanzoAI](https://www.pinterest.com/HanzoAiArt/)

- [pink-and-green-vintage-car-parked-beside-brown-concrete-building-during-daytime](https://unsplash.com/photos/pink-and-green-vintage-car-parked-beside-brown-concrete-building-during-daytime-aUtMy02DOo4?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash) by [hidde schalm](https://unsplash.com/@hdsfotografie95?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash)

## 6. ip-hosts.sh
The functionality is implemented using the `ping` command. The same functionality can be achieved (much faster, by the way) using the `fping` command. However, unlike `ping`, `fping` does not come shipped
with most Linux distributions. For Debian-based systems you can install it using the following commands:
```bash
sudo apt udpdate
sudo apt install net-tools
```
The `fping` implemenntation is more succint than the implementation given here.

## 7. mail-merge.sh
For this script to run, you need the [jq](https://jqlang.github.io/jq/) package installed on your system.
For Debian systems:
```bash
sudo apt update
sudo apt install jq
```
This package is a lightweight and flexible command line JSON processor, but here, it has been used to url-encode the message in order to make sure that special characters like `\n` and `&` are handled correctly.

The implementation also assumes that the `x-www-browser` alternative is set (preferrably to Firefox). It calls 
`x-www-browser` with a `mailto` url containing the subject, recepients and message.

An alternative to this can be to use the `open` command with the `mailto` url. This assumes that the default email application is set.

The implementation needs to be made general so that it can "mail-merge" any message and for any set of recepients with any subject line.
Ideally, I would like this to be achieved by allowing one to pass in the recepients file, the subject line and the message file instead of them being hard-coded into the script. But it satisfies its corresponding question (no. 7) as is.

The script was tested with Firefox but did not work with Chrome. Chrome completely ignored the `mailto` url when trying to pass it through the terminal.
