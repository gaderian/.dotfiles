#!/usr/bin/env bash
#Created [:VIM_EVAL:]strftime('%Y-%m')[:END_EVAL:]

## Variables ##
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

### Code below ###

main () {
    exit 0
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    main "$@"
fi
