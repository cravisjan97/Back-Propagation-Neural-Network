function T = singleimage(TrainDatabasePath)
 
%no_images=size(dir([TrainDatabasePath,'\*']),1)-size(dir([TrainDatabasePath,'\*m']),1)-2;
T = [];
disp('Loading Faces');
for i = 1 : 1
    %{
        stk = int2str(i);
    disp(stk);
    stk = strcat(stk,'.jpg');
     str = strcat(TrainDatabasePath,'\',stk);
    %folder_content = dir ([TrainDatabasePath,stk]);
    %nface = size (folder_content,1);
    %}
    img = imread(TrainDatabasePath);
    img = rgb2gray(img);
    
    [irow icol] = size(img);
   
    temp = reshape(img',irow*icol,1);   % Reshaping 2D images into 1D image vectors
    T = [T temp]; % 'T' grows after each turn                    
end

  %{ 
    disp(nface);
   for j = 1 :  nface
     I have chosen the name of each image in databases as a corresponding
     number. However, it is not mandatory!
    str = int2str(j);
    str = strcat('\',str,'.jpg');
    str = strcat('\s',int2str(i),str);
    str = strcat(TrainDatabasePath,str);
    img = imread(str);
    img = rgb2gray(img);
    
    [irow icol] = size(img);
   
    temp = reshape(img',irow*icol,1);    Reshaping 2D images into 1D image vectors
    T = [T temp];  'T' grows after each turn                    
   end
%}

end

