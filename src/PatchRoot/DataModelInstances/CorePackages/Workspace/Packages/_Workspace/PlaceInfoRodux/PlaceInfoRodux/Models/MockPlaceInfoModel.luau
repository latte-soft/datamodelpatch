local l_MockId_0 = require(script:FindFirstAncestor("PlaceInfoRodux").Parent.Dev.UnitTestHelpers).MockId;
local v1 = require(script.Parent.PlaceInfoModel);
local v3 = {
    mock = function()
        local v2 = v1.new();
        v2.builder = "builder";
        v2.builderId = l_MockId_0();
        v2.description = "description";
        v2.imageToken = l_MockId_0();
        v2.isPlayable = true;
        v2.name = "name";
        v2.placeId = l_MockId_0();
        v2.price = 0;
        v2.reasonProhibited = nil;
        v2.universeId = l_MockId_0();
        v2.universeRootPlaceId = l_MockId_0();
        v2.url = "url";
        return v2;
    end
};
setmetatable(v3, {
    __index = v1
});
return v3;
