local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Colors_0 = require(l_script_FirstAncestor_0.Parent.UIBlox).App.Style.Colors;
local l_ChatWindowBackgroundColor3_0 = require(l_script_FirstAncestor_0.Config).ChatWindowBackgroundColor3;
return {
    getBackgroundColor = function(v3, v4)
        if v3.BackgroundColor3 == l_ChatWindowBackgroundColor3_0 then
            return l_Colors_0.Flint:Lerp(v3.BackgroundColor3, v4.preferredTransparency);
        else
            return v3.BackgroundColor3;
        end;
    end, 
    getBackgroundTransparency = function(v5, v6)
        return v5.BackgroundTransparency * v6.preferredTransparency;
    end
};
