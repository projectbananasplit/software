@echo off
set param=--accept-source-agreements --silent

@for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a"
set red=%esc%[38;5;1m
set green=%esc%[38;5;2m
set yellow=%esc%[38;5;11m
set blue=%esc%[38;5;12m
set purp=%esc%[38;5;13m
set white=%esc%[38;5;15m

echo %red%Burning Toaster
echo %red%
echo %red%"                                          %/
echo %red%"                                        ,@   @.
echo %red%"                                       @     @@
echo %red%"                                                        *@@@/
echo %red%"                                                    @,  &   @
echo %red%"                                                   @          @
echo %red%"                                                   @,(@     #(@
echo %red%"                          ,@/@@                      @    ,@.
echo %red%"                          @   .@       @   @
echo %red%"                        *#     @      @*     @
echo %red%"                         @@#@@*      @       @                     @@
echo %red%"                                      @@@   @                     @# @
echo %red%"                                                         @@,    @%@  @
echo %red%"                         @@                            /& @     @ @@&
echo %red%"                          @.@                        ,@   *#    #@
echo %red%"                  @@     ,@  @      ,@ @            @      @.      .@#
echo %red%"                #@ @    %@   @,    @  @    @@     @         @   ,@ @     @,
echo %red%"               @  .@   %&,&@ @   @*   @    @ %@ ,@          &&@,  &,    ,@@
echo %red%"             /%    @   %(% @@   @     @@ @@#    .                 @    %@  @
echo %red%"             @     @     &@@  .@      @      /                    @.  @  ,&@
echo %red%"             @,     @/    #% (@        @ @ ,# @   @@   #          @,  @@&
echo %red%"           ,  @        @@@*   #          @*    @@ @   %@          @,
echo %red%"           @*     @@        #@.             % @   @ @.  #         @
echo %red%"            %     @   @,         &&          @    ,.    @        @(@@
echo %red%"           @#.   .@      ,%     @  &               @    @@*@      #@  .
echo %red%"          .%#.  @%.%         @ @ ..   #   /     ..  % .  /    . ,&    ..
echo %red%"          . .(%  .%.       .  *% ..  .( (. (  @ ..  .*..& .   @# .    ..
echo %red%"                %.  ,#                     @ @@     ,. @   %@
echo %red%"                .%@    @                      /     & #   @
echo %red%"    /@@@*        /@@    ,                    &    @   &  ,@@@#,
echo %red%"  @@@/            %@@/  .                  *.   *#   .,  *       ,#@@@@#.
echo %red%" @@          (@@#,        .#@@@#,          /   ,% %@@&,  &  @            ,@@@
echo %red%" @#                      /&@%*        *%@@@@,  @   @            .%@#         @@
echo %red%" @                                   /@@(               ,&@,                  @&
echo %red%" @                                            &@@#*                           &@
echo %red%"*@                                              /                             .@
echo %red%"&@                                              @                              @
echo %red%"@@                                              @                              @
echo %red%"@@                                              &                              @
echo %red%"/@                                              *               .#@&*,.%.      @
echo %red%" @                                             .          @             .      @
echo %red%" @                                             ,         .      %@  @&   ,    .@
echo %red%"  @                                            (         ,      @(  //.  @    (@
echo %red%"  (@                                           (         (      / .  @&  &    &@
echo %red%"    @@@%                                       ,         #       ./   .  /    (@
echo %red%"       @& @@@@&                                          /   &@     %@@   #    @
echo %red%"                .&@@@@@#                                  /      *@   ,    *@&@*
echo %red%"                         (@@@@@@%               ,         #      (*&@@@,%@.
echo %red%"                                 .%@@@@@*       &     @@&%&@@@@(      &@(
echo %red%"                                      @&#@@@@@@@@@@@@@/
echo %red%"
echo %red%"Burn & Uninstall unwanted and outdated software. (user-level)

:winget uninstall -e --id "Microsoft.WindowsCamera_8wekyb3d8bbwe" "%param%"

echo %blue%##############################
echo %blue%MSSTORE
echo %blue%##############################
echo %purp%==============================
echo %purp%Anwendungen
echo %purp%==============================
echo %green%Python 3.7
winget uninstall %param% -e --id "9NJ46SX7X90P"
echo %green%Python 3.8
winget uninstall %param% -e --id "9MSSZTT1N39L"
echo %green%Python 3.9
winget uninstall %param% -e --id "9P7QFQMJRFP7"
echo %green%Google Chrome
winget uninstall %param% --scope user -e --id "Google.Chrome"

:echo %green%inkstitch
:winget uninstall %param% -e --id org.inkstitch.app_is1

echo %purp%==============================
echo %purp%Hersteller
echo %purp%==============================
:echo %green%HP Display Center
: predeployed uninstall bug
:winget uninstall %param% --scope user -e --name "HP Display Center"
