return function(v0, v1)
    v0.reportCounter(string.format("ExpChatV%sCount", (string.gsub(v1 or "0", "%p", {
        ["."] = "_"
    }))));
end;
