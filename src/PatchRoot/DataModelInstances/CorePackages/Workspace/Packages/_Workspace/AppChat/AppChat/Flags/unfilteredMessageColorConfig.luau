game:DefineFastString("UnfilteredMessageLightHexColor", "335FFF");
game:DefineFastString("UnfilteredMessageDarkHexColor", "335FFF");
game:DefineFastInt("UnfilteredMessageTransparencyHundredths", 0);
return {
    UnfilteredMessageLightColor3 = Color3.fromHex(game:GetFastString("UnfilteredMessageLightHexColor")), 
    UnfilteredMessageDarkColor3 = Color3.fromHex(game:GetFastString("UnfilteredMessageDarkHexColor")), 
    UnfilteredMessageTransparency = game:GetFastInt("UnfilteredMessageTransparencyHundredths") / 100
};
