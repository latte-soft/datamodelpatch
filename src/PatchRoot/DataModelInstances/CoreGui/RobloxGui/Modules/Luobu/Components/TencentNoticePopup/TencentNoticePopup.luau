local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v5 = require(l_Modules_0.Luobu.Components.TencentNoticePopup.NoticePageControl);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = v2.PureComponent:extend("TencentNoticePopup");
v7.validateProps = v6.strictInterface({
    noticeList = v6.table, 
    closePrompt = v6.callback
});
v7.render = function(v8)
    return v2.createElement(v5, {
        noticeList = v8.props.noticeList, 
        onActivated = v8.props.closePrompt, 
        settings = {
            widePopupWidth = 540, 
            widePopupHeight = 268, 
            headerHeight = 38, 
            bottomHeight = 72, 
            compactHeightToWidthRatio = 1.37614
        }
    });
end;
return (v3.connect(nil, function(v9)
    return {
        closePrompt = function()
            v9(v4());
        end
    };
end)(v7));
