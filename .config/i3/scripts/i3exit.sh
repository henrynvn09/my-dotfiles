#!/bin/sh
lock() {
    i3lock
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        qdbus org.kde.ksmserver /KSMServer logout 0 3 3
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    hibernate)
        lock && systemctl hibernate
        ;;
    reboot)
        qdbus org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout 0 1 3
        ;;
    shutdown)
        qdbus org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout 0 2 3
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
