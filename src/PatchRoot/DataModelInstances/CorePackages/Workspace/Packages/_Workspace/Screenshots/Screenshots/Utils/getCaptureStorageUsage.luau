local l_CaptureService_0 = game:GetService("CaptureService");
local _ = require(script.Parent.Parent.Types);
formatBytes = function(v2)
    local v3 = {
        "Bytes", 
        "KB", 
        "MB", 
        "GB", 
        "TB"
    };
    local v4 = math.floor(math.log(v2) / 6.931471805599453);
    return string.format("%.2f%s", v2 / math.pow(1024, v4), v3[v4 + 1]);
end;
return function(v5)
    if #v5 == 0 then
        return ;
    else
        local v6 = {};
        for _, v8 in ipairs(v5) do
            table.insert(v6, v8.filePath);
        end;
        local _, l_result_0 = pcall(function()
            return l_CaptureService_0:GetCaptureStorageSizeAsync(v6);
        end);
        return formatBytes(l_result_0);
    end;
end;
