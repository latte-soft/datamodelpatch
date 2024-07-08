local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.RoactRodux);
local v3 = require(l_Modules_0.Luobu.Models.TencentNoticeModel);
local v4 = require(l_Modules_0.Luobu.Actions.SetTencentNoticeInfo);
local v5 = require(l_Modules_0.Luobu.Actions.SetTencentNoticeBadgeCount);
local v6 = require(l_Modules_0.Luobu.Actions.ReadTencentNoticeId);
local v7 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v8 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v9 = require(l_Modules_0.Luobu.Enum.TencentNoticeSceneType);
local v10 = require(l_Modules_0.Luobu.Enum.TencentNoticeType);
local v11 = require(l_Modules_0.Luobu.Flags.FFlagLuobuCJVMorePageShowTencentNotice);
local v12 = require(l_Modules_0.Luobu.Flags.FFlagLuobuShowTencentNoticePopup);
local v13 = v1.Component:extend("TencentNoticeEventReceiver");
v13.init = function(v14)
    v14.connections = {
        v14.props.RobloxEventReceiver:observeEvent("SyncTencentNoticeInformation", function(v15, v16)
            local v17 = {};
            local v18 = {};
            local v19 = {};
            local v20 = 0;
            for _, v22 in ipairs(v15) do
                local v23 = v3.fromJsonData(v22);
                if v23 ~= nil then
                    table.insert(v19, v23);
                    if v23.hasRead == false then
                        v20 = v20 + 1;
                        if not (v23.type ~= v10.Text) or v23.type == v10.Image then
                            if v23.scene == v9.BeforeLogin then
                                table.insert(v17, v23);
                            elseif v23.scene == v9.AfterLogin then
                                table.insert(v18, v23);
                            end;
                        end;
                    else
                        v14.props.readTencentNoticeId(v23.noticeId);
                    end;
                end;
            end;
            if v12 then
                if v16 == v9.AfterLogin and #v18 > 0 then
                    v14.props.openTencentNoticePopup(v18);
                elseif v16 == v9.BeforeLogin and #v17 > 0 then
                    v14.props.openTencentNoticePopup(v17);
                end;
            end;
            if v11 then
                v14.props.setTencentNoticeInfo(v19);
                if v20 > 0 then
                    v14.props.setTencentNoticeBadgeCount(v20);
                end;
            end;
        end)
    };
end;
v13.render = function(_)
end;
v13.willUnmount = function(v25)
    for _, v27 in pairs(v25.connections) do
        v27:disconnect();
    end;
end;
return (v2.connect(nil, function(v28)
    return {
        openTencentNoticePopup = function(v29)
            return v28(v7(v8.TencentNoticePopup, {
                noticeList = v29
            }));
        end, 
        setTencentNoticeInfo = function(v30)
            return v28(v4(v30));
        end, 
        readTencentNoticeId = function(v31)
            return v28(v6(v31));
        end, 
        setTencentNoticeBadgeCount = function(v32)
            return v28(v5(v32));
        end
    };
end)(v13));
