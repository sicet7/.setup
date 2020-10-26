function tar-ls
    set FILE $argv[1];
    switch (file --mime-type -b "$FILE")
    case "application/gzip"
        tar --gzip --list --verbose --file="$FILE"
    case "application/x-bzip2"
        tar --bzip2 --list --verbose --file="$FILE"
    case '*'
        tar --list --verbose --file="$FILE"
    end
end
