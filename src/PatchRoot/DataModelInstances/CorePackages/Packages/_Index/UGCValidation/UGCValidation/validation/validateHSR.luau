local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.util.FailureReasonsAccumulator);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local function v11(v5, v6)
    if not v6.bypassFlags or not v6.bypassFlags.skipValidateHSR then
        local l_v5_Descendants_0 = v5:GetDescendants();
        table.insert(l_v5_Descendants_0, v5);
        local v8 = v2.new();
        for _, v10 in l_v5_Descendants_0, nil, nil do
            if not (not v10:IsA("BaseWrap") or v10:IsHSRReady()) then
                v1.reportFailure(v1.ErrorType.validateHSR_HSRDataNotReady);
                if not v4() then
                    v8:updateReasons(false, {
                        (("HSR data not ready for %*format((v10:GetFullName())))
                    });
                else
                    v8:updateReasons(false, {
                        (("Missing HSR data for %*. Please, try again."):format((v10:GetFullName())))
                    });
                end;
            end;
        end;
        return v8:getFinalResults();
    else
        return true;
    end;
end;
local function v17(v12)
    local l_v12_Descendants_0 = v12:GetDescendants();
    table.insert(l_v12_Descendants_0, v12);
    local v14 = v2.new();
    for _, v16 in l_v12_Descendants_0, nil, nil do
        if not (not v16:IsA("BaseWrap") or v16:IsHSRReady()) then
            v1.reportFailure(v1.ErrorType.validateHSR_HSRDataNotReady);
            v14:updateReasons(false, {
                (("HSR data not ready for %*format((v16:GetFullName())))
            });
        end;
    end;
    return v14:getFinalResults();
end;
if not v4() then
    return v17;
else
    return v11;
end;
