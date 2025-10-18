
state("Diggerman") {
    float gametime1 : "mono.dll", 0x001F5680, 0xF0, 0x124, 0x3C, 0x10, 0xAC;
    float gametime2 : "mono.dll", 0x001F9EE4, 0xF0, 0x124, 0x3C, 0x10, 0xAC;
    float gametime3 : "mono.dll", 0x002030F4, 0xF0, 0x124, 0x3C, 0x10, 0xAC;
    float gametime4 : "mono.dll", 0x0020A900, 0xF0, 0x124, 0x3C, 0x10, 0xAC;
    int score : "mono.dll", 0x001F50AC, 0x334, 0xC, 0x1C, 0x18;
}

startup {
    vars.lastSplitScore = 0;
    print("ASL: connected!");
}


split {
    if ((current.score == 99 || current.score == 299 || current.score == 599 || current.score == 699 || current.score == 799 || current.score == 899 || current.score == 999 || current.score == 1099 || current.score == 1199) 
        && current.score > vars.lastSplitScore) 
    {
        vars.lastSplitScore = current.score;
        return true;
    }//cant find last split after boss dies :(
    return false;
}  

     
gameTime {
    if (current.gametime1 > 0) return TimeSpan.FromSeconds(current.gametime1);
    if (current.gametime2 > 0) return TimeSpan.FromSeconds(current.gametime2);
    if (current.gametime3 > 0) return TimeSpan.FromSeconds(current.gametime3);
    if (current.gametime4 > 0) return TimeSpan.FromSeconds(current.gametime4);
    return null;
}

start {
    if ((current.gametime1 > 0 && old.gametime1 == 0)
        || (current.gametime2 > 0 && old.gametime2 == 0)
        || (current.gametime3 > 0 && old.gametime3 == 0)
        || (current.gametime4 > 0 && old.gametime4 == 0)) {
	vars.lastSplitScore = 0;
        return true;
    }
    return false;
}



