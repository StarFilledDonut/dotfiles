{
  programs.wlogout = {
    enable = true;
    layout = [
        {
            "label" = "lock";
            "action" = "sleep 1; hyprlock";
            "text" = "Lock";
            "keybind" = "e";
        }
        {
            "label" = "hibernate";
            "action" = "sleep 1; systemctl hibernate";
            "text" = "Hibernate";
            "keybind" = "h";
        }
        {
            "label" = "logout";
            "action" = "hyprctl dispatch exit";
            "text" = "Exit";
            "keybind" = "l";
        }
        {
            "label" = "shutdown";
            "action" = "systemctl poweroff";
            "text" = "Shutdown";
            "keybind" = "s";
        }
        {
            "label" = "suspend";
            "action" = "systemctl suspend";
            "text" = "Suspend";
            "keybind" = "u";
        }
        {
            "label" = "reboot";
            "action" = "systemctl reboot";
            "text" = "Reboot";
            "keybind" = "r";
        }
    ];
    style = ''
        @define-color foreground #cdd6f4;
        @define-color background #1e1e2e;
        @define-color cursor #cdd6f4;

        @define-color color0 #1e1e2e;
        @define-color color1 #a6adc8;
        @define-color color2 #89dceb;
        @define-color color3 #74c7ec;
        @define-color color4 #94e2d5;
        @define-color color5 #a6e3a1;
        @define-color color6 #f9e2af;
        @define-color color7 #cdd6f4;
        @define-color color8 #b4befe;
        @define-color color9 #a6adc8;
        @define-color color10 #89dceb;
        @define-color color11 #74c7ec;
        @define-color color12 #94e2d5;
        @define-color color13 #a6e3a1;
        @define-color color14 #f9e2af;
        @define-color color15 #cdd6f4;

        /*
                  _                         _    
        __      _| | ___   __ _  ___  _   _| |_  
        \ \ /\ / / |/ _ \ / _` |/ _ \| | | | __| 
         \ V  V /| | (_) | (_| | (_) | |_| | |_  
          \_/\_/ |_|\___/ \__, |\___/ \__,_|\__| 
                          |___/                  
         
        by Stephan Raabe (2023) 
        ----------------------------------------------------- 
        */

        /* -----------------------------------------------------
         * General 
         * ----------------------------------------------------- */

        * {
            font-family: "JetBrainsMono Nerd Font";
          font-weight: 700;
          background-image: none;
          transition: 20ms;
        }

        window {
          /* background-color: rgb(60, 56, 50); */
          background-color: transparent;
          animation: fadeIn ease-in 0.5s;
        }

        button {
          transition: all ease-in-out 0.2s;
          color: #cba6f7;
            font-size:20px;

            background-repeat: no-repeat;
          background-position: center;
          background-size: 10%;

          border-style: solid;
          background-color:  #1e1e2e;
          border: 3px solid #FFFFFF;
          border-radius: 20px;

            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        /* button:focus, */
        button:active,
        button:hover {
            /* color: #d79921; */
          background-color: #313244;
          background-size: 12%;
          transition: all ease-in-out 0.2s;
          /* border: 3px solid #cba6f7; */
        }

        /* 
        ----------------------------------------------------- 
        Buttons
        ----------------------------------------------------- 
        */

        #lock {
          margin: 10px;
          /* border-radius: 20px; */
          background-image: image(url("icons/lock.png"));
        }

        #logout {
          margin: 10px;
          /* border-radius: 20px; */
          background-image: image(url("icons/logout.png"));
        }

        #suspend {
          margin: 10px;
          /* border-radius: 20px; */
          background-image: image(url("icons/suspend.png"));
        }

        #hibernate {
          margin: 10px;
          /* border-radius: 20px; */
          background-image: image(url("icons/hibernate.png"));
        }

        #shutdown {
          margin: 10px;
          /* border-radius: 20px; */
          background-image: image(url("icons/shutdown.png"));
        }

        #reboot {
          margin: 10px;
          /* border-radius: 20px; */
          background-image: image(url("icons/reboot.png"));
        }

        #reboot:hover,
        #shutdown:hover,
        #hibernate:hover,
        #suspend:hover,
        #logout:hover,
        #lock:hover{
          padding: 10px;
        }


        @keyframes fadeIn {
          from { opacity: 0; }
          to { opacity: 1; }
        }
    '';
  };

  xdg.configFile."wlogout/icons" = {
    recursive = false;
    source = "${./icons}";
  };
}
