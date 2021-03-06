tell application "iTerm"
    activate
    tell current session of current terminal
        write text "echo \"First, set up your environment\" | figlet | lolcat"
        delay 5
        write text "echo \"The instructions are in the blog post\" | figlet | lolcat"
        delay 5
        write text "echo \"Here's mine...\" | figlet | lolcat"
        delay 5
        write text "docker-machine ls"
        delay 5
        write text "echo \"Now, let's take a look at the networks available on each host\" | figlet | lolcat"
        delay 5
        write text "docker $(docker-machine config mhl-demo0) network ls"
        delay 5
        write text "docker $(docker-machine config mhl-demo1) network ls"
        delay 5
        write text "echo \"Let's create a new one\" | figlet | lolcat"
        delay 5
        write text "docker $(docker-machine config mhl-demo0) network create -d overlay myapp"
        delay 5
        write text "echo \"OK! Here it is on mhl-demo0\" | figlet | lolcat"
        delay 5
        write text "docker $(docker-machine config mhl-demo0) network ls"
        delay 5
        write text "echo \"And it's also on mhl-demo1 too\" | figlet | lolcat"
        delay 5
        write text "docker $(docker-machine config mhl-demo1) network ls"
        delay 5
        write text "echo \"Let's create two containers\" | figlet | lolcat"
        delay 5
        write text "echo \"Nginx on mhl-demo0\" | figlet | lolcat"
        delay 5
        write text "echo \"And a client on mhl-demo1\" | figlet | lolcat"
        delay 5
        write text "docker $(docker-machine config mhl-demo0) run -itd --name=web --net=myapp nginx"
        delay 10
        write text "docker $(docker-machine config mhl-demo1) run -it --rm --net=myapp busybox wget -qO- http://web"
        delay 10
        write text "echo \"That's how easy it is for container to talk across hosts\" | figlet | lolcat"
    end tell
end tell
