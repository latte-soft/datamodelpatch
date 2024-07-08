local l_script_FirstAncestor_0 = script:FindFirstAncestor("Profile");
local l_Dash_0 = require(l_script_FirstAncestor_0.dependencies).Dash;
local v2 = require(l_script_FirstAncestor_0.Stories.StoryHelpers.MockAssetsById);
local v3 = {};
for v4, v5 in pairs(v2) do
    v3[v5.name] = v4;
end;
return {
    controls = {
        itemName = l_Dash_0.keys(v3)
    }, 
    getAssetId = function(v6)
        return (tostring(v3[v6.controls.itemName]));
    end
};
