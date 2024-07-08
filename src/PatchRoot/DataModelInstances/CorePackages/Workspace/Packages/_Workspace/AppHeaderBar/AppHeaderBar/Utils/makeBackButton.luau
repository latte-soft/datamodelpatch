local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
return function(v6)
    return function()
        return v1.createElement(l_IconButton_0, {
            size = UDim2.fromOffset(0, 0), 
            iconSize = l_IconSize_0.Medium, 
            icon = l_Images_0["icons/navigation/pushBack"], 
            onActivated = v6
        });
    end;
end;
