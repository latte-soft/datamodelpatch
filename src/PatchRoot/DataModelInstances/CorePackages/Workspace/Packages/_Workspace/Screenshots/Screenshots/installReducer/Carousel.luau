local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_0.Actions.CapturesRetrieved);
local v5 = require(l_Parent_0.Actions.CarouselClosed);
local v6 = require(l_Parent_0.Actions.CarouselIndexSelected);
local v7 = require(l_Parent_0.Actions.CarouselOpened);
local v8 = require(l_Parent_0.Actions.DeleteWarningModalClosed);
local v9 = require(l_Parent_0.Actions.DeleteWarningModalOpened);
local _ = require(l_Parent_0.Types);
local v11 = {
    IsOpen = false, 
    IsDeleteWarningModalOpen = false, 
    SelectedCaptureIndex = 0
};
local function _(v12, v13, v14)
    if v12[v13] ~= nil and v12[v13].filePath == v14.filePath then
        return v13;
    else
        return v2.List.findWhere(v12, function(v15)
            return v15.filePath == v14.filePath;
        end);
    end;
end;
return v3.createReducer(v11, {
    [v4.name] = function(v17, v18)
        if v17.IsOpen == false then
            return v17;
        elseif #v18.captures == 0 then
            return v2.Dictionary.join(v17, {
                IsOpen = false, 
                SelectedCaptureIndex = 0
            });
        elseif v18.selectedCapture == nil then
            return v2.Dictionary.join(v17, {
                SelectedCaptureIndex = math.min(v17.SelectedCaptureIndex, #v18.captures)
            });
        else
            assert(v18.selectedCapture ~= nil, "CapturesRetrieved selectedCapture should not be nil");
            local l_selectedCapture_0 = v18.selectedCapture;
            local l_captures_0 = v18.captures;
            local l_SelectedCaptureIndex_0 = v17.SelectedCaptureIndex;
            local v23 = if l_captures_0[l_SelectedCaptureIndex_0] ~= nil and l_captures_0[l_SelectedCaptureIndex_0].filePath == l_selectedCapture_0.filePath then l_SelectedCaptureIndex_0 else v2.List.findWhere(l_captures_0, function(v22)
                return v22.filePath == l_selectedCapture_0.filePath;
            end);
            if v23 == v17.SelectedCaptureIndex then
                return v17;
            elseif v23 ~= nil then
                return v2.Dictionary.join(v17, {
                    SelectedCaptureIndex = v23
                });
            else
                return v2.Dictionary.join(v17, {
                    SelectedCaptureIndex = math.clamp(v17.SelectedCaptureIndex - 1, 1, #v18.captures)
                });
            end;
        end;
    end, 
    [v5.name] = function(v24, _)
        return v2.Dictionary.join(v24, {
            IsOpen = false, 
            SelectedCaptureIndex = 0
        });
    end, 
    [v6.name] = function(v26, v27)
        return v2.Dictionary.join(v26, {
            SelectedCaptureIndex = v27.index
        });
    end, 
    [v7.name] = function(v28, v29)
        return v2.Dictionary.join(v28, {
            IsOpen = true, 
            SelectedCaptureIndex = v29.index
        });
    end, 
    [v8.name] = function(v30, _)
        return v2.Dictionary.join(v30, {
            IsDeleteWarningModalOpen = false
        });
    end, 
    [v9.name] = function(v32, _)
        return v2.Dictionary.join(v32, {
            IsDeleteWarningModalOpen = true
        });
    end
});
