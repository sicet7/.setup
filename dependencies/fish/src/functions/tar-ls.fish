function tar-ls
    set FILE $argv[1];
    switch (file --mime-type -b "$FILE")
    case "application/gzip"
        tar --gzip --list --file="$FILE"
    case "application/x-bzip2"
        tar --bzip2 --list --file="$FILE"
    case '*'
        tar --list --file="$FILE"
    end
end
