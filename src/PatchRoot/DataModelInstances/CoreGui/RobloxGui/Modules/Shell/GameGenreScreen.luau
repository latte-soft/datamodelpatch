local l_BaseCarouselScreen_0 = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("BaseCarouselScreen"));
return function(v1, v2)
    local v3 = l_BaseCarouselScreen_0("ExperienceGenre");
    v3:SetTitleZIndex(2);
    v3:SetTitle(v1);
    v3:LoadGameCollection(v2);
    return v3;
end;
