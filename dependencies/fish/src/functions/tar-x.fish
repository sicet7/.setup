function tar-x
    set FILE $argv[1];
    set OUTPUT $argv[2];

    if [ ! -f "$FILE" ]
        echo "Invalid FILE argument.";
        false;
        return;
    end

    set -l TAR_ARGS "--extract";
    set -a TAR_ARGS "--verbose";

    switch (file --mime-type -b "$FILE")
    case "application/gzip"
        set -a TAR_ARGS "--gzip"
    case "application/x-bzip2"
        set -a TAR_ARGS "--bzip2"
    end

    if set -q argv[2]
        if [ ! -d "$OUTPUT" ]
            mkdir -p "$OUTPUT"
        end
        set -a TAR_ARGS "--directory=$OUTPUT";
    end

    set -a TAR_ARGS "--file=$FILE";

    tar $TAR_ARGS
end
