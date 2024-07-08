local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local v2 = require(l_Parent_0.Enums.CaptureType);
local _ = require(l_Parent_0.Types);
local v4 = {
    {
        contentId = "rbxasset://textures/AvatarEditorImages/AvatarEditor.png", 
        filePath = "c://some/path/to/2231221_1818_1234598400000.png", 
        type = v2.Screenshot
    }, 
    {
        contentId = "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png", 
        filePath = "c://some/path/to/2231221_14375697_1653030000000.png", 
        type = v2.Screenshot
    }
};
return function(v5)
    local v6 = {};
    for v7 = 1, v5 do
        local v8 = v1.joinDeep(v4[v7 % #v4 + 1], {});
        v8.contentId = "rbxasset://textures/" .. ("/./"):rep((math.floor(v7 / #v4))) .. string.sub(v8.contentId, 21);
        table.insert(v6, v8);
    end;
    return v6;
end;
