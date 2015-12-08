function T = TestDatabase(TrainDatabasePath,i)
T = [];
disp('Loading Faces');
    
    for j=1:7
    si=int2str(i);
    sj=int2str(2*j);
    str = strcat(TrainDatabasePath,'\');
    str=strcat(str,si,'-');
        if((2*j)<10)
        str = strcat(str,'0',sj);
        str = strcat(str,'.jpg');
        end
        if((2*j)>=10)
        str = strcat(str,sj);
        str = strcat(str,'.jpg');
        end
        
        img = imread(str);
        img = rgb2gray(img);
        [irow icol] = size(img);
        temp = reshape(img',irow*icol,1);   % Reshaping 2D images into 1D image vectors
        T = [T temp]; % 'T' grows after each turn                    
    end
end

