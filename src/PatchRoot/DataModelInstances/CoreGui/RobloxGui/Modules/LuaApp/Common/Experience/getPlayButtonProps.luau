local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.PlayButtonStates);
return function(v1, v2)
    assert(v1 ~= nil, "Expect playButtonState ~= nil");
    local v3 = {};
    if v1 == v0.Loading then
        v3.icon = "icons/status/unavailable";
        v3.isLoading = true;
        v3.isDisabled = true;
        return v3;
    elseif v1 == v0.Playable then
        v3.icon = "icons/common/play";
        v3.isDisabled = false;
        return v3;
    elseif v1 == v0.PaidAccess then
        assert(v2 ~= nil, "gameProductInfo cannot be nil when PlayButtonStates.PaidAccess");
        v3.price = v2.price;
        v3.icon = "icons/common/robux";
        v3.isDisabled = false;
        return v3;
    elseif v1 == v0.Private then
        v3.icon = "icons/status/private";
        v3.textKey = "Feature.ExperienceDetails.PlayButtonText.Private";
        v3.isDisabled = true;
        return v3;
    elseif v1 == v0.UnplayableOther then
        v3.icon = "icons/status/unavailable";
        v3.isDisabled = true;
        return v3;
    else
        v3.icon = "icons/status/unavailable";
        v3.isDisabled = true;
        return v3;
    end;
end;
