
numfmtF
=======

Represent a number in sections for KB MB GB etc.

Example usage:

    % free -b | grep 'Mem' | tr -s ' ' | cut -d ' ' -f 3 | xargs ~/bin/numfmtF.hs # Memory used.
    1GiB 206MiB 324KiB


