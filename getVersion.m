function [dateNum] = getVersion()
    v = version('-date');
    startIndex = strfind(v,', ');
    date = v(startIndex+2:end);
    dateNum = str2num(date);
end

