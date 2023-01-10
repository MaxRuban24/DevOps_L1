# First function to show active hosts

all ()
{
    arp -a | awk '{print $1,$2,$3,$4,$5}' 
}

# Second function to show open ports on system

target ()
{
   ss -tlwn | awk '{print $1," ",$2," ",$5}'
}

# Executing functions according to user input

case $1 in

    --all)
        all
    ;;

    --target)
        target
    ;;

    *)
        echo -e "Script usage:\n --all to list active hosts on required subnet\n --target to list open ports on required host"
    ;;

esac