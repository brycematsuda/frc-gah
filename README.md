# frc-gah

Inspired by [this Facebook post on #moardata @ The Blue Alliance](https://www.facebook.com/groups/moardata/permalink/1094808283872799/), FRC GAH (Game Announcer Helper) is a small web application that uses The Blue Alliance's API ([via a Ruby port by Tyler 'chacha' Carter](https://github.com/chacha/thebluealliance-ruby)) to display team information for all six teams playing in each match at a competition. This saves time trying to read from a long list of teams on an Excel sheet, or a physical piece of paper, or opening six individual TBA pages.

![frc-gah screenshot](http://i.imgur.com/o7UItSJ.png)

As this was thrown together in a few hours, the layout is currently pretty crude and the information is pretty basic (just team name, number, sponsors and location), but it can be improved to be nicer and include more detailed information, time permitting. Feel free to fork it and make your own additions.

## Setup
1. Install Sinatra via `gem install sinatra`
2. (Optional) Install rerun via `gem install rerun` for auto-reload on changes.
3. Start the app via `ruby frc-gah.rb` (or `rerun 'ruby frc-gah.rb'` if you followed step 2)
4. Visit app at [http://localhost:4567](http://localhost:4567) and follow the instructions.

(For more information on event and match keys, see the [TBA API docs](https://www.thebluealliance.com/apidocs) for more details.)

## Disclaimer

FRC® is a registered trademarks of FIRST® (www.usfirst.org) which is not overseeing, involved with, or responsible for this activity, product, or service.

