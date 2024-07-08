local l_Images_0 = require(script:FindFirstAncestor("PlayerContextualMenu").Parent.UIBlox).App.ImageSet.Images;
local _ = require(script.Parent.Types);
return function(v2, v3)
    if v2 then
        if v2.status == "InGame" then
            return l_Images_0["icons/menu/games_small"], v3.iconEmphasis;
        elseif not (v2.status ~= "Online") or v2.status == "InStudio" then
            return l_Images_0["component_assets/circle_16"], v3.onlinePresence;
        end;
    end;
    return nil, nil;
end;
