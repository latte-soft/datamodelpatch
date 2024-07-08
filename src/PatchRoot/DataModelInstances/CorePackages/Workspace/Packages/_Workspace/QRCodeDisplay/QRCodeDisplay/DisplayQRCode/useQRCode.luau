local l_script_FirstAncestor_0 = script:FindFirstAncestor("QRCodeDisplay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.QRCode);
local v4 = require(script.Parent.ecToNumber);
local _ = require(l_script_FirstAncestor_0.Common.ECLevels);
return function(v6)
    return v2.useMemo(function()
        local _, v8 = v3.qrcode(v6.toEncode, v4(v6.ecLevel));
        return v8;
    end, {
        v6.toEncode, 
        v6.ecLevel
    });
end;
