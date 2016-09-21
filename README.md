Backing up a Google Group
=========================

We had a Google Group that we ended up retiring.
Before removing it, we wanted to back up all of the messages
and make a readable archive.
This repo contains instructions and scripts for doing that
using a few freely available tools, namely:

- [google-group-crawler](https://github.com/icy/google-group-crawler)
- [mhonarc](https://www.mhonarc.org/)

How to back up a group
----------------------

To accomplish the following steps, you will need a bash terminal and git.
Open up a terminal and follow the steps below.

1. Clone this repository.

   ```bash
   $ git clone https://github.com/tbekolay/backup-google-group.git
   $ cd backup-google-group
   ```

2. [Install mhonarc](https://www.mhonarc.org/MHonArc/doc/install.html).

   ```bash
   $ sudo apt install mhonarc
   ```

3. If you're backing up a private Google Group,
   you will need a file with the correct set of cookies.
   The easiest way to do this is to install Firefox and the
   [Export Cookies add-on](https://addons.mozilla.org/en-US/firefox/addon/export-cookies/).
   Log into your Google account such that you can access
   the Google Group you want to backup,
   then save the cookies to the `backup-google-group` directory.

4. Run the `backup.sh` script and follow the prompts.

   ```bash
   $ ./backup.sh

   ```

License
-------

```
Copyright (c) 2016, Trevor Bekolay
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the
   distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
