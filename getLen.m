function [len] = getLen(s)
    if ischar(s) && (isempty(s) || isrow(s))
            len = numel(s);
        elseif iscell(s)
            len = zeros(size(s));
            for idx = 1:numel(s)
                element = s{idx};
                if ischar(element) && (isempty(element) || isrow(element))
                    len(idx) = numel(element);
                end
            end
    end
end