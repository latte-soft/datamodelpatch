local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local v3 = require(l_Parent_0.DetailsPageTemplate);
local v4 = require(l_Parent_0.DetailsPageTenfootTemplate);
local l_DeviceType_0 = require(l_Parent_1.Style.Constants).DeviceType;
local v6 = require(l_Parent_2.React);
local v7 = {
    [l_DeviceType_0.Console] = v4, 
    [l_DeviceType_0.Phone] = v3, 
    [l_DeviceType_0.Desktop] = v3, 
    [l_DeviceType_0.Unknown] = v3, 
    [l_DeviceType_0.Tablet] = v3, 
    [l_DeviceType_0.VR] = v3
};
return function(v8)
    return v6.createElement(v7[v8.deviceType] or v3, v8.detailsPageProps);
end;
