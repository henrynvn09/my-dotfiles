from subprocess import PIPE, Popen


def truncate(name, trunclen):
    if len(name) > trunclen:
        name = name[:trunclen]
        name += "..."
        if ("(" in name) and (")" not in name):
            name += ")"
        if ("[" in name) and ("]" not in name):
            name += "]"
    return name


def runcmd(cmd):
    p = Popen(cmd, shell=True, stdout=PIPE, stderr=PIPE)
    stdout, stderr = p.communicate()
    return stdout[:-1].decode("UTF-8"), stderr


stdstatus, stderr = runcmd("playerctl status")

if stderr:
    print("")
    exit()

stdout, stderr = runcmd('playerctl metadata --format " {{ title }} - {{ artist }}"')

if stdstatus in ["Stopped"]:
    print("")
elif stdstatus == "Paused":
    print("%{F#979ca1}%{T4}%{T-}%{T6}", truncate(stdout, 69), "%{T-}%{F-}", end="")
else:
    print("", truncate(stdout, 69), end="")
