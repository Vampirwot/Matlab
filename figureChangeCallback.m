function figureChangeCallback(src,callbackdata,text,leftarrow,text1,leftarrow1)
if exist('leftarrow')==1 
    set(text,'Position',[leftarrow.Extent(1)+leftarrow.Extent(3),leftarrow.Extent(2)+leftarrow.Extent(4)])
end
if exist('leftarrow1')==1 
    set(text1,'Position',[leftarrow1.Extent(1)+leftarrow1.Extent(3),leftarrow1.Extent(2)+leftarrow1.Extent(4)])
end
end