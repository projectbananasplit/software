@echo off
set param=" --accept-source-agreements --silent"

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
echo %red%"

:winget uninstall -e --id "Microsoft.WindowsCamera_8wekyb3d8bbwe" "%param%"
