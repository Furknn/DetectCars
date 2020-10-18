function [narr,ioMx]=mergeIntersections(arr,intersectionThreshold)
ioMx=detectIntersection(arr,intersectionThreshold);
newArr=[];
visitedIdx=[];
for i=1:size(ioMx,1)
    for j=1:size(ioMx,1)
        if((ismember(i,visitedIdx)==0)&&(i~=j)&&(ioMx(i,j)==1||ioMx(j,i)==1))
            visitedIdx=[visitedIdx; j i];
            newArr=[newArr;min(arr(i,1),arr(j,1)) ,max(arr(i,2),arr(j,2)),min(arr(i,3),arr(j,3)),max(arr(i,4),arr(j,4))];

        end
           % newArr=[newArr;arr(i,1) ,arr(i,2),arr(i,3),arr(i,4)];

    end
end

for i=1:size(ioMx,1)
    if(ismember(i,visitedIdx)==0)
         newArr=[newArr;arr(i,1) ,arr(i,2),arr(i,3),arr(i,4)];
    end
end

narr=newArr;