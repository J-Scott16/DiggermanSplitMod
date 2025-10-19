
state("Diggerman") {
    float gametime1 : "mono.dll", 0x001F5680, 0xF0, 0x124, 0x3C, 0x10, 0xAC;
    float gametime2 : "mono.dll", 0x001F9EE4, 0xF0, 0x124, 0x3C, 0x10, 0xAC;
    float gametime3 : "mono.dll", 0x002030F4, 0xF0, 0x124, 0x3C, 0x10, 0xAC;
    float gametime4 : "mono.dll", 0x0020A900, 0xF0, 0x124, 0x3C, 0x10, 0xAC;
    int progress : "mono.dll", 0x001F50AC, 0x334, 0xC, 0x1C, 0x18;
}

startup {
    vars.lastSplitProgress = 0;
    print("ASL: connected!");
}


split {
  print("ASL: " + current.progress);
    if ((current.progress == 4 || current.progress == 7 || current.progress == 10 || current.progress == 11 || current.progress == 12 || current.progress == 13 || current.progress == 14 || current.progress == 15 || current.progress == 16 || current.progress == 17) 
        && current.progress > vars.lastSplitProgress) 
    {
        vars.lastSplitProgress = current.progress;
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
	vars.lastSplitProgress = 0;
        return true;
    }
    return false;
}



