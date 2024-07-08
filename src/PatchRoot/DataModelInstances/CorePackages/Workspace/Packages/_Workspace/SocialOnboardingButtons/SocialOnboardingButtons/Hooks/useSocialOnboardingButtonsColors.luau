local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialOnboardingButtons");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Experiments.SocialOnboardingButtonsIXP);
local v3 = require(l_script_FirstAncestor_0.Enums.ColorVariantsEnum);
local v4 = require(l_Parent_0.UIBlox);
local l_DarkTheme_0 = v4.App.Style.Themes.DarkTheme;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v7 = Color3.fromHex("272930");
local v8 = Color3.fromHex("F4F4F6");
local v9 = {
    colorful = {
        lightTheme = {
            addFriends = Color3.fromHex("BFE6FF"), 
            findContacts = Color3.fromHex("B2F5D5"), 
            myQRCode = Color3.fromHex("FFD7DF"), 
            searchPeople = Color3.fromHex("EED2FF"), 
            unlockVoice = Color3.fromHex("FFF8DC"), 
            myProfile = Color3.fromHex("#A2E7E4")
        }, 
        darkTheme = {
            addFriends = Color3.fromHex("2C3E50"), 
            findContacts = Color3.fromHex("1B7740"), 
            myQRCode = Color3.fromHex("9A2B1D"), 
            searchPeople = Color3.fromHex("4D256D"), 
            unlockVoice = Color3.fromHex("B98D5F"), 
            myProfile = Color3.fromHex("#11816A")
        }
    }, 
    blackAndWhite = {
        lightTheme = {
            addFriends = v7, 
            findContacts = v7, 
            myQRCode = v7, 
            searchPeople = v7, 
            unlockVoice = v7, 
            myProfile = v7
        }, 
        darkTheme = {
            addFriends = v8, 
            findContacts = v8, 
            myQRCode = v8, 
            searchPeople = v8, 
            unlockVoice = v8, 
            myProfile = v8
        }
    }
};
return function()
    local v10 = v2.useSocialOnboardingBtnsColor();
    local v11 = l_useStyle_0().Theme == l_DarkTheme_0;
    local v12 = {};
    local v13 = nil;
    if v10 == v3.Colorful then
        if not v11 then
            v12 = v9.colorful.lightTheme;
            v13 = v7;
        else
            v12 = v9.colorful.darkTheme;
            v13 = v8;
        end;
    elseif v10 == v3.BlackAndWhite then
        if not v11 then
            v12 = v9.blackAndWhite.lightTheme;
            v13 = v8;
        else
            v12 = v9.blackAndWhite.darkTheme;
            v13 = v7;
        end;
    end;
    return v12, v13, v10;
end;
