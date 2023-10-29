# Miscalleneous Shell Scripts
A collection of bash shell scripts serving as the solution to the questions in [this file](ICS_2305_BASH_ASSIGNEMNT.pdf)

## 7. mail-merge.sh
For this script to run, you need the [jq](https://jqlang.github.io/jq/) package installed on your system.
For Debian systems:
```bash
sudo apt install jq
```
This package is a lightweight and flexible command line JSON processor, but here, it has been used to url-encode the message in order to make sure that special characters like `\n` and `&` are handled correctly.

This needs to be made general so that it can "mail-merge" any message and for any set of recepients.
Ideally, I would like this to be achieved by allowing one to pass in the recepients file and the message file
instead of them being hard-coded into the script. But it satisfies its corresponding question (no. 7) as is.

The script was tested with Firefox but did not work with Chrome. Chrome completely ignored the mailto url when trying to pass it through the terminal.
