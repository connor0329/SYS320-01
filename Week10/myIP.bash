ip addr | grep "global" | awk '{print $2}' | cut -d '/' -f 1
