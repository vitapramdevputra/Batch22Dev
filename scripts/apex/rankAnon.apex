RankHandler rh = new RankHandler();
system.debug('1 prize is ' + rh.rankPrize(1));
system.debug('3 prize is ' + rh.rankPrize(3));
system.debug('5 prize is ' + rh.rankPrize(5));
system.debug('15 prize is ' + rh.rankPrize(15));

system.debug('-1 prize is ' + rh.rankPrize(-1));


RankHandler rh2 = new RankHandler();
system.debug('1 prize is ' + rh2.rankPrizeSwitch(1));
system.debug('3 prize is ' + rh2.rankPrizeSwitch(3));
system.debug('5 prize is ' + rh2.rankPrizeSwitch(5));
system.debug('15 prize is ' + rh2.rankPrizeSwitch(15));

system.debug('-1 prize is ' + rh2.rankPrizeSwitch(-1));