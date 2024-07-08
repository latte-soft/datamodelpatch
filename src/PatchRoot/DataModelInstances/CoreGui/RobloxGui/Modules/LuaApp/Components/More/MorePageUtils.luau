local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Constants);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
return {
    paddingsForFormFactor = function(v3)
        local v4 = v3 == l_FormFactor_0.WIDE;
        local l_MORE_PAGE_COMPACT_PADDING_HORIZONTAL_0 = v1.MORE_PAGE_COMPACT_PADDING_HORIZONTAL;
        local l_MORE_PAGE_SECTION_PADDING_0 = v1.MORE_PAGE_SECTION_PADDING;
        if v4 then
            l_MORE_PAGE_COMPACT_PADDING_HORIZONTAL_0 = v1.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
            l_MORE_PAGE_SECTION_PADDING_0 = v1.MORE_PAGE_WIDE_PADDING_VERTICAL;
        end;
        return l_MORE_PAGE_COMPACT_PADDING_HORIZONTAL_0, l_MORE_PAGE_SECTION_PADDING_0, v1.MORE_PAGE_CONTENT_MAX_WIDTH + l_MORE_PAGE_COMPACT_PADDING_HORIZONTAL_0 * 2;
    end
};
